<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="<c:url value='/css/Main_page.css'/>">
    <link rel="stylesheet" href="<c:url value="/css/function_more.css"/>"/>
    <title>JPIEL</title>
</head>
<body>
<header>
    <div id="wrap">
        <!-- iframe 대신 video 태그 사용 -->
        <div class="video_background" id="videoBackground">
            <video id="videoPlayer" autoplay muted loop playsinline>
                <source src="" type="video/mp4">
                브라우저가 비디오 태그를 지원하지 않습니다.
            </video>
        </div>

        <!-- 비디오 오버레이 추가 -->
        <div class="video_overlay"></div>

        <div class="main_menu">
            <div class="h_menubox">
                <div class="main_logo">
                    <h2>JPIEL</h2>
                </div>
                <div class="menu_bar">
                    <a href="<c:url value="/Moviepage.html" />" style="text-decoration: none"><div class="menu_box">영화</div></a>
                    <a href="<c:url value="/Musicalpage.html" />" style="text-decoration: none"><div class="menu_box">뮤지컬</div></a>
                    <a href="<c:url value="/Theaterpage.html" />" style="text-decoration: none"><div class="menu_box">연극</div></a>
                    <a href="<c:url value="/booking" />" style="text-decoration: none"><div class="menu_box">예매</div></a>
                </div>
                <div class="content">
                    <div class="content_box">
                        <a href="">
                            <img src="<c:url value="/pt_img/search.svg"/>" alt="">
                        </a>
                    </div>
                    <div class="content_box">
                        <a href="">
                            <img src="<c:url value="/pt_img/user.svg"/>" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="genre_bar">
            <div class="intro_ttl">
                <!--JS로 구현-->
            </div>

            <div class="intro_view">
                <div class="main-container">
                    <div class="swiper main-swiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide main-slide">
                                <img src="<c:url value="/pt_img/19636c6ce2a211e76.jpg"/>" alt="" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/yFHHfHcUgGAxziP1C3lLt0q2T4s.webp" />" alt="" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/MISSION1.jpg" />" alt="" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/2893d8b7b3f94f.webp" />" alt="" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/위키드.webp" />" alt="약한영웅 Class 2" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/25005672_p.gif"/> " alt="" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/L0000113_p.gif"/> " alt="" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/25004642_p.gif"/> " alt="" class="img_box">
                            </div>
                            <div class="swiper-slide main-slide" data-video-src="">
                                <img src="<c:url value="/pt_img/23005704_p.gif"/> " alt="" class="img_box">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>

<div class="content_park">

    <div class="genre_box">
        <label>
            <input type="radio" name="genre" value="movie" checked>
            <span class="genre_btn">영화</span>
        </label>
        <label>
            <input type="radio" name="genre" value="play">
            <span class="genre_btn">연극</span>
        </label>
        <label>
            <input type="radio" name="genre" value="musical">
            <span class="genre_btn">뮤지컬</span>
        </label>
    </div>

    <div class="genrn-swiper-container">
        <div class="swiper genrn-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide genrn-swiper-slide">
                    <img src="">
                </div>
                <div class="swiper-slide genrn-swiper-slide">
                    <img src="" />
                </div>
                <div class="swiper-slide genrn-swiper-slide">
                    <img src="" />
                </div>
                <div class="swiper-slide genrn-swiper-slide">
                    <img src=""/>
                </div>
                <div class="swiper-slide genrn-swiper-slide">
                    <img src=""/>
                </div>
                <div class="swiper-slide genrn-swiper-slide">
                    <img src=""/>
                </div>
                <div class="swiper-slide genrn-swiper-slide">
                    <img src=""/>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="featured-image">
        <img src="/api/placeholder/500/400" alt="Featured content">
        <div class="featured-content">
            <h1>Cinema</h1>
            <p>관련 영화관</p>
        </div>
    </div>

    <div class="tabs-container">
        <div class="tab active">
            <div class="tab-title">영화관 이름</div>
            <div class="tab-subtitle">영화관</div>
        </div>

        <div class="tab">
            <div class="tab-title">영화관 이름</div>
            <div class="tab-subtitle">영화관</div>
        </div>

        <div class="tab">
            <div class="tab-title">영화관 이름</div>
            <div class="tab-subtitle">영화관</div>
        </div>

        <div class="tab">
            <div class="tab-title">영화관 이름</div>
            <div class="tab-subtitle">영화관</div>
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
<!-- <script src="./JS/Main_page.js"></script>
<script src="./JS/Main_list.js"></script> -->

<script>
    // 1. 먼저 콘텐츠 데이터를 배열로 정의합니다
    const contentData = [
        {
            id: 1,
            title: "썬더볼츠",
            badges: [
                { type: "new", text: "NEW" },
                { type: "hot", text: "인기" }
            ],
            rating: "8.5",
            genre: "액션/어드벤처",
            duration: "126분",
            releaseDate: "2025.04.30 개봉",
            description: "별난 놈들만 모인 이들은 어쩔 수 없이 한 팀이 되고 자신들의 어두운 과거와 맞서야 하는 위험한 임무에 투입된다 서로를 전혀 믿지 못하는 상황에서 스스로의 생존과 세상의 구원을 위해 이들은 진정한 팀으로 거듭나야만 하는데...",
            videoSrc: "./videos/썬더볼츠 메인 예고편.mp4",
            imageSrc: "./pt_img/19636c6ce2a211e76.jpg"
        },
        {
            id: 2,
            title: "A MINECRAFT MOVIE",
            badges: [
                { type: "hot", text: "인기"}
            ],
            rating: "8.7",
            genre: "어드벤처/판타지",
            duration: "100분",
            releaseDate: "2025.04.25 개봉",
            description: "현실 세계로 돌아가기 위해서는 일단 살아남아야 하는 법! 다섯명의 동글이 들을 오버월드를 구하기 위해 힘을 합치게 되는 수업이 쌓아 올린 네모난 세계 상상을 초월하는 모험이 펼쳐진다.",
            videoSrc: "./videos/마인크래프트 1차 예고편.mp4",
            imageSrc: "./pt_img/yFHHfHcUgGAxziP1C3lLt0q2T4s.webp"
        },
        {
            id: 3,
            title: "미션 임파서블 파이널 레코닝",
            badges: [
                { type: "new", text: "영화" }
            ],
            rating: "9.3",
            genre: "액션",
            duration: "169분",
            releaseDate: "2025.05.17 개봉",
            description: "디지털상의 모든 정보를 통제할 수 있는 사상초유의 무기로 인해 전세계 국가와 조직의 기능이 마비되고, 인류 전체가 위협받는 절체절명의 위기가 찾아온다.",
            videoSrc: "./videos/미션 임파서블_ 파이널 레코닝  예고편.mp4",
            imageSrc: "./pt_img/MISSION1.jpg"
        },
        {
            id: 4,
            title: "웃는 남자",
            badges: [
                { type: "new", text: "NEW" }
            ],
            rating: "예술의전당 오페라극장",
            genre: "뮤지컬",
            duration: "180분",
            releaseDate: "2025.01.09 개봉 ~ 2025.03.09 종료",
            description: "살을 에는 추위 속을 헤매던 그윈플렌은 얼어 죽은 여자의 품에 안겨 젖을 물고 있는 아기 데아를 발견하고 우연히 떠돌이 약장수 우르수스를 만나 도움을 청한다.",
            videoSrc: "./videos/웃는남자예고편.mp4",
            imageSrc: "https://image.tmdb.org/t/p/w500/8claugsQFr5SAx4K2anZPJuPRqL.jpg"
        },
        {
            id: 5,
            title: "WICKED",
            badges: [
                { type: "new", text: "NEW" }
            ],
            rating: "블루스퀘어 신한카드홀",
            genre: "뮤지컬",
            duration: "170분",
            releaseDate: "2025.07.12 개봉 ~ 2025.10.26 종료",
            description: "서로 너무나 다른 엘파바와 글린다는 마법 같은 우정을 쌓지만, 마법사의 초대로 에메랄드 시티에 간 후 예상치 못한 위기와 모험에 휘말린다.",
            videoSrc: "./videos/weak_hero.mp4",
            imageSrc: "./pt_img/위키드.webp"
        },
        {
            id: 6,
            title: "알라딘",
            badges: [
                { type: "new", text: "NEW" }
            ],
            rating: "부산 드림씨어터",
            genre: "뮤지컬",
            duration: "150분",
            releaseDate: "2025.07.11 개봉 ~ 2025.09.28 종료",
            description: "사막 속에 자리한 아그라바 왕국, 좀도둑질로 생계를 유지하는 알라딘은 우연히 마주친 공주 자스민에게 신분도 모른 채 마음을 빼앗기게되는데...",
            videoSrc: "./videos/알라딘예고편.mp4",
            imageSrc: "./pt_img/25005672_p.gif"
        },
        {
            id: 7,
            title: "헤다 가블러",
            badges: [
                { type: "new", text: "NEW" }
            ],
            rating: "LG SIGNATURE 홀",
            genre: "연극",
            duration: "145분",
            releaseDate: "2025.05.07 개봉 ~ 2025.06.08 종료",
            description: "가블러 장군의 딸 헤다가 원치 않는 결혼과 함께 겪는 갇힌 삶의 이야기",
            videoSrc: "./videos/헤다가블러 예고편.mp4",
            imageSrc: "./pt_img/L0000113_p.gif"
        },
        {
            id: 8,
            title: "킬링시저",
            badges: [
                { type: "new", text: "NEW" }
            ],
            rating: "서강대학교 메리홀 대극장",
            genre: "연극",
            duration: "90분",
            releaseDate: "2025.05.10 개봉 ~ 2025.07.20 종료",
            description: "셰익스피어의 줄리어스 시저를 현대적으로 재해석한 작품으로, 시저 암살 전후의 권력 다툼과 갈등의 이야기",
            videoSrc: "./videos/킬링시저예고편.mp4",
            imageSrc: "./pt_img/25004642_p.gif"
        },
        {
            id: 9,
            title: "행오버",
            badges: [
                { type: "new", text: "NEW" }
            ],
            rating: "정극장",
            genre: "연극",
            duration: "90분",
            releaseDate: "2023.05.01 개봉 ~ 2025.06.29 종료",
            description: "모든 일은 파라다이스 호텔 506호에 시작된다.남편(철수)의 외도를 알게 된 지연(부인)은 이벤트 업체를 이용해서 남편에게 사과를 받고 싶어한다. 이벤트 업체 대표 태민은 지연의 계획대로 철수에게 사과를 받아보려고 했지만, 만취한 철수는 지연을 506호에서 살해한다. ",
            videoSrc: "",
            imageSrc: ""
        },
        // 필요한 만큼 데이터를 추가 가능
    ];

    let currentContentIndex = 0;

    // 3. intro_ttl 콘텐츠를 렌더링하는 함수
    function renderIntroContent(index) {
        const content = contentData[index];
        const introTtlElement = document.querySelector('.intro_ttl');

        // HTML 템플릿 생성
        const html = `
        <div class="content_info">
            <div class="content_badge">
<%--                ${content.badges.map(badge => `<span class="badge ${badge.type}">${badge.text}</span>`).join('')}--%>
            </div>
            <h2 class="ttl_nm">${content.title}</h2>
                <div class="content_meta">
                    <span class="rating">${content.rating}</span>
                    <span class="genre">${content.genre}</span>
                    <span class="duration">${content.duration}</span>
                    <span class="release">${content.releaseDate}</span>
                </div>
            <p class="content_desc">
                ${content.description}
            </p>
            <div class="button_group">
                <a href="#" class="btn btn_primary">예매하기</a>
                <a href="#" class="btn btn_outline">찜하기</a>
            </div>
        </div>
    `;

        introTtlElement.innerHTML = html;

        const videoPlayer = document.getElementById('videoPlayer');
        const videoSource = videoPlayer.querySelector('source');
        videoSource.src = content.videoSrc;
        videoPlayer.load();
        videoPlayer.play();
    }

    document.addEventListener('DOMContentLoaded', function() {
        // 초기 콘텐츠 렌더링
        renderIntroContent(currentContentIndex);

        // 메인 슬라이드 이벤트 설정
        const mainSlides = document.querySelectorAll('.main-slide');
        mainSlides.forEach(function(slide, index) {
            // 이미 있던 이벤트 리스너는 제거하고 새로 추가
            slide.removeEventListener('click', function() {});

            slide.addEventListener('click', function() {
                const contentIndex = index % contentData.length;
                currentContentIndex = contentIndex;

                renderIntroContent(contentIndex);
            });
        });

        mainSwiper.on('slideChange', function() {
            const realIndex = mainSwiper.realIndex % contentData.length;
            currentContentIndex = realIndex;
            renderIntroContent(realIndex);
        });
    });

    메인 슬라이더 초기화
    var mainSwiper = new Swiper(".main-swiper", {
        slidesPerView: 5,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });

    const videoBackground = document.getElementById('videoBackground');
    const videoPlayer = document.getElementById('videoPlayer');


    const videoSources = {
        "약한영웅 Class 2": "./videos/약한영웅.mp4",
        "썬더볼츠": "./videos/thunderbolts.mp4"
    };

    document.addEventListener('DOMContentLoaded', function() {
        const mainSlides = document.querySelectorAll('.main-slide');

        const autoPlayVideo = () => {

            const defaultVideo = "./videos/weak_hero.mp4";
            videoPlayer.querySelector('source').src = defaultVideo;
            videoPlayer.load();
            videoPlayer.play();
        };


        mainSlides.forEach(function(slide) {
            slide.addEventListener('click', function() {
                const videoSrc = this.getAttribute('data-video-src');
                if (videoSrc) {
                    videoPlayer.querySelector('source').src = videoSrc;
                    videoPlayer.load();
                    videoPlayer.play();
                } else {

                    mainSwiper.slideNext();
                }
            });
        });
    });


    장르별 목록 스와이퍼
    var genrnSwiper = new Swiper(".genrn-swiper", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: "auto",
        coverflowEffect: {
            rotate: 50,
            stretch: 0,
            modifier: 1,
            slideShadows: true,
        },
        pagination: {
            el: ".genrn-swiper-pagination",
        },
    });


    const genreButtons = document.querySelectorAll('.genre_box input[type="radio"]');
    genreButtons.forEach(button => {
        button.addEventListener('change', function() {
            console.log('Selected genre:', this.value);
        });
    });

    const tabs = document.querySelectorAll('.tab');
    const featuredImage = document.querySelector('.featured-image img');
    const featuredTitle = document.querySelector('.featured-content h1');
    const featuredSubtitle = document.querySelector('.featured-content p');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {

            tabs.forEach(t => t.classList.remove('active'));

            tab.classList.add('active');

            // Update featured content
            const title = tab.querySelector('.tab-title').textContent;
            const subtitle = tab.querySelector('.tab-subtitle').textContent;

            featuredTitle.textContent = title;
            featuredSubtitle.textContent = subtitle;
        });
    });

    document.addEventListener('DOMContentLoaded', function() {

        renderIntroContent(currentContentIndex);


        const mainSlides = document.querySelectorAll('.main-slide');
        mainSlides.forEach(function(slide, index) {
            // 이미 있던 이벤트 리스너는 제거하고 새로 추가
            slide.removeEventListener('click', function() {});

            slide.addEventListener('click', function() {
                const contentIndex = index % contentData.length;
                currentContentIndex = contentIndex;

                renderIntroContent(contentIndex);
            });
        });

        const mainMenu = document.querySelector('.main_menu');
        const headerHeight = document.querySelector('.genre_bar').offsetHeight - 10;

        window.addEventListener('scroll', function() {
            if (window.scrollY > headerHeight) {
                mainMenu.classList.add('scrolled');
            } else {
                mainMenu.classList.remove('scrolled');
            }
        });
    });
</script>
</body>
</html>