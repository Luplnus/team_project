import mysql.connector

def get_theaters():
    conn = mysql.connector.connect(
        host='database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com',
        user='root',
        password='qkrjtd258',
        database='movie_db'
    )
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT
            t_title,
            t_start_date,
            t_end_date,
            t_venue,
            t_genre,
            t_poster
        FROM theater_tbl
        ORDER BY t_start_date DESC
        LIMIT 50
    """)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result