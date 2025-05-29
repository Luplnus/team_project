from unicodedata import category

import requests
from flask import Flask, render_template, jsonify, Response, request, redirect
from apps import movie, Musical, theater
from flask_cors import CORS
import pymysql
from flask import Flask, request, jsonify
import socket
import sys


app = Flask(__name__)
CORS(app, resources={r"/api/*": {"origins": "*"}})

conn = pymysql.connect(
    host='database-1.cne4wicow6zn.ap-northeast-2.rds.amazonaws.com',
    user='root',
    password='qkrjtd258',
    db='movie_db',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

@app.route("/movies")
def movie_list():
    movies = movie.get_movies()
    return render_template("movie_list.html", movies=movies)
#자바 연동용
@app.route("/api/movies")
def movie_api():
    movies = movie.get_movies()
    return jsonify(movies)

#--------------------------------------------------------------------------------------------
@app.route("/musicals")
def musical_list():
    musicals = Musical.get_musicals()
    return render_template("musical_list.html", musicals=musicals)

@app.route("/api/musicals")
def musical_api():
    musicals = Musical.get_musicals() # apps/musicals.py 에서 뮤지컬 목록을 반환하는 함수
    return jsonify(musicals)

#--------------------------------------------------------------------------------------------
@app.route("/theaters")
def theater_list():
    theaters = theater.get_theaters()
    return render_template("theater_list.html", theaters=theaters)

@app.route("/api/theaters")
def theater_api():
    theaters = theater.get_theaters()
    print("RDS에서 가져온 데이터:", theaters)
    return jsonify(theaters)

#----------------------------------------------------------------
# 로그인용
@app.route('/api/login', methods=['POST', 'OPTIONS'])
def login():
    if request.method == 'OPTIONS':
        response = app.make_default_options_response()
        headers = response.headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Content-Type'
        headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS'
        return response

    # 로그인 처리
    data = request.get_json()
    username = data['username']
    password = data['password']

    cur = conn.cursor()
    cur.execute("SELECT * FROM user_tbl WHERE u_id = %s AND u_pw = %s", (username, password))
    user = cur.fetchone()

    if user:
        return jsonify(success=True)
    else:
        return jsonify(success=False, message='아이디 또는 비밀번호가 틀렸습니다')


# ----------------------------------------------------------------
# 이미지 프록시 처리
from urllib.parse import unquote

@app.route("/image-proxy")
def image_proxy():
    raw_url = request.args.get("url")
    if not raw_url:
        return "Missing URL", 400

    url = unquote(raw_url)
    print(f"[프록시 요청] {url}")  # 로그 찍기

    try:
        r = requests.get(url, headers={"User-Agent": "Mozilla/5.0"}, timeout=10)
        return Response(r.content, content_type=r.headers.get("Content-Type", "image/jpeg"))
    except requests.exceptions.Timeout:
        print("[프록시 오류] 요청 타임아웃 발생")
        return "Image fetch timed out", 504
    except Exception as e:
        print(f"[프록시 오류] 예외 발생: {e}")
        return "Image fetch failed", 500


def find_free_port(start=5000, end=5005):
    for port in range(start, end):
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
                s.bind(("0.0.0.0", port))
                return port
        except OSError:
            continue
    raise RuntimeError("5000~5004 포트가 모두 사용 중입니다.")

@app.route("/entry")
def assign_port():
    category = request.args.get("category", "movies")
    if category not in ["movies", "theater", "musical"]:
        return "Invalid category", 400

    port = find_free_port()
    return redirect(f"http://54.180.234.163:{port}/api/{category}")

if __name__ == "__main__":
    # 🔧 여기서 인자 우선 적용
    if len(sys.argv) > 1:
        port = int(sys.argv[1])
        print(f"명령줄로 지정된 포트: {port}")
    else:
        port = find_free_port()
        print(f"자동 할당된 포트: {port}")

    app.run(host="0.0.0.0", port=port, debug=False)