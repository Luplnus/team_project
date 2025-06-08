<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <title>영화페이지</title>
    <style>
        body {
            user-select: none;
            margin: 0;
            overflow-x: hidden;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #000;
        }
        #wrap {
            width: 100%;
            background-color: #000;
            position: relative;
            overflow: hidden;
            border: none;
        }
        .main_menu {
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
            position: relative;
            z-index: 20;
            background-color: rgba(0, 0, 0, 0.8);
        }

        .h_menubox {
            max-width: 1285px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-sizing: border-box;
            padding: 0 10px;
        }

        .main_logo h2 {
            margin: 0;
            width: 70px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            color: #fff;
            box-sizing: border-box;
            font-weight: bold;
        }

        .menu_bar {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            box-sizing: border-box;
            justify-content: flex-end;
            flex: 1;
        }

        .menu_box {
            width: 80px;
            height: 35px;
            margin: 0 15px;
            text-align: center;
            line-height: 35px;
            color: #fff;
            box-sizing: border-box;
            cursor: pointer;
            transition: color 0.3s;
            font-size: 15px;
        }

        .menu_box:hover {
            color: #E50914;
        }

        .content {
            width: 100px;
            height: 30px;
            display: flex;
            justify-content: space-around;
        }

        .content_box {
            width: 30px;
            line-height: 35px;
            text-align: center;
            color: #fff;
        }

        .content_box a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

        .view_box {
            width: 100%;
            height: calc(100% - 50px);
            position: relative;
        }

        .movie_banner {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.8;
            filter: brightness(0.8);
        }

        .tag_mv {
            font-weight: bold;
            font-size: 30px;
            color: #fff;
            margin-left: 20px; /* 추가: 가독성을 위해 여백 추가 */
            margin-top: 30px; /* 추가: 가독성을 위해 여백 추가 */
        }

        .movie-slide {
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 204px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            transition: transform 0.3s;
            border: 1px solid;
        }

        .movie-slide:hover {
            transform: scale(1.05);
        }

        .movie-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .swiper-wrapper{
            width: 100%;
        }

        /* 영화 팝업창 스타일 */
        .movie_popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 100;
            display: block;
            background-color: rgba(0, 0, 0, 0.8);
            overflow-y: auto;
            transform: translateX(-100%);
            transition: transform 0.5s ease;
            visibility: hidden;
        }

        .movie_popup.active {
            visibility: visible;
            transform: translateX(0);
        }

        .container {
            width: 100%;
            padding: 60px 0;
            min-height: 100%;
            box-sizing: border-box;
        }

        .movie_popup::-webkit-scrollbar {
            width: 12px;
        }

        .movie_popup::-webkit-scrollbar-track {
            background: rgba(51, 51, 51, 0.5);
            border-radius: 10px;
        }

        .movie_popup::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.4);
            border-radius: 10px;
            border: 2px solid rgba(51, 51, 51, 0.5);
        }

        .movie_popup::-webkit-scrollbar-thumb:hover {
            background: rgba(255, 255, 255, 0.6);
        }

        .movie_popup::-webkit-scrollbar-button {
            display: none;
        }

        .view_area {
            width: 100%;
            max-width: 1035px;
            position: relative;
            background: #000;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        }

        .mv_views {
            height: 560px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #000;
            position: relative;
            border-bottom: 1px solid #333;
        }

        .mvbanner_img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .slider-container {
            width: 100%;
            position: relative;
            overflow: hidden;
            background: #212121;
            padding: 10px 0;
            border-bottom: 1px solid #333;
        }

        .popup-swiper {
            width: 100%;
            height: 180px;
        }

        .popup-slide {
            text-align: center;
            font-size: 16px;
            background: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 160px;
            border-radius: 4px;
            overflow: hidden;
            transition: transform 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
        }

        .popup-slide:hover {
            transform: scale(1.03);
        }

        .swiper .popup-slide {
            width: 32%;
        }

        .title_line {
            display: flex;
            align-items: center;
            padding: 15px;
            background: #1a1a1a;
            border-bottom: 1px solid #333;
        }

        .runtime {
            display: flex;
            justify-content: flex-end;
            width: 890px;
            /*font-weight: bold;*/
            color: #ddd;
        }

        .mv_time {
            margin-left: 5px;
        }

        .title_item {
            margin-right: 20px;
            font-size: 16px;
            color: #ddd;
        }

        .title_item:first-child {
            font-weight: bold;
            color: #ffcc00;
        }

        .storyline {
            padding: 15px;
            margin-top: 15px;
            line-height: 1.6;
            background: #262626;
            border-radius: 4px;
        }

        .ext_info {
            background: #212121;
            color: #fff;
            border-radius: 0 0 8px 8px;
            height: auto;
            overflow: visible;
        }

        .popup-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .info {
            padding: 15px;
            line-height: 1.6;
        }

        .description {
            margin-bottom: 20px;
            color: #ccc;
        }

        .datalist {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-bottom: 20px;
        }

        .data_item {
            display: flex;
            flex-direction: column;
        }

        .data_label {
            font-size: 14px;
            color: #999;
            margin-bottom: 5px;
        }

        .data_value {
            color: #fff;
        }

        .cast {
            margin-top: 20px;
        }

        .plot_title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #ffcc00;
        }

        .close-popup {
            position: fixed;
            top: 15px;
            right: 15px;
            width: 40px;
            height: 40px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 24px;
            cursor: pointer;
            z-index: 150;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .close-popup:hover {
            background: rgba(255, 0, 0, 0.6);
        }

        .banner-swiper {
            width: 100%;
            height: 895px;
        }

        .banner-slide {
            text-align: center;
            font-size: 18px;
            background: #000;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .banner-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.8;
        }

        .content_info {
            position: absolute;
            bottom: 175px;
            left: 330px;
            width: 60%;
            z-index: 10;
            text-align: left;
            color: white;
        }

        .content_badge {
            margin-bottom: 10px;
        }

        .badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: bold;
            margin-right: 8px;
            text-transform: uppercase;
        }

        .badge.new {
            background-color: #E50914;
        }

        .badge.hot {
            background-color: #FFA500;
        }

        .ttl_nm {
            font-size: 48px;
            margin: 0 0 15px 0;
            font-weight: 700;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
            color: white;
        }

        .content_meta {
            margin-bottom: 20px;
            font-size: 16px;
            opacity: 0.9;
            color: white;
        }

        .content_meta span {
            margin-right: 15px;
            position: relative;
        }

        .content_meta span:not(:last-child):after {
            content: "•";
            position: absolute;
            right: -10px;
        }

        .rating {
            color: #FFC107;
            font-weight: bold;
        }

        .content_desc {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 25px;
            opacity: 0.9;
            max-width: 90%;
            color: white;
        }

        .button_group {
            display: flex;
            gap: 10px;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn_primary {
            background-color: #E50914;
            color: white;
            border: none;
        }

        .btn_primary:hover {
            background-color: #F40612;
        }

        .btn_outline {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
        }

        .btn_outline:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        .swiper-scrollbar-drag {
            height: 100%;
            width: 100%;
            position: relative;
            background-color: #E50914;
            border-radius: var(--swiper-scrollbar-border-radius, 10px);
            left: 0;
            top: 0;
        }

        .fot_end {
            margin-top: 40px;
            width: 100%;
            height: 400px;
            background-color: #000;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .footer_content {
            width: 80%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .footer_logo {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .footer_box {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .footer_box a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
        }

        .footer_end {
            text-align: center;
            font-size: 14px;
            opacity: 0.7;
        }

        /* 비디오 관련 스타일 수정 */
        .mv_trailer {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        .mv_trailer.show {
            opacity: 1;
        }

        .banner-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.8;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 2;
            transition: opacity 1s ease-in-out;
        }

        .banner-slide img.hide {
            opacity: 0;
        }

    </style>
</head>
<body>
<header>
    <div id="wrap">
        <div class="main_menu">
            <div class="h_menubox">
                <div class="main_logo">
                    <h2>JPIEL</h2>
                </div>
                <div class="menu_bar">
                    <div class="menu_box">영화</div>
                    <div class="menu_box">뮤지컬</div>
                    <div class="menu_box">연극</div>
                    <div class="menu_box">예매</div>
                </div>
                <div class="content">
                    <div class="content_box">
                        <a href="#">
                            <img src="./pt_img/search.svg" alt="">
                        </a>
                    </div>
                    <div class="content_box">
                        <a href="#">
                            <img src="./pt_img/user.svg" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="swiper banner-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide banner-slide">
            <video src="./videos/마인크래프트 1차 예고편.mp4" class="mv_trailer" autoplay muted loop></video>
            <img src="./pt_img/mincraft.jpg" alt="영화 이미지">
            <div class="content_info">
                <div class="content_badge">
                    <span class="badge new">NEW</span>
                    <span class="badge hot">HOT</span>
                </div>
                <h2 class="ttl_nm">영화제목 1</h2>
                <div class="content_meta">
                    <span class="rating">평점</span>
                    <span class="genre">장르</span>
                    <span class="duration">상영시간</span>
                    <span class="release">개봉일</span>
                </div>
                <p class="content_desc">
                    내용
                </p>
                <div class="button_group">
                    <a href="#" class="btn btn_primary">예매하기</a>
                    <a href="#" class="btn btn_outline">찜하기</a>
                </div>
            </div>
        </div>

        <div class="swiper-slide banner-slide">
            <video src="./videos/썬더볼츠 메인 예고편.mp4" class="mv_trailer" autoplay muted loop></video>
            <img src="./pt_img/131523285.1.jpg" alt="영화 이미지">
            <div class="content_info">
                <div class="content_badge">
                    <span class="badge new">NEW</span>
                    <span class="badge hot">HOT</span>
                </div>
                <h2 class="ttl_nm">영화제목 1</h2>
                <div class="content_meta">
                    <span class="rating">평점</span>
                    <span class="genre">장르</span>
                    <span class="duration">상영시간</span>
                    <span class="release">개봉일</span>
                </div>
                <p class="content_desc">
                    내용
                </p>
                <div class="button_group">
                    <a href="#" class="btn btn_primary">예매하기</a>
                    <a href="#" class="btn btn_outline">찜하기</a>
                </div>
            </div>
        </div>

        <div class="swiper-slide banner-slide">
            <video src="./videos/미션 임파서블_ 파이널 레코닝  예고편.mp4" class="mv_trailer" autoplay muted loop></video>
            <img src="./pt_img/미션임파서블.jpg" alt="영화 이미지">
            <div class="content_info">
                <div class="content_badge">
                    <span class="badge new">NEW</span>
                    <span class="badge hot">HOT</span>
                </div>
                <h2 class="ttl_nm">영화제목 1</h2>
                <div class="content_meta">
                    <span class="rating">평점</span>
                    <span class="genre">장르</span>
                    <span class="duration">상영시간</span>
                    <span class="release">개봉일</span>
                </div>
                <p class="content_desc">
                    내용
                </p>
                <div class="button_group">
                    <a href="#" class="btn btn_primary">예매하기</a>
                    <a href="#" class="btn btn_outline">찜하기</a>
                </div>
            </div>
        </div>

        <div class="swiper-slide banner-slide">
            <video src="./videos/파과 The Old Woman With The Knife 예고편.mp4" class="mv_trailer" autoplay muted loop></video>
            <img src="./pt_img/파과배너.jpg" alt="영화 이미지">
            <div class="content_info">
                <div class="content_badge">
                    <span class="badge new">NEW</span>
                    <span class="badge hot">HOT</span>
                </div>
                <h2 class="ttl_nm">영화제목 1</h2>
                <div class="content_meta">
                    <span class="rating">평점</span>
                    <span class="genre">장르</span>
                    <span class="duration">상영시간</span>
                    <span class="release">개봉일</span>
                </div>
                <p class="content_desc">
                    내용
                </p>
                <div class="button_group">
                    <a href="#" class="btn btn_primary">예매하기</a>
                    <a href="#" class="btn btn_outline">찜하기</a>
                </div>
            </div>
        </div>

        <div class="swiper-slide banner-slide">
            <video src="./videos/미키17 공식 한국 예고편.mp4" class="mv_trailer" autoplay muted loop></video>
            <img src="./pt_img/미키17.jpg" alt="영화 이미지">
            <div class="content_info">
                <div class="content_badge">
                    <span class="badge new">NEW</span>
                    <span class="badge hot">HOT</span>
                </div>
                <h2 class="ttl_nm">영화제목 1</h2>
                <div class="content_meta">
                    <span class="rating">평점</span>
                    <span class="genre">장르</span>
                    <span class="duration">상영시간</span>
                    <span class="release">개봉일</span>
                </div>
                <p class="content_desc">
                    내용
                </p>
                <div class="button_group">
                    <a href="#" class="btn btn_primary">예매하기</a>
                    <a href="#" class="btn btn_outline">찜하기</a>
                </div>
            </div>
        </div>
    </div>
    <div class="swiper-scrollbar"></div>
</div>
<div class="movie_popup">
    <div class="close-popup">&times;</div>
    <div class="container">
        <div class="view_area">
            <div class="mv_views">
                <img src="" alt="영화 포스터" class="mvbanner_img">
            </div>
            <div class="slider-container">
                <div class="swiper popup-swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide popup-slide">
                            <img src="/api/placeholder/400/320" alt="장면 1">
                        </div>
                        <div class="swiper-slide popup-slide">
                            <img src="/api/placeholder/400/320" alt="장면 2">
                        </div>
                        <div class="swiper-slide popup-slide">
                            <img src="/api/placeholder/400/320" alt="장면 3">
                        </div>
                        <div class="swiper-slide popup-slide">
                            <img src="/api/placeholder/400/320" alt="장면 4">
                        </div>
                        <div class="swiper-slide popup-slide">
                            <img src="/api/placeholder/400/320" alt="장면 5">
                        </div>
                        <div class="swiper-slide popup-slide">
                            <img src="/api/placeholder/400/320" alt="장면 6">
                        </div>
                    </div>
                </div>
            </div>
            <div class="ext_info">
                <div class="title_line">
                    <div class="title_item">
                        <label for="">평점</label>
                    </div>
                    <div class="title_item">
                        <label for="">개봉일</label>
                    </div>
                    <div class="runtime">
                        <label for="">상영시간</label>
                        <label for="" class="mv_time">런타임</label>
                    </div>
                </div>
                <div class="info">

                    <div class="datalist">
                        <div class="data_item">
                            <span class="data_label">관련 감독</span>
                            <span class="data_value">감독 이름</span>
                        </div>
                        <div class="data_item">
                            <span class="data_label">관련 장르</span>
                            <span class="data_value">장르</span>
                        </div>
                    </div>

                    <div class="cast"></div>

                    <div class="storyline">
                        <div class="plot_title">영화 줄거리</div>
                        <p>
                            평화로운 도시에 갑작스럽게 등장한 미스터리한 현상으로 인해 혼란에 빠진 사람들.
                            주인공은 이 현상의 원인을 파헤치기 위해 위험한 모험을 시작합니다.
                            과거의 비밀과 미래의 운명이 얽혀있는 이야기 속에서, 주인공은 자신의 정체성과
                            인류의 미래에 대한 중대한 결정을 내려야 합니다.
                            <br><br>
                            예상치 못한 반전과 감동적인 순간들이 펼쳐지며, 관객들에게 깊은 여운을 남기는
                            이 영화는 올해 최고의 기대작으로 손꼽히고 있습니다. 뛰어난 시각 효과와 심도 있는
                            캐릭터 묘사, 그리고 진정성 있는 메시지가 담긴 이 작품은 다양한 연령층의 관객들에게
                            색다른 경험을 선사할 것입니다.
                            <br><br>
                            삶의 의미와 인간 관계에 대한 깊은 고찰을 담고 있는 이 영화는 단순한 오락거리를 넘어
                            관객들에게 많은 생각거리를 던져줍니다. 흥미진진한 액션과 함께 감동적인 드라마가
                            절묘하게 어우러진 이 작품을 통해 새로운 시네마 경험을 만나보세요.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</header>

<div class="tag_mv">가족</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="/api/placeholder/400/320" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">공포(호러)</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">드라마</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">멜로/로맨스</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">뮤지컬</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">미스터리</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">범죄</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">스릴러</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">애니메이션</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">액션</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">어드벤처</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">전쟁</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<div class="tag_mv">코미디</div>
<div class="swiper movie-swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 1">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 2">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 3">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 4">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 5">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 6">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 7">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 8">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 9">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 10">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 11">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 12">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 13">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 14">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 15">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 16">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 17">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 18">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 19">
        </div>
        <div class="swiper-slide movie-slide">
            <img src="" alt="영화 이미지 20">
        </div>
    </div>
</div>
</div>

<footer>
    <div class="fot_end">
        <div class="footer_content">
            <div class="footer_logo">JPIEL</div>
            <div class="footer_box">
                <a href="#">회사소개</a>
                <a href="#">서비스이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">고객센터</a>
                <a href="#">광고문의</a>
            </div>
            <div class="footer_end">
                <span>JPIEL STUDIO</span>
            </div>
        </div>
    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>



    // banner-swiper 초기화
    var bannerSwiper = new Swiper(".banner-swiper", {
        loop: true,
        speed: 500,
        scrollbar: {
            el: ".swiper-scrollbar",
            hide: true,
        },
        on: {
            slideChangeTransitionStart: function() {
                // 모든 비디오를 리셋
                document.querySelectorAll('.mv_trailer').forEach(function(video) {
                    video.currentTime = 0;
                    video.classList.remove('show');
                });

                // 모든 이미지를 다시 보이게
                document.querySelectorAll('.banner-slide img').forEach(function(img) {
                    img.classList.remove('hide');
                });

                // 현재 활성화된 슬라이드의 비디오와 이미지 준비
                setTimeout(function() {
                    const activeSlide = document.querySelector('.swiper-slide-active');
                    if (activeSlide) {
                        const video = activeSlide.querySelector('.mv_trailer');
                        const img = activeSlide.querySelector('img');

                        if (video && img) {
                            // 1초 후 비디오 재생 및 이미지 숨김
                            setTimeout(function() {
                                video.play().then(function() {
                                    img.classList.add('hide');
                                    video.classList.add('show');
                                }).catch(function(error) {
                                    console.log('비디오 재생 실패:', error);
                                });
                            }, 1000);
                        }
                    }
                }, 1000);
            }
        }
    });

    setTimeout(function() {
        const firstSlide = document.querySelector('.swiper-slide-active');
        if (firstSlide) {
            const video = firstSlide.querySelector('.mv_trailer');
            const img = firstSlide.querySelector('img');

            if (video && img) {
                setTimeout(function() {
                    video.play().then(function() {
                        img.classList.add('hide');
                        video.classList.add('show');
                    }).catch(function(error) {
                        console.log('초기 비디오 재생 실패:', error);
                    });
                }, 1000);
            }
        }
    }, 2000); // 페이지 로드 후 2초 대기

    // movie-swiper 설정
    var movieSwiper = new Swiper(".movie-swiper", {
        slidesPerView: 5,
        spaceBetween: 30,
        freeMode: true,
        loop: true,
        speed: 800,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        breakpoints: {
            320: {
                slidesPerView: 1,
                spaceBetween: 10
            },
            640: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 20
            },
            1024: {
                slidesPerView: 4,
                spaceBetween: 30
            },
            1440: {
                slidesPerView: 5,
                spaceBetween: 30
            }
        }
    });

    // 팝업 슬라이더 설정
    var popupSwiper = new Swiper(".popup-swiper", {
        slidesPerView: 'auto',
        spaceBetween: 10,
        grabCursor: true,
        preventClicks: true,
        preventClicksPropagation: true,
        slidesOffsetBefore: 0,
        slidesOffsetAfter: 0,
        breakpoints: {
            320: {
                slidesPerView: 1.5,
                spaceBetween: 10
            },
            640: {
                slidesPerView: 2.5,
                spaceBetween: 10
            },
            800: {
                slidesPerView: 3,
                spaceBetween: 10
            }
        }
    });

    // 팝업창 열기/닫기 기능
    document.querySelectorAll('.movie-slide').forEach(function(slide) {
        slide.addEventListener('click', function() {
            const popup = document.querySelector('.movie_popup');
            popup.style.display = 'block';

            void popup.offsetWidth;
            popup.classList.add('active');

            popup.scrollTo(0, 0);

            document.body.style.overflow = 'hidden';
        });
    });


    document.querySelector('.close-popup').addEventListener('click', function() {
        const popup = document.querySelector('.movie_popup');
        popup.classList.remove('active');

        setTimeout(function() {
            if (!popup.classList.contains('active')) {
                popup.style.display = 'none';

                document.body.style.overflow = '';
            }
        }, 500); // transition 시간과 동일하게 설정
    });



    // 팝업 외부 클릭시 닫기
    document.querySelector('.movie_popup').addEventListener('click', function(event) {
        if (event.target === this) {
            this.classList.remove('active');

            setTimeout(() => {
                if (!this.classList.contains('active')) {
                    this.style.display = 'none';
                    // 바디 스크롤 다시 활성화
                    document.body.style.overflow = '';
                }
            }, 500);
        }
    });

    // 반응형 처리
    window.addEventListener('resize', function() {
        if (popupSwiper) {
            popupSwiper.update();
        }
        if (movieSwiper) {
            movieSwiper.update();
        }
        if (bannerSwiper) {
            bannerSwiper.update();
        }
    });

</script>
</body>
</html>