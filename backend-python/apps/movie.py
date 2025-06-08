import mysql.connector

def get_movies():
    conn = mysql.connector.connect(
        host='database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com',
        user='root',
        password='qkrjtd258',
        database='movie_db'
    )
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT 
            m_title,
            m_open_dt AS m_opendate,
            m_show_tm,
            m_rating,
            m_genre_nm AS m_genre,
            m_poster_url
        FROM movie_tbl
        ORDER BY m_open_dt DESC
    """)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result