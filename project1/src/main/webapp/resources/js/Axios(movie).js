// 날짜 포맷 함수 추가
function formatKoreanDate(dateString) {
    if (!dateString) return '미정';

    try {
        const date = new Date(dateString);
        return date.toLocaleDateString('ko-KR', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit'
        });
    } catch (error) {
        return '미정';
    }
}

// API URL과 이미지 프록시 설정
const API_URL = 'http://3.36.29.175:5001/api/movies';
const IMAGE_PROXY = url => `http://3.36.29.175:5001/image-proxy?url=${encodeURIComponent(url)}`;

// 팝업 열기 함수
function openPopup(movieData) {
    try {
        // 팝업 요소들이 존재하는지 확인
        const elements = {
            poster: document.getElementById('popup-poster'),
            title: document.getElementById('popup-title'),
            rating: document.getElementById('popup-rating'),
            genre: document.getElementById('popup-genre'),
            date: document.getElementById('popup-date'),
            runtime: document.getElementById('popup-runtime'),
            desc: document.getElementById('popup-desc')
        };

        // 필수 요소들이 모두 존재하는지 확인
        for (const [key, element] of Object.entries(elements)) {
            if (!element) {
                console.error(`팝업 요소를 찾을 수 없습니다: popup-${key}`);
                return;
            }
        }

        // 데이터 설정 (API 응답 필드명에 맞춰 조정)
        elements.poster.src = IMAGE_PROXY(movieData.m_poster_url);
        elements.poster.alt = movieData.m_title;
        elements.title.textContent = movieData.m_title || '제목 없음';
        elements.rating.textContent = movieData.m_rating ? movieData.m_rating.toFixed(1) : '정보없음';
        elements.genre.textContent = movieData.m_genre || '장르 없음';

        // 날짜 필드명 확인 (m_open_dt 또는 m_opendate)
        const openDate = movieData.m_open_dt || movieData.m_opendate;
        elements.date.textContent = formatKoreanDate(openDate);

        elements.runtime.textContent = movieData.m_show_tm ? `${movieData.m_show_tm}분` : '정보없음';
        // 팝업 표시
        document.getElementById('movie-popup').classList.add('active');
        document.body.style.overflow = 'hidden';

        console.log('팝업 데이터 로드 성공:', movieData.m_title);

    } catch (error) {
        console.error('팝업 표시 중 오류 발생:', error);
    }
}

// 팝업 닫기 함수
function closePopup() {
    document.getElementById('movie-popup').classList.remove('active');
    document.body.style.overflow = '';
}

// 장르별 영화 데이터 로드 및 슬라이더 생성
async function fetchAndPopulateMovies() {
    try {
        console.log('영화 데이터 로드 시작...');
        const response = await axios.get(API_URL);
        const movies = response.data;

        console.log('로드된 영화 데이터:', movies.length, '개');
        console.log('첫 번째 영화 데이터 구조:', movies[0]);

        // 각 장르별 슬라이더 처리
        document.querySelectorAll('.movie-swiper').forEach(swiperElement => {
            const genre = swiperElement.dataset.genre;
            const wrapper = swiperElement.querySelector('.swiper-wrapper');

            if (!wrapper) {
                console.error(`${genre} 장르의 swiper-wrapper를 찾을 수 없습니다.`);
                return;
            }

            // 기존 슬라이드 제거
            wrapper.innerHTML = '';

            // 해당 장르의 영화들 필터링
            const genreMovies = movies.filter(movie => {
                return movie.m_genre && movie.m_genre.includes(genre);
            });

            console.log(`${genre} 장르 영화:`, genreMovies.length, '개'); // console 창 장르별 영화 개수

            // 슬라이드 생성
            genreMovies.forEach(movie => {
                const slide = document.createElement('div');
                slide.className = 'swiper-slide movie_slide';

                const img = document.createElement('img');
                img.src = IMAGE_PROXY(movie.m_poster_url);
                img.alt = movie.m_title;
                img.style.width = '100%';
                img.style.height = '100%';
                img.style.objectFit = 'cover';
                img.style.cursor = 'pointer';

                // 이미지 로드 실패 시 대체 이미지
                img.onerror = function() {
                    this.src = 'https://via.placeholder.com/240x360?text=No+Image';
                };

                // 슬라이드에 img 추가 DOM API
                slide.appendChild(img);

                // 클릭 이벤트 추가 / console에 띄움
                slide.addEventListener('click', () => {
                    console.log('영화 클릭:', movie.m_title);
                    openPopup(movie);
                });

                // 슬라이드 요소를 slider-wrapper 안에 넣는 DOM API
                wrapper.appendChild(slide);
            });

            // Swiper 초기화
            if (genreMovies.length > 0) {
                new Swiper(swiperElement, {
                    slidesPerView: 8,
                    spaceBetween: 10,
                    freeMode: true,
                    loop: genreMovies.length > 8,
                    breakpoints: {
                        320: { slidesPerView: 1 },
                        640: { slidesPerView: 2 },
                        768: { slidesPerView: 3 },
                        1024: { slidesPerView: 5 },
                        1440: { slidesPerView: 6 },
                        1600: { slidesPerView: 7 },
                        1920: { slidesPerView: 8 }
                    }
                });
            }
        });
    // 오류 분석
    } catch (error) {
        console.error('영화 데이터 로드 실패:', error);
        console.error('오류 상세:', error.response?.data || error.message);
    }
}

// DOM 로드 완료 후 실행
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM 로드 완료, 영화 데이터 로드 시작');

    // 팝업 닫기 이벤트 리스너
    const closeButton = document.getElementById('popup-close');
    if (closeButton) {
        closeButton.addEventListener('click', closePopup);
    }

    // 팝업 배경 클릭 시 닫기
    const popup = document.getElementById('movie-popup');
    if (popup) {
        popup.addEventListener('click', function(e) {
            if (e.target === this) {
                closePopup();
            }
        });
    }

    // 영화 데이터 로드
    fetchAndPopulateMovies();
});
