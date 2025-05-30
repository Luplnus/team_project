<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            margin-top: 13px;
        }

        .main_menu {
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
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
            padding: 0 10px;
        }

        .main_logo h2 {
            margin: 0;
            width: 70px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .main_logo h2:hover {
            color: #E50914;
            cursor: pointer;
        }

        .menu_bar {
            display: flex;
            flex: 1;
            justify-content: flex-end;
        }

        .menu_box {
            width: 80px;
            height: 35px;
            margin: 0 15px;
            text-align: center;
            line-height: 35px;
            color: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 15px;
            border-radius: 5px;
        }

        .menu_box:hover {
            color: #E50914;
            background-color: rgba(229, 9, 20, 0.1);
            transform: translateY(-2px);
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
            transition: all 0.3s ease;
            border-radius: 5px;
            cursor: pointer;
        }

        .content_box:hover {
            background-color: rgba(229, 9, 20, 0.2);
            transform: scale(1.1);
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

        .search_bar:hover {
            border-color: #E50914;
        }

        .search_bar:focus {
            outline: none;
            border-color: #E50914;
            box-shadow: 0 0 10px rgba(229, 9, 20, 0.3);
        }

        .search_history {
            width: 100px;
            height: 500px;
            border: 1px solid;
        }

        .search_bar.active {
            width: 350px;
            padding: 0 13px;
            opacity: 1;
            pointer-events: auto;
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
            transition: all 0.3s ease;
        }

        .mv_view_box:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .post_box {
            height: 340px;
            border-radius: 15px;
            color: #fff;
            display: flex;
            background: linear-gradient(145deg, #000000 0%, #553fcf 100%);
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .post_box:hover {
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(85, 63, 207, 0.3);
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
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 15px;
            padding-right: 10px;
        }

        .mv_nm {
            width: 270px;
            height: 60px;
            border-radius: 15px;
            border: 1px solid;
            padding: 20px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .mv_nm:hover {
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

        .tag_box:hover {
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

        .cinema_box:hover {
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
                    <div class="mv_ttl_txt"><span class="content_type">영화</span> 이름</div>
                    <div class="mv_ttl_txt">장르</div>
                    <div class="mv_ttl_txt">극장</div>
                    <div class="mv_ttl_txt">런타임</div>
                </ul>
            </div>
            <div class="tck_info_box">
                <div class="tag_tool_box">
                    <div class="tag_box">영화</div>
                    <div class="tag_box">연극</div>
                    <div class="tag_box">뮤지컬</div>
                </div>
                <div class="tck_info_tool" id="movieList">
                    <div class="mv_nm">
                        <h4>영화이름 1</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 2</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 3</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 4</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 5</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 6</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 7</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 8</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 9</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                    <div class="mv_nm">
                        <h4>영화이름 10</h4>
                        <p>장르/런타임/예매일자</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn" onclick="prevStep()">이전</button>
            <button class="tck_btn" onclick="nextStep()">다음</button>
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
                    <div class="mv_ttl_txt"><span class="content_type">영화</span> 이름</div>
                    <div class="mv_ttl_txt">장르</div>
                    <div class="mv_ttl_txt">극장</div>
                    <div class="mv_ttl_txt">런타임</div>
                </ul>
            </div>
            <div class="tck_info_box">
                <h2>근처 상영관</h2>
                <div class="tck_cinema_list">
                    <div class="cinema_box">영화관 이름</div>
                    <div class="cinema_box">영화관 이름</div>
                    <div class="cinema_box">영화관 이름</div>
                    <div class="cinema_box">영화관 이름</div>
                    <div class="cinema_box">영화관 이름</div>
                    <div class="cinema_box">영화관 이름</div>
                </div>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn" onclick="prevStep()">이전</button>
            <button class="tck_btn" onclick="nextStep()">다음</button>
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
                    <div class="mv_ttl_txt"><span class="content_type">영화</span> 이름</div>
                    <div class="mv_ttl_txt">장르</div>
                    <div class="mv_ttl_txt">극장</div>
                    <div class="mv_ttl_txt">런타임</div>
                </ul>
            </div>
            <div class="tck_info_box">
                <h2>상영 시간</h2>
                <div class="tck_cinema_list">
                    <div class="cinema_box">시간 선택</div>
                    <div class="cinema_box">시간 선택</div>
                    <div class="cinema_box">시간 선택</div>
                    <div class="cinema_box">시간 선택</div>
                    <div class="cinema_box">시간 선택</div>
                    <div class="cinema_box">시간 선택</div>
                </div>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn" onclick="prevStep()">이전</button>
            <button class="tck_btn" onclick="nextStep()">다음</button>
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
                <button class="A">A1</button>
                <button class="A">A2</button>
                <button class="A">A3</button>
                <button class="A">A4</button>
                <button class="A">A5</button>
                <button class="A">A6</button>
                <button class="A">A7</button>
                <button class="A">A8</button>
                <button class="A">A9</button>
                <button class="A">A10</button>
                <button class="B">B1</button>
                <button class="B">B2</button>
                <button class="B">B3</button>
                <button class="B">B4</button>
                <button class="B">B5</button>
                <button class="B">B6</button>
                <button class="B">B7</button>
                <button class="B">B8</button>
                <button class="B">B9</button>
                <button class="B">B10</button>
                <button class="C">C1</button>
                <button class="C">C2</button>
                <button class="C">C3</button>
                <button class="C">C4</button>
                <button class="C">C5</button>
                <button class="C">C6</button>
                <button class="C">C7</button>
                <button class="C">C8</button>
                <button class="C">C9</button>
                <button class="C">C10</button>
                <button class="D">D1</button>
                <button class="D">D2</button>
                <button class="D">D3</button>
                <button class="D">D4</button>
                <button class="D">D5</button>
                <button class="D">D6</button>
                <button class="D">D7</button>
                <button class="D">D8</button>
                <button class="D">D9</button>
                <button class="D">D10</button>
                <button class="E">E1</button>
                <button class="E">E2</button>
                <button class="E">E3</button>
                <button class="E">E4</button>
                <button class="E">E5</button>
                <button class="E">E6</button>
                <button class="E">E7</button>
                <button class="E">E8</button>
                <button class="E">E9</button>
                <button class="E">E10</button>
            </div>
        </div>
        <div class="tck_btn_box">
            <button class="tck_btn" onclick="prevStep()">이전</button>
            <button class="tck_btn" onclick="nextStep()">완료</button>
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
    searchIcon.addEventListener('click', function(e) {
        e.preventDefault();
        searchBar.classList.toggle('active');
        if (searchBar.classList.contains('active')) {
            setTimeout(() => {
                searchBar.focus();
            }, 100);
        }
    });

    // 무한 스크롤
    movieList.addEventListener('scroll', function() {
        if (movieList.scrollTop + movieList.clientHeight >= movieList.scrollHeight - 10) {
            loadMoreMovies();
        }
    });

    function loadMoreMovies() {
        for (let i = 1; i <= 4; i++) {
            movieCount++;
            const movieItem = document.createElement('div');
            movieItem.className = 'mv_nm';
            movieItem.innerHTML = `
                        <h4>영화이름 ${movieCount}</h4>
                        <p>장르/런타임/예매일자</p>
                    `;
            movieList.appendChild(movieItem);
        }
    }

    // 다음 단계로 이동
    function nextStep() {
        if (currentStep < 4) {
            document.getElementById('step' + currentStep).classList.remove('active');

            currentStep++;
            document.getElementById('step' + currentStep).classList.add('active');
        } else {
            alert('예매가 완료되었습니다!');
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

    // 좌석 클릭 기능 추가
    const seatButtons = document.querySelectorAll('.tck_seat_box button');
    seatButtons.forEach(button => {
        button.addEventListener('click', function() {
            this.classList.toggle('selected');
        });
    });

    // 여기부터 추가
    $('.post_box').children('img').attr('src', ${musicalDto.mu_poster})


    $('.tag_box').on('click', function (){ // .tag_box(영화, 연극, 뮤지컬) 클릭하면
        const content_type = $(this).text(); // 해당 박스 text (영화, 연극, 뮤지컬)
        $('.content_type').text(content_type); // 영화 선택, 영화 이름 -> 뮤지컬 선택, 뮤지컬 이름 으로 바뀌게
    })

</script>
</body>
</html>