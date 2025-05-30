<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <title>뮤지컬 페이지</title>
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
            height: 960px;
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
        
        .banner_container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        
        .musical_banner {
            width: 100%;
            height: 635px;
            display: flex;
            opacity: 1;
        }
        
        .gradient_overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                to top, 
                rgba(0,0,0,1) 0%,
                rgba(0,0,0,0.8) 15%, 
                rgba(0,0,0,0.4) 40%, 
                rgba(0,0,0,0.2) 60%,
                rgba(0,0,0,0.1) 100%
            );
            z-index: 2;
        }
        
        .view_wcht {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: auto;
            z-index: 10;
            padding-bottom: 50px;
        }

        .main-swiper {
            width: 100%;
            max-width: 2400px;
            z-index: 10;
        }
        
        .main-slide {
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 204px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            transition: transform 0.3s;
        }
        
        .main-slide:hover {
            transform: scale(1.05);
        }

        .main-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: fill;
        }

        .swiper-wrapper{
            width: 100%;
            height: 210px;
        }

        .swiper-free-mode>.swiper-wrapper {
            transition-timing-function: ease-out;
            margin-top: 5px;
        }

        .post_box {
            width: 1300px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .post_img {
            width: 1150px;
            height: 550px;
            border-radius: 10px;
            transition: filter 0.3s ease;
            filter: drop-shadow(0 15px 35px rgba(0,0,0,0.5));
            object-fit: contain;
        }

        .part_box {
            width: 650px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 40px;
            color: #fff;
            z-index: 3;
            position: relative;
        }

        .musical_title {
            font-size: 48px;
            font-weight: bold;
            margin: 0 0 15px 0;
            line-height: 1.2;
        }

        .musical_meta {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            font-size: 16px;
            color: #ccc;
        }

        .rating {
            background-color: #E50914;
            color: #fff;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            margin-right: 15px;
        }

        .year, .runtime, .genre {
            margin-right: 20px;
        }

        .musical_description {
            font-size: 18px;
            line-height: 1.5;
            margin-bottom: 30px;
            color: #e5e5e5;
            max-width: 500px;
        }

        .button_group {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }

        .btn_primary {
            background-color: #E50914;
            color: #fff;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn_primary:hover {
            background-color: #c8070f;
        }

        .btn_secondary {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            border: 2px solid rgba(255, 255, 255, 0.4);
            padding: 10px 28px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn_secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.6);
        }

        .musical_info {
            font-size: 14px;
            color: #999;
        }

        .info_row {
            margin-bottom: 8px;
        }

        .info_label {
            color: #ccc;
            font-weight: bold;
            margin-right: 8px;
        }

        /* 아이콘 스타일 */
        .icon {
            width: 18px;
            height: 18px;
            fill: currentColor;
        }

        .play-icon {
            width: 20px;
            height: 20px;
        }

        .search_none{
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            height: 100%;
        }
        .blind{
            display: none;
        }
    </style>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
                        <input type="text" class="search_box">
                        <a href="#" class="search_atag">
                            <img src="./pt_img/search.svg" alt="" class="search_icon">
                        </a>

                    </div>
                     <div class="content_box">
                       <img src="./pt_img/user.svg" alt="">
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="view_box">
            <div class="banner_container">
                <c:choose>
                    <c:when test="${not empty sessionScope.alert}">
                        <h1 class="search_none">검색 결과가 없습니다.</h1>
                    </c:when>
                    <c:otherwise>
                        <div class="musical_banner">
                            <div class="post_box"> <%-- 처음 들어왔을 때 musicalList[0] = 제목순 정렬 첫 뮤지컬을 띄워줌 --%>
                                <img src="${musicalList[0].mu_poster}" alt="메인 포스터" class="post_img">
                            </div>
                            <div class="part_box">
                                <span class="blind">${musicalList[0].mu_id}</span>
                                <h1 class="musical_title">${musicalList[0].mu_title}</h1>
                                <div class="musical_meta">
                                    <span class="year">${musicalList[0].mu_prfpdfrom}</span>
                                    <span class="runtime">${musicalList[0].mu_prfpdto}</span>
                                    <span class="genre">${musicalList[0].mu_genre}</span>
                                </div>

                                <p class="musical_description">
                                    내용
                                </p>

                                <div class="button_group">
                                    <button class="btn_primary">
                                        <svg class="play-icon" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M8 5v14l11-7z"/>
                                        </svg>
                                        예매하기
                                    </button>
                                    <button class="btn_secondary">
                                        <svg class="icon" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                                        </svg>
                                        찜하기
                                    </button>
                                </div>

                                <div class="musical_info">
                                    <div class="info_row">
                                        <span>공연장</span>
                                        <span class="info_label">${musicalList[0].mu_venue}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="gradient_overlay"></div>
            </div>
            <div class="view_wcht">
                <div class="swiper main-swiper">
                    <div class="swiper-wrapper">
                        <c:forEach var="musical_list" items="${musicalList}" varStatus="status"> <%-- 반복문으로 musicalList 슬라이드, data로 code, title 등 담아줌 --%>
                            <div class="swiper-slide main-slide musicalList" id="musical${status.index + 1}"
                                 data-code="${musical_list.mu_id}"
                                 data-title="${musical_list.mu_title}" data-poster="${musical_list.mu_poster}"
                                 data-prfpdfrom="${musical_list.mu_prfpdfrom}" data-prfpdto="${musical_list.mu_prfpdto}"
                                 data-venue="${musical_list.mu_venue}" data-genre="${musical_list.mu_genre}">
                                <img src="${musical_list.mu_poster}" alt="영화 이미지 ${status.index + 1}">
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </header>

     <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>
        // 메인 슬라이더 설정
        var mainSwiper = new Swiper(".main-swiper", {
            slidesPerView: 5,
            spaceBetween: 30,
            freeMode: true,
            loop: true,
            speed: 800,
            scrollbar: {
                el: ".swiper-scrollbar",
                 hide: true,
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

        $('.musicalList').on('click', function(){ // musicalList 슬라이드 클릭했을 때
            const title = $(this).data('title'); // 해당 뮤지컬 title
            const poster = $(this).data('poster'); // 해당 뮤지컬 poster url
            const prfpdfrom = $(this).data('prfpdfrom'); // 해당 뮤지컬 시작 날짜
            const prfpdto = $(this).data('prfpdto'); // 해당 뮤지컬 종료 날짜
            const venue = $(this).data('venue'); // 해당 뮤지컬 공연장
            const genre = $(this).data('genre'); // 해당 뮤지컬 장르
            const mu_id = $(this).data('code') // 해당 뮤지컬 id

            $('.post_img').attr('src', poster);
            $('.musical_title').text(title);
            $('.year').text(prfpdfrom);
            $('.runtime').text(prfpdto);
            $('.genre').text(genre);
            $('.info_label').text(venue);
            $('.blind').text(mu_id);
        })

        $('.search_icon').on('click', function(){ // 검색 아이콘 클릭했을 때
            const keyword = $('.search_box').val(); // keyword = 검색 텍스트바에 입력한 내용
            if(keyword.trim().length == 0){ // 아무것도 입력 안했을때
                history.go(0); // 새로고침
            }
            else{ // 입력한 내용이 있을 때
                $('.search_atag').attr('href', "/app/musical?keyword=" + keyword); // 입력한 내용을 keyword= 입력한내용으로 전달
            }
        })

        $('.search_box').on('keydown', function(e){ // 검색 텍스트바 keydown
            if(e.keyCode == 13 && $('.search_box').val().trim().length > 0) { // e.keyCode 13 == enter
                $('.search_icon').trigger('click');
            }
        })

        $('.btn_primary').on('click', function(){ // 예매하기 버튼 클릭했을 때
            let mu_id = $('.blind').text(); // 해당 뮤지컬 id
            location.href = '/app/book/musical?code=' + mu_id; // 뮤지컬 id를 담아 /book/musical로
        })


    </script>
</body>
</html>