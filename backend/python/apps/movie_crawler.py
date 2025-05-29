#!/usr/bin/env python3
import requests
import mysql.connector
from datetime import datetime, timedelta
import time
import random
from bs4 import BeautifulSoup
from urllib.parse import quote
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

# ─── API KEYS ──────────────────────────────────────────────────────────────────
TMDB_API_KEY      = "e392deb18e9722ad32c02f8ff2271713"
WATCHMODE_API_KEY = "fIm3b66TxKNitVw0wdVPe48qxfEDuc5GXWWYMwUm"
OMDB_API_KEY      = "b5b340f"
KOBIS_API_KEY     = "6242abbddc890b818295b03ddc6360bb"  # 올바른 키로 수정

# ─── MySQL 연결 정보 ────────────────────────────────────────────────────────────
DB_CONFIG = {
    "host":     "database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com",
    "user":     "root",      # 필요시 사용자명/비번 변경
    "password": "qkrjtd258",
    "database": "movie_db",
}

# ─── 세션 및 재시도 설정 ─────────────────────────────────────────────────────────
session = requests.Session()
retry_strategy = Retry(
    total=3,
    backoff_factor=1,
    status_forcelist=[429, 500, 502, 503, 504],
    allowed_methods=["HEAD", "GET", "OPTIONS"]
)
adapter = HTTPAdapter(max_retries=retry_strategy)
session.mount("http://", adapter)
session.mount("https://", adapter)

# ─── 포스터 추출 함수들 ─────────────────────────────────────────────────────────
def get_poster_from_tmdb(title, year=None):
    """
    TMDB에서 영화 검색 → 첫 번째 결과 포스터 경로 반환.
    year를 넘기면 primary_release_year 필터 적용.
    """
    params = {
        "api_key": TMDB_API_KEY,
        "query": quote(title)
    }
    if year:
        params["primary_release_year"] = year

    try:
        r = session.get(
            "https://api.themoviedb.org/3/search/movie",
            params=params,
            timeout=10
        )
        r.raise_for_status()
        results = r.json().get("results") or []
        if results and results[0].get("poster_path"):
            return "https://image.tmdb.org/t/p/w500" + results[0]["poster_path"]
    except:
        pass
    return None

def get_poster_from_watchmode(title):
    try:
        base = "https://api.watchmode.com/v1"
        s = session.get(
            f"{base}/search/?apiKey={WATCHMODE_API_KEY}"
            f"&search_field=name&search_value={quote(title)}",
            timeout=10
        )
        s.raise_for_status()
        data = s.json().get("title_results") or []
        if data:
            wm_id = data[0].get("id")
            det = session.get(
                f"{base}/title/{wm_id}/details/?apiKey={WATCHMODE_API_KEY}",
                timeout=10
            )
            det.raise_for_status()
            pic = det.json().get("poster_url")
            if pic:
                return pic
    except:
        pass
    return None

def get_poster_from_omdb(title):
    try:
        r = session.get(
            f"http://www.omdbapi.com/?t={quote(title)}&apikey={OMDB_API_KEY}",
            timeout=10
        )
        r.raise_for_status()
        p = r.json().get("Poster")
        if p and p != "N/A":
            return p
    except:
        pass
    return None

def fetch_poster(title, title_en=None, year=None):
    """
    1) TMDB, 2) Watchmode, 3) OMDB 순으로 시도.
    TMDB는 year 필터 적용.
    """
    p = get_poster_from_tmdb(title, year)
    if p:
        return p
    p = get_poster_from_watchmode(title)
    if p:
        return p
    # 영어 제목이 있으면 우선 사용
    if title_en:
        p = get_poster_from_omdb(title_en)
        if p:
            return p
    # 마지막으로 한글 제목으로 다시 시도
    p = get_poster_from_omdb(title)
    return p or "https://via.placeholder.com/100x140?text=No+Image"

# ─── 박스오피스 API ─────────────────────────────────────────────────────────────
def get_weekly_movies(target_dt):
    url = (
        "http://www.kobis.or.kr/kobisopenapi/webservice/rest"
        "/boxoffice/searchWeeklyBoxOfficeList.json"
    )
    params = {"key": KOBIS_API_KEY, "targetDt": target_dt, "weekGb": "0"}
    try:
        r = session.get(url, params=params, timeout=10)
        r.raise_for_status()
        return r.json().get("boxOfficeResult", {}).get("weeklyBoxOfficeList", [])
    except:
        return []

def get_previous_sunday(from_date):
    offset = (from_date.weekday() + 1) % 7
    return (from_date - timedelta(days=offset)).strftime("%Y%m%d")

# ─── 메인 처리 ─────────────────────────────────────────────────────────────────
def main():
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()
    seen = set()
    movies = []
    current_date = datetime.now() - timedelta(days=1)

    while len(movies) < 300:
        sunday = get_previous_sunday(current_date)
        weekly = get_weekly_movies(sunday)

        for w in weekly:
            code = w.get("movieCd")
            if not code or code in seen:
                continue
            seen.add(code)
            title = w.get("movieNm")

            # 상세 정보 조회
            try:
                info_res = session.get(
                    "http://www.kobis.or.kr/kobisopenapi/webservice/rest"
                    "/movie/searchMovieInfo.json",
                    params={"key": KOBIS_API_KEY, "movieCd": code},
                    timeout=10
                )
                info_res.raise_for_status()
                info = info_res.json().get("movieInfoResult", {}).get("movieInfo", {})
            except:
                continue

            # ── 등급·장르 필터링 ─────────────────────────────────────
            audits = info.get("audits", [])
            grade  = audits[0].get("watchGradeNm", "") if audits else ""
            genre  = (info.get("genres") or [{}])[0].get("genreNm", "")
            if ("청소년관람불가" in grade or "19" in grade
               or genre in ("다큐멘터리", "성인", "에로")):
                continue

            # ── 개봉일 필터: 2020~2025 ───────────────────────────────
            raw_dt = info.get("openDt", "")
            if not raw_dt or raw_dt < "20200101" or raw_dt > "20251231":
                continue
            open_dt = f"{raw_dt[:4]}-{raw_dt[4:6]}-{raw_dt[6:]}"

            # ── 기타 정보 추출 ────────────────────────────────────────
            show_tm   = int(info.get("showTm") or 0)
            title_en  = info.get("movieNmEn", "").strip()
            release_year = int(raw_dt[:4])
            poster    = fetch_poster(title, title_en, release_year)
            rating    = round(random.uniform(7, 10), 1)

            movies.append((code, title, open_dt, show_tm, genre, rating, poster))
            print(f"{len(movies):02d}. {title} ({open_dt}) → {poster}")

            time.sleep(0.2)
            if len(movies) >= 300:
                break

        current_date -= timedelta(days=7)

    # ── DB 저장 ────────────────────────────────────────────────────────────────
    sql = """
    INSERT IGNORE INTO movie_tbl
      (m_seqno, m_movie_cd, m_title, m_open_dt, m_show_tm, m_genre_nm, m_rating, m_poster_url)
    VALUES (NULL, %s, %s, %s, %s, %s, %s, %s)
    """
    cursor.executemany(sql, movies)
    conn.commit()
    cursor.close()
    conn.close()
    print("모두 저장 완료.")

if __name__ == "__main__":
    main()