let currentContentIndex = 0;

// 3. intro_ttl 콘텐츠를 렌더링하는 함수
function renderIntroContent(index) {
    const content = contentData[index];
    const introTtlElement = document.querySelector('.intro_ttl');

    // HTML 템플릿 생성
    const html = `
        <div class="content_info">
            <div class="content_badge">
                ${content.badges.map(badge => `<span class="badge ${badge.type}">${badge.text}</span>`).join('')}
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

// 메인 슬라이더 초기화
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


var swiper = new Swiper(".movie-swiper", {
    slidesPerView: 5,
    spaceBetween: 30,
    freeMode: true,
    loop: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
});

// 메뉴 클릭 이벤트
document.querySelectorAll('.genrn_menu').forEach(menu => {
    menu.addEventListener('click', function() {
        // 모든 메뉴에서 active 클래스 제거
        document.querySelectorAll('.genrn_menu').forEach(m => m.classList.remove('active'));
        // 클릭된 메뉴에 active 클래스 추가
        this.classList.add('active');
    });
});

// /////////////////////////////////////////////////////////////////////////////////

// 환경 설정
const BASE = 'http://54.180.234.163:5002';
const ENDPOINTS = {
    '영화':    '/api/movies',
    '연극':    '/api/theaters',
    '뮤지컬':  '/api/musicals'
};


// 장르 메뉴 클릭 처리
$('.genrn_menu').click(function() {
    // active 클래스 토글
    $('.genrn_menu').removeClass('active');
    $(this).addClass('active');

    const category = $(this).text().trim();
    const url = BASE + ENDPOINTS[category]})