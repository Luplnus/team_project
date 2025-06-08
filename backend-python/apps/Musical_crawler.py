import requests
import xml.etree.ElementTree as ET
import mysql.connector
from datetime import datetime, timedelta
import time
import sys

# API 설정
KOPIS_API_KEY = 'c21a35609f1b43aa99973a0527d3024f'  # API 키 확인 필요


def fetch_performances(stdate: str, eddate: str, page: int = 1, rows: int = 100):
    """KOPIS API에서 공연 정보를 가져옵니다."""
    url = (
        "http://www.kopis.or.kr/openApi/restful/pblprfr"
        f"?service={KOPIS_API_KEY}"
        f"&stdate={stdate}&eddate={eddate}"
        f"&shcate=GGGA"  # GGGA = 뮤지컬 (코드 확인 필요)
        f"&cpage={page}&rows={rows}"
    )

    # 디버깅용 URL 출력
    print(f"[DEBUG] API URL: {url}")

    try:
        # 재시도 횟수 증가 및 타임아웃 설정
        for attempt in range(3):
            try:
                r = requests.get(url, timeout=30)
                r.encoding = 'utf-8'

                # 응답 상태 체크
                if r.status_code != 200:
                    print(f"[ERROR] API 응답 오류: HTTP {r.status_code}")
                    print(f"[ERROR] 응답 내용: {r.text[:200]}...")
                    time.sleep(2)
                    continue

                # 디버깅용 응답 출력
                print(f"[DEBUG] API 응답 (처음 200자): {r.text[:200]}...")

                # 디버깅: 응답에 날짜 정보가 있는지 확인
                if 'prfpdfrom' not in r.text or 'prfpdto' not in r.text:
                    print("[WARNING] 응답에 날짜 정보가 없을 수 있습니다!")

                # XML 파싱 시도
                try:
                    root = ET.fromstring(r.text)
                    return root
                except ET.ParseError as e:
                    print(f"[ERROR] XML 파싱 오류: {e}")
                    print(f"[ERROR] 응답 내용: {r.text[:200]}...")
                    time.sleep(2)
                    continue

            except requests.exceptions.RequestException as e:
                print(f"[ERROR] 요청 실패 (시도 {attempt + 1}/3): {e}")
                time.sleep(2)

        # 모든 재시도 실패
        print("[ERROR] API 요청이 모두 실패했습니다.")
        return None

    except Exception as e:
        print(f"[ERROR] 예상치 못한 오류 발생: {e}")
        return None


def parse_db_nodes(root):
    """XML 응답에서 공연 정보를 추출합니다."""
    if root is None:
        return []

    records = []

    # 먼저 XML 구조 확인
    print(f"[DEBUG] XML 루트 태그: {root.tag}")
    print(f"[DEBUG] 자식 태그들: {[child.tag for child in root]}")

    # 노드 검색 경로 수정 (구조에 따라 달라질 수 있음)
    db_nodes = root.findall('.//db')
    if not db_nodes:
        # 대체 경로 시도
        db_nodes = root.findall('./db')
    if not db_nodes:
        # 또 다른 대체 경로 시도
        db_nodes = root.findall('./*/db')

    print(f"[DEBUG] 발견된 db 노드 수: {len(db_nodes)}")

    # 샘플 노드의 XML 내용 디버깅 출력
    if db_nodes:
        sample_node = db_nodes[0]
        print(f"[DEBUG] 샘플 노드 XML:")
        for child in sample_node:
            print(f"  - {child.tag}: {child.text}")

    for node in db_nodes:
        try:
            # 필수 ID 확인
            mt20id = node.findtext('mt20id')
            if not mt20id:
                print("[WARNING] mt20id가 없는 노드 발견, 건너뜀")
                continue

            # 필드 추출 (각 필드에 대해 디버깅 정보 추가)
            title = node.findtext('prfnm')
            print(f"[DEBUG] 제목: {title}")

            # 날짜 필드 원본 데이터 검출 추가
            raw_from_elem = node.find('prfpdfrom')
            raw_to_elem = node.find('prfpdto')

            # 날짜 요소 존재 확인 및 디버깅
            if raw_from_elem is None:
                print("[WARNING] prfpdfrom 요소가 없습니다")
                raw_from = ""
            else:
                raw_from = raw_from_elem.text or ""
                print(f"[DEBUG] 원본 시작일: '{raw_from}'")

            if raw_to_elem is None:
                print("[WARNING] prfpdto 요소가 없습니다")
                raw_to = ""
            else:
                raw_to = raw_to_elem.text or ""
                print(f"[DEBUG] 원본 종료일: '{raw_to}'")

            # 날짜 형식 변환 개선
            start_dt = None
            end_dt = None

            # 시작일 처리
            if raw_from and raw_from.strip():
                try:
                    # 날짜 형식 정리 (공백, 특수문자 제거)
                    clean_from = ''.join(c for c in raw_from if c.isdigit())
                    if len(clean_from) >= 8:  # 최소 8자리 (YYYYMMDD)
                        start_dt = f"{clean_from[:4]}-{clean_from[4:6]}-{clean_from[6:8]}"
                        print(f"[DEBUG] 변환된 시작일: {start_dt}")
                    else:
                        print(f"[WARNING] 시작일 형식 오류: '{raw_from}' -> '{clean_from}'")
                except Exception as e:
                    print(f"[ERROR] 시작일 파싱 오류: {e}")
            else:
                print(f"[WARNING] 시작일이 비어있음")

            # 종료일 처리
            if raw_to and raw_to.strip():
                try:
                    # 날짜 형식 정리 (공백, 특수문자 제거)
                    clean_to = ''.join(c for c in raw_to if c.isdigit())
                    if len(clean_to) >= 8:  # 최소 8자리 (YYYYMMDD)
                        end_dt = f"{clean_to[:4]}-{clean_to[4:6]}-{clean_to[6:8]}"
                        print(f"[DEBUG] 변환된 종료일: {end_dt}")
                    else:
                        print(f"[WARNING] 종료일 형식 오류: '{raw_to}' -> '{clean_to}'")
                except Exception as e:
                    print(f"[ERROR] 종료일 파싱 오류: {e}")
            else:
                print(f"[WARNING] 종료일이 비어있음")

            # 추가 필드 추출
            venue = node.findtext('fcltynm')
            poster = node.findtext('poster')
            genre = node.findtext('genrenm')

            # 날짜 유효성 최종 검증 (공연정보에서는 날짜가 필수일 가능성이 높음)
            if not start_dt or not end_dt:
                print(f"[WARNING] 날짜 정보 누락 - ID: {mt20id}, 제목: '{title}', 시작일: {start_dt}, 종료일: {end_dt}")
                # 필요시 여기서 skip 처리도 가능

            # 디버깅 정보
            print(f"[DEBUG] 파싱된 뮤지컬: '{title}' ({mt20id}), 기간: {start_dt} ~ {end_dt}")

            records.append((mt20id, title, start_dt, end_dt, venue, poster, genre))
        except Exception as e:
            print(f"[ERROR] 노드 파싱 중 오류 발생: {e}")
            continue

    return records


def save_to_db(records):
    """파싱된 레코드를 데이터베이스에 저장합니다."""
    if not records:
        print("[LOG] 저장할 레코드가 없습니다.")
        return 0

    try:
        # 데이터베이스 연결
        conn = mysql.connector.connect(
            host='database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com',
            user='root',
            password='qkrjtd258',
            database='movie_db'
        )

        # 데이터베이스 연결 테스트
        if not conn.is_connected():
            print("[ERROR] 데이터베이스에 연결할 수 없습니다.")
            return 0

        print("[LOG] 데이터베이스 연결 성공")

        cur = conn.cursor()

        # 테이블 존재 여부 확인
        cur.execute("SHOW TABLES LIKE 'musical'")
        if not cur.fetchone():
            print("[ERROR] 'musical' 테이블이 존재하지 않습니다.")
            conn.close()
            return 0

        # 테이블 구조 확인
        cur.execute("DESCRIBE musical")
        columns = [column[0] for column in cur.fetchall()]
        expected_columns = ['mu_id', 'mu_title', 'mu_prfpdfrom', 'mu_prfpdto', 'mu_venue', 'mu_poster', 'mu_genre']
        missing_columns = [col for col in expected_columns if col not in columns]

        if missing_columns:
            print(f"[ERROR] 테이블에 필요한 컬럼이 없습니다: {', '.join(missing_columns)}")
            conn.close()
            return 0

        # 저장 전 데이터 유효성 검사
        valid_records = []
        for record in records:
            # 날짜 필드가 None인 경우 처리
            # 필요에 따라 여기서 기본값을 설정하거나, 레코드를 건너뛸 수 있음
            mt20id, title, start_dt, end_dt, venue, poster, genre = record

            # 날짜 필드 검증 및 보정
            if not start_dt:
                print(f"[WARNING] 시작일이 없는 레코드 (ID: {mt20id}, 제목: {title})")
                # 기본값 설정 예시: start_dt = '1900-01-01'

            if not end_dt:
                print(f"[WARNING] 종료일이 없는 레코드 (ID: {mt20id}, 제목: {title})")
                # 기본값 설정 예시: end_dt = '2099-12-31'

            # 유효한 레코드만 추가 (필요에 따라 조정)
            valid_records.append(record)

        print(f"[LOG] 총 {len(valid_records)}/{len(records)} 레코드가 유효성 검사를 통과했습니다.")

        # 데이터 삽입
        sql = """
              INSERT INTO musical_tbl
              (mu_id, mu_title, mu_prfpdfrom, mu_prfpdto, mu_venue, mu_poster, mu_genre)
              VALUES (%s, %s, %s, %s, %s, %s, %s) ON DUPLICATE KEY \
              UPDATE \
                  mu_title = \
              VALUES (mu_title), mu_prfpdfrom = \
              VALUES (mu_prfpdfrom), mu_prfpdto = \
              VALUES (mu_prfpdto), mu_venue = \
              VALUES (mu_venue), mu_poster = \
              VALUES (mu_poster), mu_genre = \
              VALUES (mu_genre) \
              """

        # 배치 크기로 나누어 삽입 (큰 데이터셋의 경우)
        batch_size = 100
        inserted_count = 0

        for i in range(0, len(valid_records), batch_size):
            batch = valid_records[i:i + batch_size]
            try:
                cur.executemany(sql, batch)
                conn.commit()
                inserted_count += len(batch)
                print(f"[LOG] {len(batch)}개 레코드 처리 완료 (총 {inserted_count}/{len(valid_records)})")
            except mysql.connector.Error as e:
                print(f"[ERROR] 데이터베이스 삽입 중 오류 발생: {e}")
                conn.rollback()

        conn.close()
        return inserted_count

    except mysql.connector.Error as e:
        print(f"[ERROR] 데이터베이스 연결 또는 처리 중 오류 발생: {e}")
        return 0
    except Exception as e:
        print(f"[ERROR] 예상치 못한 오류 발생: {e}")
        return 0


def fetch_performance_detail(mt20id):
    """특정 공연의 상세 정보를 가져옵니다."""
    url = (
        "http://www.kopis.or.kr/openApi/restful/pblprfr"
        f"/{mt20id}"
        f"?service={KOPIS_API_KEY}"
    )

    print(f"[DEBUG] 상세정보 API URL: {url}")

    try:
        r = requests.get(url, timeout=30)
        r.encoding = 'utf-8'

        if r.status_code != 200:
            print(f"[ERROR] 상세정보 API 응답 오류: HTTP {r.status_code}")
            return None

        print(f"[DEBUG] 상세정보 API 응답 (처음 200자): {r.text[:200]}...")

        try:
            root = ET.fromstring(r.text)
            return root
        except ET.ParseError as e:
            print(f"[ERROR] 상세정보 XML 파싱 오류: {e}")
            return None

    except Exception as e:
        print(f"[ERROR] 상세정보 요청 중 오류 발생: {e}")
        return None


def get_missing_dates():
    """데이터베이스에서 날짜 정보가 없는 레코드를 조회합니다."""
    try:
        conn = mysql.connector.connect(
            host='database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com',
            user='root',
            password='qkrjtd258',
            database='movie_db'
        )

        if not conn.is_connected():
            print("[ERROR] 데이터베이스에 연결할 수 없습니다.")
            return []

        cur = conn.cursor()

        # 날짜 필드가 NULL인 레코드 조회
        sql = """
              SELECT mu_id, mu_title \
              FROM musical
              WHERE mu_prfpdfrom IS NULL \
                 OR mu_prfpdto IS NULL LIMIT 50  # 한 번에 처리할 수량 제한 \
              """

        cur.execute(sql)
        records = cur.fetchall()
        conn.close()

        print(f"[LOG] 날짜 정보가 없는 레코드 {len(records)}개 발견")
        return records

    except Exception as e:
        print(f"[ERROR] 데이터베이스 조회 중 오류 발생: {e}")
        return []


def update_missing_dates():
    """날짜 정보가 없는 레코드를 상세 API를 통해 업데이트합니다."""
    records = get_missing_dates()

    if not records:
        print("[LOG] 업데이트할 레코드가 없습니다.")
        return

    updates = []

    for mt20id, title in records:
        print(f"[LOG] '{title}' ({mt20id}) 상세정보 요청 중...")

        # API 요청 간격
        time.sleep(1)

        # 상세 정보 요청
        detail = fetch_performance_detail(mt20id)
        if not detail:
            print(f"[WARNING] {mt20id} 상세정보를 가져오지 못했습니다.")
            continue

        # 날짜 정보 추출
        try:
            # 상세 정보에서 날짜 필드 추출 (태그가 다를 수 있음)
            raw_from = detail.findtext('.//prfpdfrom') or detail.findtext('.//prfpd_from') or ""
            raw_to = detail.findtext('.//prfpdto') or detail.findtext('.//prfpd_to') or ""

            print(f"[DEBUG] 상세정보에서 추출한 날짜 - 시작: '{raw_from}', 종료: '{raw_to}'")

            # 날짜 형식 변환
            start_dt = None
            end_dt = None

            if raw_from and raw_from.strip():
                clean_from = ''.join(c for c in raw_from if c.isdigit())
                if len(clean_from) >= 8:
                    start_dt = f"{clean_from[:4]}-{clean_from[4:6]}-{clean_from[6:8]}"

            if raw_to and raw_to.strip():
                clean_to = ''.join(c for c in raw_to if c.isdigit())
                if len(clean_to) >= 8:
                    end_dt = f"{clean_to[:4]}-{clean_to[4:6]}-{clean_to[6:8]}"

            if start_dt or end_dt:
                updates.append((start_dt, end_dt, mt20id))
                print(f"[LOG] 날짜 정보 발견: {start_dt} ~ {end_dt}")
            else:
                print(f"[WARNING] 상세정보에서도 날짜를 찾을 수 없습니다: {mt20id}")

        except Exception as e:
            print(f"[ERROR] 상세정보 파싱 중 오류 발생: {e}")

    # 데이터베이스 업데이트
    if updates:
        try:
            conn = mysql.connector.connect(
                host='localhost',
                user='bitstudy',
                password='0000',
                database='movie_db'
            )

            cur = conn.cursor()

            sql = """
                  UPDATE musical
                  SET mu_prfpdfrom = %s, \
                      mu_prfpdto   = %s
                  WHERE mu_id = %s \
                  """

            cur.executemany(sql, updates)
            conn.commit()

            print(f"[LOG] {len(updates)}개 레코드의 날짜 정보가 업데이트되었습니다.")
            conn.close()

        except Exception as e:
            print(f"[ERROR] 데이터베이스 업데이트 중 오류 발생: {e}")


def main():
    """메인 함수: 날짜 범위를 나누어 데이터 수집"""
    # 명령행 인수 처리
    # 기본값: 일반 수집 모드
    mode = "collect"

    if len(sys.argv) > 1:
        if sys.argv[1] == "--update-dates":
            mode = "update_dates"

    if mode == "update_dates":
        print("[LOG] 날짜 정보 업데이트 모드로 실행합니다.")
        update_missing_dates()
        return

    # 일반 수집 모드
    # 1) 기간 설정 - 더 작은 범위로 나누기
    start = datetime(2024, 10, 1)
    end = datetime(2025, 5, 19)  # 현재 날짜나 더 작은 범위로 변경 고려
    delta = timedelta(days=30)  # 더 작은 간격으로 변경

    print(f"[LOG] 수집 기간: {start.strftime('%Y-%m-%d')} ~ {end.strftime('%Y-%m-%d')}")

    all_records = []
    current = start

    while current <= end:
        chunk_end = min(current + delta, end)
        st = current.strftime("%Y%m%d")
        ed = chunk_end.strftime("%Y%m%d")

        print(f"\n[LOG] 기간 {st} ~ {ed} 데이터 요청 중...")

        # API 호출 및 데이터 추출
        root = fetch_performances(st, ed)

        if root is not None:
            recs = parse_db_nodes(root)
            print(f"[LOG] 기간 {st} ~ {ed}에서 {len(recs)}개 항목 발견")
            all_records.extend(recs)
            if len(all_records) >= 80:
                print(f"[LOG] 80개 이상 수집됨, 조기 종료")
                break
        else:
            print(f"[WARNING] 기간 {st} ~ {ed} 데이터 요청 실패, 다음 기간으로 넘어갑니다")

        # API 요청 간 간격 추가
        time.sleep(1)
        current = chunk_end + timedelta(days=1)

    # 데이터 저장
    total_records = len(all_records)
    print(f"\n[LOG] 총 수집된 뮤지컬 건수: {total_records}")

    if total_records > 0:
        saved_count = save_to_db(all_records)
        print(f"[LOG] DB에 저장된 뮤지컬 건수: {saved_count}/{total_records}")
    else:
        print("[WARNING] 수집된 데이터가 없어 DB 저장을 건너뜁니다")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n[LOG] 사용자에 의해 프로그램이 중단되었습니다.")
        sys.exit(0)
    except Exception as e:
        print(f"[ERROR] 프로그램 실행 중 예상치 못한 오류 발생: {e}")
        sys.exit(1)