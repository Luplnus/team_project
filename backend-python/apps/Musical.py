import mysql.connector

def get_musicals():
    conn = mysql.connector.connect(
        host='database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com',
        user='root',
        password='qkrjtd258',
        database='movie_db'
    )
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT
            mu_title,
            mu_prfpdfrom,
            mu_prfpdto,
            mu_venue,
            mu_genre,
            mu_poster
        FROM musical_tbl
        ORDER BY mu_prfpdfrom DESC
        LIMIT 50
    """)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result