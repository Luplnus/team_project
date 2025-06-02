<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>

        body {
            margin: 0;
        }

        h4, h2 {
            padding: 0;
            margin: 0;
        }

        p {
            margin: 0;
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


        .search_bar {
            border: 1px solid #fff;
            width: 0;
            height: 35px;
            border-radius: 10px;
            padding: 0;
            font-size: 15px;
            opacity: 0;
            transition: all 0.3s ease;
            pointer-events: none;
            overflow: hidden;
        }

        .search_bar.active {
            width: 350px;
            padding: 0 13px;
            opacity: 1;
            pointer-events: auto;
        }

        .search_bar:focus {
            outline: none;
        }

        .search_history {
            width: 100px;
            height: 500px;
            border: 1px solid;
        }

        ul {
            padding: 0;
            margin: 0;
        }

        .ticket_container {
            max-width: 1215px;
            height: 800px;
            width: 100%;
            padding: 20px 20px;
            border: 1px solid;
            margin: 40px auto;
            border-radius: 15px;
            display: none;
        }

        .ticket_container.active {
            display: block;
        }

        .ticket_box {
            height: 740px;
            padding: 30px;
        }

        .step_late {
            width: 100%;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: space-around;
            margin-bottom: 40px;
        }

        .step_box {
            width: 200px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            transition: all 0.3s ease;
        }

        .step_box:hover {
            transform: translateY(-3px);
        }

        .date_step {
            width: 50px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            border-radius: 50px;
            border: 1px solid;
            transition: all 0.3s ease;
        }

        .date_step:hover {
            background-color: rgba(229, 9, 20, 0.1);
            border-color: #E50914;
            transform: scale(1.1);
        }

        .date_step.active {
            background-color: #E50914;
            color: white;
            border-color: #E50914;
        }

        .tck_info {
            height: 500px;
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 100px;
            margin-top: 30px;
        }

        .mv_view_box {
            width: 300px;
            height: 460px;
            padding: 20px;
            border-radius: 15px;
            border: 1px solid;
        }

        .post_box {
            height: 340px;
            border-radius: 15px;
            color: #fff;
            display: flex;
            background: linear-gradient(145deg, #000000 0%, #553fcf 100%);
            align-items: center;
            justify-content: center;
        }

        .post_box img {
            width:  100% ;
            height: 100%;
        }
        .tck_info_box {
            width: 670px;
            padding: 20px;
            height: 460px;
            border-radius: 15px;
            border: 1px solid;
            transition: all 0.3s ease;
        }

        .tck_info_box:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .tck_seat_box {
            width: 1110px;
            padding: 20px;
            height: 460px;
            border-radius: 15px;
            border: 1px solid;
        }

        .tag_tool_box {
            width: 100%;
            height: 50px;
            gap: 20px;
            display: flex;
            cursor: pointer;
        }

        .tck_info_tool {
            height: 370px;
            max-height: 370px;
            overflow-y: scroll;
            margin-top: 30px;
            padding-top: 10px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 15px;
            padding-right: 10px;
        }

        .mv_nm {
            width: 270px;
            height: 72px;
            border-radius: 15px;
            border: 1px solid;
            padding: 20px;
            transition: all 0.3s ease;
            cursor: pointer;

            display: flex;
            flex-direction: column;
            justify-content:  space-between;
            flex-wrap: wrap;
        }

        .mv_nm:hover,
        .mv_nm_active {
            background-color: #f8f9fa;
            border-color: #E50914;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(229, 9, 20, 0.2);
        }

        .mv_nm:hover h4 {
            color: #E50914;
        }

        .tag_box {
            width: 125px;
            height: 50px;
            text-align: center;
            line-height: 46px;
            border-radius: 13px;
            border: 1px solid;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .tag_box:hover,
        .tag_box_active{
            background-color: #E50914;
            color: white;
            border-color: #E50914;
            transform: translateY(-2px);
        }

        .tck_btn_box {
            margin-top: 50px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .tck_btn {
            width: 200px;
            height: 50px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        .tck_btn:hover {
            background-color: #E50914;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(229, 9, 20, 0.3);
        }

        .mv_ttl_txt {
            margin-top: 7px;
            transition: color 0.3s ease;
        }

        .tck_cinema_list {
            width: 100%;
            height: 390px;
            margin-top: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            align-items: center;
            justify-items: center;
        }

        .cinema_box {
            width: 270px;
            height: 50px;
            padding: 20px;
            line-height: 46px;
            border-radius: 15px;
            border: 1px solid;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .cinema_box:hover,
        .cinema_box_active{
            background-color: #E50914;
            color: white;
            border-color: #E50914;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(229, 9, 20, 0.3);
        }

        .tck_seat_box {
            width: 1110px;
            padding: 20px;
            height: 460px;
            border-radius: 15px;
            border: 1px solid;
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-template-rows: repeat(5, 1fr);
            gap: 5px;
            align-items: center;
            justify-items: center;
        }

        .tck_seat_box button {
            width: 100px;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f0f0f0;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .tck_seat_box button:hover {
            background-color: #E50914;
            color: white;
            transform: scale(1.05);
            box-shadow: 0 3px 10px rgba(229, 9, 20, 0.4);
        }

        .tck_seat_box button.selected {
            background-color: #E50914;
            color: white;
        }

        .tck_info_tool::-webkit-scrollbar {
            width: 8px;
        }

        .tck_info_tool::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .tck_info_tool::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 10px;
            transition: background 0.3s ease;
        }

        .tck_info_tool::-webkit-scrollbar-thumb:hover {
            background: #E50914;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .tck_btn:active {
            animation: pulse 0.3s ease;
        }

        .mv_nm:active {
            animation: pulse 0.2s ease;
        }

        .cinema_box:active {
            animation: pulse 0.2s ease;
        }

        .tck_seat_box .disabled{
            background-color: #373737;
            pointer-events: none;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
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

        <input type="text" class="search_bar" id="search_bar" placeholder="타이틀을 입력하세요.">


        <div class="content">
            <div class="content_box" id="search_icon">
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

<div class="ticket_container active" id="step1">
    <div class="ticket_box">
        <div class="step_late">
            <div class="step_box">
                <div class="date_step active">1</div>
                <span>
                    <span class="content_type">영화</span>선택
                </span>
            </div>
            <div class="step_box">
                <div class="date_step">2</div>
                <span>극장선택</span>
            </div>
            <div class="step_box">
                <div class="date_step">3</div>
                <span>시간선택</span>
            </div>
            <div class="step_box">
                <div class="date_step">4</div>
                <span>좌석선택</span>
            </div>
        </div>
        <div class="tck_info">
            <div class="mv_view_box">
                <div class="post_box">
                    <img src="" alt="">
                </div>
                <ul>  <%-- class="content_type"으로 영화-뮤지컬-연극 바꾸기 --%>
                    <div class="mv_ttl_txt content_name">영화 이름</div>
                    <div class="mv_ttl_txt content_genre">장르</div>
                    <div class="mv_ttl_txt content_venue">극장</div>
                    <div class="mv_ttl_txt content_runtime">런타임</div>
                </ul>
            </div>
            <div class="tck_info_box">
                <div class="tag_tool_box">
                    <div class="tag_box" id="tag_box_movie">영화</div>
                    <div class="tag_box" id="tag_box_theater">연극</div>
                    <div class="tag_box" id="tag_box_musical">뮤지컬</div>
                </div>
                <div class="tck_info_tool" id="movieList">

                </div>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn tck_btn_prev" id="prev_step_1">이전</button>
            <button class="tck_btn tck_btn_next" id="step_1">다음</button>
        </div>
    </div>
</div>

<div class="ticket_container" id="step2">
    <div class="ticket_box">
        <div class="step_late">
            <div class="step_box">
                <div class="date_step active">1</div>
                <span>
                    <span class="content_type">영화</span>선택
                </span>
            </div>
            <div class="step_box">
                <div class="date_step active">2</div>
                <span>극장선택</span>
            </div>
            <div class="step_box">
                <div class="date_step">3</div>
                <span>시간선택</span>
            </div>
            <div class="step_box">
                <div class="date_step">4</div>
                <span>좌석선택</span>
            </div>
        </div>
        <div class="tck_info">
            <div class="mv_view_box">
                <div class="post_box">
                    <img src="" alt="">
                </div>

                <ul>
                    <div class="mv_ttl_txt content_name">영화 이름</div>
                    <div class="mv_ttl_txt content_genre">장르</div>
                    <div class="mv_ttl_txt content_venue">극장</div>
                    <div class="mv_ttl_txt content_runtime">런타임</div>
                </ul>
            </div>
            <div class="tck_info_box">
                <h2>근처 상영관</h2>
                <div class="tck_cinema_list" id="venue_list">

                </div>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn tck_btn_prev" id="prev_step_2">이전</button>
            <button class="tck_btn tck_btn_next" id="step_2">다음</button>
        </div>
    </div>
</div>

<div class="ticket_container" id="step3">
    <div class="ticket_box">
        <div class="step_late">
            <div class="step_box">
                <div class="date_step active">1</div>
                <span>
                    <span class="content_type">영화</span>선택
                </span>
            </div>
            <div class="step_box">
                <div class="date_step active">2</div>
                <span>극장선택</span>
            </div>
            <div class="step_box">
                <div class="date_step active">3</div>
                <span>시간선택</span>
            </div>
            <div class="step_box">
                <div class="date_step">4</div>
                <span>좌석선택</span>
            </div>
        </div>
        <div class="tck_info">
            <div class="mv_view_box">
                <div class="post_box">
                    <img src="" alt="">
                </div>
                <ul>
                    <div class="mv_ttl_txt content_name">영화 이름</div>
                    <div class="mv_ttl_txt content_genre">장르</div>
                    <div class="mv_ttl_txt content_venue">극장</div>
                    <div class="mv_ttl_txt content_runtime">런타임</div>
                </ul>
            </div>
            <div class="tck_info_box">
                <h2>상영 시간</h2>
                <div class="tck_cinema_list" id="time_list">
                    <div class="cinema_box time_box">11:00</div>
                    <div class="cinema_box time_box">13:00</div>
                    <div class="cinema_box time_box">15:00</div>
                    <div class="cinema_box time_box">17:00</div>
                    <div class="cinema_box time_box">19:00</div>
                    <div class="cinema_box time_box">21:00</div>
                </div>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn tck_btn_prev" id="prev_step_3">이전</button>
            <button class="tck_btn tck_btn_next" id="step_3">다음</button>
        </div>
    </div>
</div>

<div class="ticket_container" id="step4">
    <div class="ticket_box">
        <div class="step_late">
            <div class="step_box">
                <div class="date_step active">1</div>
                <span>
                    <span class="content_type">영화</span>선택
                </span>
            </div>
            <div class="step_box">
                <div class="date_step active">2</div>
                <span>극장선택</span>
            </div>
            <div class="step_box">
                <div class="date_step active">3</div>
                <span>시간선택</span>
            </div>
            <div class="step_box">
                <div class="date_step active">4</div>
                <span>좌석선택</span>
            </div>
        </div>
        <div class="tck_info">
            <div class="tck_seat_box">
                <button class="A" id="A01">A1</button>
                <button class="A" id="A02">A2</button>
                <button class="A" id="A03">A3</button>
                <button class="A" id="A04">A4</button>
                <button class="A" id="A05">A5</button>
                <button class="A" id="A06">A6</button>
                <button class="A" id="A07">A7</button>
                <button class="A" id="A08">A8</button>
                <button class="A" id="A09">A9</button>
                <button class="A" id="A10">A10</button>
                <button class="B" id="B01">B1</button>
                <button class="B" id="B02">B2</button>
                <button class="B" id="B03">B3</button>
                <button class="B" id="B04">B4</button>
                <button class="B" id="B05">B5</button>
                <button class="B" id="B06">B6</button>
                <button class="B" id="B07">B7</button>
                <button class="B" id="B08">B8</button>
                <button class="B" id="B09">B9</button>
                <button class="B" id="B10">B10</button>
                <button class="C" id="C01">C1</button>
                <button class="C" id="C02">C2</button>
                <button class="C" id="C03">C3</button>
                <button class="C" id="C04">C4</button>
                <button class="C" id="C05">C5</button>
                <button class="C" id="C06">C6</button>
                <button class="C" id="C07">C7</button>
                <button class="C" id="C08">C8</button>
                <button class="C" id="C09">C9</button>
                <button class="C" id="C10">C10</button>
                <button class="D" id="D01">D1</button>
                <button class="D" id="D02">D2</button>
                <button class="D" id="D03">D3</button>
                <button class="D" id="D04">D4</button>
                <button class="D" id="D05">D5</button>
                <button class="D" id="D06">D6</button>
                <button class="D" id="D07">D7</button>
                <button class="D" id="D08">D8</button>
                <button class="D" id="D09">D9</button>
                <button class="D" id="D10">D10</button>
                <button class="E" id="E01">E1</button>
                <button class="E" id="E02">E2</button>
                <button class="E" id="E03">E3</button>
                <button class="E" id="E04">E4</button>
                <button class="E" id="E05">E5</button>
                <button class="E" id="E06">E6</button>
                <button class="E" id="E07">E7</button>
                <button class="E" id="E08">E8</button>
                <button class="E" id="E09">E9</button>
                <button class="E" id="E10">E10</button>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn tck_btn_prev" id="prev_step_complete">이전</button>
            <button class="tck_btn tck_btn_next" id="tck_complete">완료</button>
        </div>
    </div>
</div>

<script>
    const searchIcon = document.getElementById('search_icon');
    const searchBar = document.getElementById('search_bar');
    const movieList = document.getElementById('movieList');

    let currentStep = 1;
    let movieCount = 10;

    // 검색 기능
    searchIcon.addEventListener('click', function (e) {
        e.preventDefault();
        searchBar.classList.toggle('active');
        if (searchBar.classList.contains('active')) {
            setTimeout(() => {
                searchBar.focus();
            }, 100);
        }
    });

    <%--// 무한 스크롤--%>
    <%--movieList.addEventListener('scroll', function () {--%>
    <%--    if (movieList.scrollTop + movieList.clientHeight >= movieList.scrollHeight - 10) {--%>
    <%--        loadMoreMovies();--%>
    <%--    }--%>
    <%--});--%>

    <%--function loadMoreMovies() {--%>
    <%--    for (let i = 1; i <= 4; i++) {--%>
    <%--        movieCount++;--%>
    <%--        const movieItem = document.createElement('div');--%>
    <%--        movieItem.className = 'mv_nm';--%>
    <%--        movieItem.innerHTML = `--%>
    <%--                    <h4>영화이름 ${movieCount}</h4>--%>
    <%--                    <p>장르/런타임/예매일자</p>--%>
    <%--                `;--%>
    <%--        movieList.appendChild(movieItem);--%>
    <%--    }--%>
    <%--}--%>
    // 다음 단계로 이동
    function nextStep() {
        if (currentStep < 4) {
            document.getElementById('step' + currentStep).classList.remove('active');

            currentStep++;
            document.getElementById('step' + currentStep).classList.add('active');
        } else {
            alert('예매가 완료되었습니다!'); //
        }
    }

    // 이전 단계로 이동
    function prevStep() {
        if (currentStep > 1) {

            document.getElementById('step' + currentStep).classList.remove('active');

            currentStep--;
            document.getElementById('step' + currentStep).classList.add('active');
        }
    }

    // // 좌석 클릭 기능 추가
    // const seatButtons = document.querySelectorAll('.tck_seat_box button');
    // seatButtons.forEach(button => {
    //     button.addEventListener('click', function () {
    //         seatButtons.forEach(btn => btn.classList.remove('selected'));
    //         this.classList.toggle('selected');
    //     });
    // });

    // 여기부터
    <%--$('.post_box').children('img').attr('src', '${movieDto.m_poster_url}${musicalDto.mu_poster}${theaterDto.t_poster}');--%>
    <%--$('.content_name').text('${movieDto.m_title}${musicalDto.mu_title}${theaterDto.t_title}');--%>
    <%--$('.content_genre').text('${movieDto.m_genre}${musicalDto.mu_genre}${theaterDto.t_genre}');--%>
    <%--// $('.content_venue').text('$')--%>
    <%--$('.content_runtime').text('${Double.valueOf(movie_list.m_show_tm div 60).intValue()}시간 ${movie_list.m_show_tm mod 60}분');--%>

    // 영화, 연극, 뮤지컬 선택
    $('.tag_box').on('click', function() { // .tag_box(영화, 연극, 뮤지컬) 클릭하면
        const content_type = $(this).text(); // 해당 박스 text (영화, 연극, 뮤지컬)
        $('.content_type').text(content_type); // 영화 선택, 영화 이름 -> 뮤지컬 선택, 뮤지컬 이름 으로 바뀌게

        if($(this).attr('id') == 'tag_box_theater'){
            $('.tag_box').removeClass('tag_box_active'); // tag_box_active 클래스 초기화하고
            $(this).addClass('tag_box_active'); // tag_box_active 클래스 추가
            $('#movieList').html( // 연극 리스트
                `<c:forEach var="theater_list" items="${theaterList}">
                    <div class="mv_nm" data-poster="${theater_list.t_poster}" data-content_id="${theater_list.t_id}" data-venue="${theater_list.t_venue}" data-type="theater">
                        <h4 class="list_title">${theater_list.t_title}</h4>
                        <p>
                            <span class="list_genre">${theater_list.t_genre}</span>
                        </p>
                    </div>
                </c:forEach>`
            );
        }
        else if ($(this).attr('id') == 'tag_box_musical'){
            $('.tag_box').removeClass('tag_box_active'); // tag_box_active 클래스 초기화하고
            $(this).addClass('tag_box_active'); // tag_box_active 클래스 추가
            $('#movieList').html( // 뮤지컬 리스트
                `<c:forEach var="musical_list" items="${musicalList}">
                    <div class="mv_nm" data-poster="${musical_list.mu_poster}" data-content_id="${musical_list.mu_id}" data-venue="${musical_list.mu_venue}" data-type="musical">
                        <h4 class="list_title">${musical_list.mu_title}</h4>
                        <p>
                            <span class="list_genre">${musical_list.mu_genre}</span>
                        </p>
                    </div>
                </c:forEach>`
            );
        }
        else{
            $('.tag_box').removeClass('tag_box_active'); // tag_box_active 클래스 초기화하고
            $(this).addClass('tag_box_active'); // tag_box_active 클래스 추가
            $('#movieList').html( // 영화 리스트
                `<c:forEach var="movie_list" items="${movieList}">
                    <div class="mv_nm" data-poster="${movie_list.m_poster_url}" data-content_id="${movie_list.m_movie_cd}" data-showtime="${movie_list.m_show_tm}" data-type="movie">
                        <h4 class="list_title">${movie_list.m_title}</h4>
                        <p>
                            <span class="list_genre">${movie_list.m_genre_nm}</span>/${Double.valueOf(movie_list.m_show_tm div 60).intValue()}시간 ${movie_list.m_show_tm mod 60}분
                        </p>
                    </div>
                </c:forEach>`
            );
        }
    })

    // 영화, 연극, 뮤지컬 어떤 상세페이지에서 들어왔는지
    <c:choose>
        <c:when test="${not empty movieDto}"> // movie 상세페이지에서 들어오면
            let content_id = '${movieDto.m_movie_cd}'; // 해당 m_movie_cd 저장
            $('#tag_box_movie').trigger('click'); // 영화 리스트 띄워줌
        </c:when>

        <c:when test="${not empty musicalDto}"> // musical 상세페이지에서 들어오면
            let content_id = '${musicalDto.mu_id}'; // 해당 mu_id 저장
            $('#tag_box_musical').trigger('click'); // 뮤지컬 리스트 띄워줌
        </c:when>

        <c:when test="${not empty theaterDto}"> // theater 상세페이지에서 들어오면
            let content_id = '${theaterDto.t_id}'; // 해당 t_id 저장
            $('#tag_box_theater').trigger('click'); // 연극 리스트 띄워줌
        </c:when>

        <c:otherwise>
            let content_id = ""; // 상세페이지에서 들어온게 아니면
            let content_type = "";
            $('#tag_box_movie').trigger('click'); // 기본으로 영화 리스트 띄워줌
        </c:otherwise>
    </c:choose>

    let type = "";
    // 작품 클릭하면 왼쪽에 정보 변하게
    $(document).on('click', '.mv_nm', function () { // 작품 클릭
        if($(this).hasClass('mv_nm_active')){ // 이미 클릭됐으면
            $(this).toggleClass('mv_nm_active'); // active 클래스 삭제
            content_id = ""; // content_id 초기화
        }
        else{
            $('.mv_nm').removeClass('mv_nm_active'); // active 클래스 초기화
            $(this).toggleClass('mv_nm_active'); // this만 active 클래스 추가
            content_id = $(this).data('content_id'); // 선택한 작품의 id 저장
        }

        type = $(this).data('type'); // 뮤지컬 선택했으면 type == musical

        let title = $(this).find('.list_title').text(); // 제목
        let genre = $(this).find('.list_genre').text(); // 장르
        let poster = $(this).data('poster'); // 포스터 url
        let venue = $(this).data('venue'); // 극장
        if(!venue) {
            venue = "";
        }

        let venue_next_1 = $(this).nextAll().eq(0).data('venue');
        let venue_next_2 = $(this).nextAll().eq(1).data('venue');
        let venue_next_3 = $(this).nextAll().eq(2).data('venue');
        let venue_next_4 = $(this).nextAll().eq(3).data('venue');
        let venue_next_5 = $(this).nextAll().eq(4).data('venue');
        let venue_prev_1 = $(this).prevAll().eq(0).data('venue');
        let venue_prev_2 = $(this).prevAll().eq(1).data('venue');
        let venue_prev_3 = $(this).prevAll().eq(2).data('venue');
        let venue_prev_4 = $(this).prevAll().eq(3).data('venue');
        let venue_prev_5 = $(this).prevAll().eq(4).data('venue');

        let showtime = $(this).data('showtime'); // 쇼타임
        if(showtime) { // 쇼타임이 있으면(영화면)
            $('.content_runtime').text(Math.floor(showtime / 60) + "시간 " + (showtime % 60) + "분"); // 쇼타임 표시
        }
        else { // 영화가 아니면
            $('.content_runtime').text(""); // 쇼타임 없음
        }

        $('.post_box').children('img').attr('src', poster);
        $('.content_name').text(title);
        $('.content_genre').text(genre);
        $('.content_venue').text(venue);

        if(venue == ""){
            $('#venue_list').html( // 근처 상영관
                `<div class="cinema_box venue_box">cgv</div>
                <div class="cinema_box venue_box">롯데시네마</div>
                <div class="cinema_box venue_box">메가박스</div>
                <div class="cinema_box venue_box">씨네Q</div>
                <div class="cinema_box venue_box">조이앤시네마</div>
                <div class="cinema_box venue_box">씨네큐브</div>
                `
            );
        }
        else{
            if(venue_next_5 == null){ // 마지막 5개
                $('#venue_list').html( // 근처 상영관
                    `<div class="cinema_box venue_box">\${venue}</div>
                <div class="cinema_box venue_box">\${venue_prev_1}</div>
                <div class="cinema_box venue_box">\${venue_prev_2}</div>
                <div class="cinema_box venue_box">\${venue_prev_3}</div>
                <div class="cinema_box venue_box">\${venue_prev_4}</div>
                <div class="cinema_box venue_box">\${venue_prev_5}</div>
                `
                );
            }
            else{
                $('#venue_list').html( // 근처 상영관
                    `<div class="cinema_box venue_box">\${venue}</div>
                <div class="cinema_box venue_box">\${venue_next_1}</div>
                <div class="cinema_box venue_box">\${venue_next_2}</div>
                <div class="cinema_box venue_box">\${venue_next_3}</div>
                <div class="cinema_box venue_box">\${venue_next_4}</div>
                <div class="cinema_box venue_box">\${venue_next_5}</div>
                `
                );
            }

        }
    })

    let seat_is_able = [];
    let count = 0;
    // 작품 선택 후 다음 버튼
    $(document).on('click', '#step_1', function () {
        if(content_id == "") { // 작품 선택 안했으면
            alert("작품을 선택해주세요");
        }
        else{
            seat_is_able = [];
            count = 0;
            // s_is_available = false 인 좌석 비활성화
            <c:forEach var="s_is_able_movie" items="${s_is_available_movie}"> // seat_movie_tbl에서
            if(content_id == '${s_is_able_movie.m_code}'){ // s_is_available이 false인 s_label이 있다면
                seat_is_able[count++] = '${s_is_able_movie.s_label}'; // 배열에 해당 좌석번호(s_label) 저장
            }
            </c:forEach>
            <c:forEach var="s_is_able_musical" items="${s_is_available_musical}"> // seat_musical_tbl에서
            if(content_id == '${s_is_able_musical.mu_id}'){ // s_is_available이 false인 s_label이 있다면
                seat_is_able[count++] = '${s_is_able_musical.s_label}'; // 배열에 s_label 저장
            }
            </c:forEach>
            <c:forEach var="s_is_able_theater" items="${s_is_available_theater}"> // seat_theater_tbl에서
            if(content_id == '${s_is_able_theater.t_id}') // s_is_available이 false인 s_label이 있다면
                seat_is_able[count++] = '${s_is_able_theater.s_label}'; // 배열에 s_label 저장
            </c:forEach>
            $('.tck_seat_box button').each(function(){ // 좌석 버튼 각각 불러와서
                $(this).removeClass('disabled'); // 전부 초기화 한 후
                const seatLabel = $(this).attr('id'); // D09
                if(seat_is_able.includes(seatLabel)){ // seat_is_able에 해당 좌석 번호가 있으면
                    $(this).addClass('disabled'); // disabled 클래스 추가
                }
            })
            nextStep();
        }
    })

    // 극장 선택
    let venue = "";
    $(document).on('click', '.venue_box', function () { // 극장 클릭
        if($(this).hasClass('cinema_box_active')){ // 이미 클릭됐으면
            $(this).toggleClass('cinema_box_active'); // active 클래스 삭제
            venue = ""; // venue 초기화
        }
        else{
            $('.venue_box').removeClass('cinema_box_active'); // active 클래스 초기화
            $(this).toggleClass('cinema_box_active'); // this만 active 클래스 추가
            venue = $(this).text(); // 선택한 극장 저장
        }
    })

    // 극장 선택 후 다음 버튼
    $(document).on('click', '#step_2', function () {
        if(venue == "") { // 극장 선택 안했으면
            alert("극장을 선택해주세요");
        }
        else{
            nextStep();
        }
    })

    // 극장 선택 이전 버튼
    $(document).on('click', '#prev_step_2', function () {
        venue = ""; // venue 초기화해서 다시 다음버튼 눌러서 들어오면 극장 선택
        $('.venue_box').removeClass('cinema_box_active'); // 극장 선택 active 클래스 초기화
        prevStep();
    })

    // 시간 선택
    let time = "";

    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0'); // 0~11이므로 +1
    const day = String(today.getDate()).padStart(2, '0');
    const formattedDate = `\${year}-\${month}-\${day}`;

    $(document).on('click', '.time_box', function () { // 시간 클릭
        if($(this).hasClass('cinema_box_active')){ // 이미 클릭됐으면
            $(this).toggleClass('cinema_box_active'); // active 클래스 삭제
            time = ""; // time 초기화
        }
        else{
            $('.time_box').removeClass('cinema_box_active'); // active 클래스 초기화
            $(this).toggleClass('cinema_box_active'); // this만 active 클래스 추가
            time = formattedDate + " " + $(this).text(); // 선택한 시간 저장
        }
    })

    // 시간 선택 후 다음 버튼
    $(document).on('click', '#step_3', function () {
        if(time == "") { // 시간 선택 안했으면
            alert("시간을 선택해주세요");
        }
        else{
            nextStep();
        }
    })

    // 시간 선택 이전 버튼
    $(document).on('click', '#prev_step_3', function () {
        time = ""; // time 초기화해서 다시 다음버튼 눌러서 들어오면 시간 선택
        $('.time_box').removeClass('cinema_box_active'); // active 클래스 초기화
        prevStep();
    })

    // 좌석 선택
    let s_label = "";
    $(document).on('click', '.tck_seat_box button', function (){
        if($(this).hasClass('selected')){
            $(this).toggleClass('selected');
            s_label = ""; // s_label 초기화
        }
        else{
            $('.tck_seat_box button').removeClass('selected'); // selected 클래스 초기화
            $(this).toggleClass('selected');
            s_label =  $(this).text(); // s_label에 좌석 번호 저장
        }
    })

    // 좌석 선택 후 다음 버튼
    $(document).on('click', '#tck_complete', function () {
        if(s_label == ""){
            alert("좌석을 선택하세요");
        }
        else{
            // $.ajax({
            //     type:'POST',
            //     url: '/app/payment',
            //     headers : { "content-type": "application/json" },
            //     data : JSON.stringify({content_id: content_id, time: time, venue: venue, s_label: s_label}), //
            //     success : function(result) {
            //         location.href = "/app/payment";
            //     },
            //     error   : function(){ alert("error") }
            // });
            if(type == "movie"){ // 선택한 작품이 영화이면
                axios.post('/app/payment/movie', // /payment/movie로 post, 컨트롤러에서 session에 movieDto set
                    {
                        content_id: content_id,
                        time: time,
                        venue: venue,
                        s_label: s_label
                    },
                    {
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }
                )
                    .then(function(result) {
                        // 성공 시 결제 페이지로 이동 //
                        window.location.href = "/app/Pay_page.html";
                    })
                    .catch(function(error) {
                        alert("error");
                        console.error(error);
                    });
            }
            else if(type == "musical"){
                axios.post('/app/payment/musical',
                    {
                        content_id: content_id,
                        time: time,
                        venue: venue,
                        s_label: s_label
                    },
                    {
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }
                )
                    .then(function(result) {
                        // 성공 시 결제 페이지로 이동
                        window.location.href = "/app/Pay_page.html";
                    })
                    .catch(function(error) {
                        alert("error");
                        console.error(error);
                    });
            }
            else {
                axios.post('/app/payment/theater',
                    {
                        content_id: content_id,
                        time: time,
                        venue: venue,
                        s_label: s_label
                    },
                    {
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }
                )
                    .then(function(result) {
                        // 성공 시 결제 페이지로 이동
                        window.location.href = "/app/Pay_page.html";
                    })
                    .catch(function(error) {
                        alert("error");
                        console.error(error);
                    });
            }

        }
    })

    // 좌석 선택 이전 버튼
    $(document).on('click', '#prev_step_complete', function () {
        $('.tck_seat_box button').removeClass('selected'); // selected 클래스 초기화
        s_label = ""; // s_label 초기화해서 다시 다음버튼 눌러서 들어오면 좌석 선택
        prevStep();
    })

    // 처음 들어왔을 때 .mv_nm 활성화되게
    let tmp = true;
    $('.mv_nm').each(function(){ // 리스트 각각 불러와서
        if($(this).data('content_id') == content_id){ // 상세페이지에서 들어온 작품과 일치하면
            tmp = false;
            $(this).trigger('click'); // 클릭되게
            this.scrollIntoView({ behavior: 'smooth' });
        }
    })
    if(tmp){
        $('.mv_nm').first().trigger('click'); // 상세페이지에서 들어온게 아니면 기본 첫번째 영화 띄워줌
    }
</script>
</body>
</html>