import requests
import xml.etree.ElementTree as ET
import mysql.connector

KOPIS_API_KEY = 'c21a35609f1b43aa99973a0527d3024f'

def fetch_performances(start_date, end_date, page=1, rows=100):
    url = (
        "http://www.kopis.or.kr/openApi/restful/pblprfr"
        f"?service={KOPIS_API_KEY}"
        f"&stdate={start_date}&eddate={end_date}"
        f"&shcate=AAAA&cpage={page}&rows={rows}"
    )
    response = requests.get(url)
    response.encoding = 'utf-8'
    return ET.fromstring(response.text)

def extract_performance_data(item):
    def get(tag): return item.find(tag).text if item.find(tag) is not None else ''
    return {
        "id": get("mt20id"),
        "title": get("prfnm"),
        "start_date": get("prfpdfrom"),
        "end_date": get("prfpdto"),
        "place": get("fcltynm"),
        "poster": get("poster"),
        "genre": get("genrenm")
    }

def save_to_table(data_list):
    conn = mysql.connector.connect(
        host='database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com',
        user='root',
        password='qkrjtd258',
        database='movie_db'
    )
    cursor = conn.cursor()

    for data in data_list:
        sql = f"""
            INSERT INTO theater (t_id, t_title, t_start_date, t_end_date, t_venue, t_poster, t_genre)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                t_title=VALUES(t_title),
                t_start_date=VALUES(t_start_date),
                t_end_date=VALUES(t_end_date),
                t_venue=VALUES(t_venue),
                t_poster=VALUES(t_poster),
                t_genre=VALUES(t_genre)
        """
        cursor.execute(sql, (
            data["id"],
            data["title"],
            data["start_date"],
            data["end_date"],
            data["place"],
            data["poster"],
            data["genre"]
        ))

    conn.commit()
    cursor.close()
    conn.close()

def main():
    start_date = "20240101"
    end_date = "20241231"
    root = fetch_performances(start_date, end_date)
    items = root.findall("db")
    data_list = [extract_performance_data(item) for item in items]
    save_to_table(data_list)
    print("연극 저장 완료")

if __name__ == "__main__":
    main()