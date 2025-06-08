// 날짜 포맷 함수
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

// 전역 영화 데이터 저장
let allMoviesData = [];

let code = "";

// 팝업 열기 함수
function openPopup(movieData) {
    try {
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

        // 데이터 설정
        elements.poster.src = IMAGE_PROXY(movieData.m_poster_url || movieData.imageSrc);
        elements.poster.alt = movieData.m_title || movieData.title;
        elements.title.textContent = movieData.m_title || movieData.title || '제목 없음';
        elements.rating.textContent = movieData.m_rating ? movieData.m_rating.toFixed(1) : (movieData.rating || '정보없음');
        elements.genre.textContent = movieData.m_genre || movieData.genre || '장르 없음';

        const openDate = movieData.m_open_dt || movieData.m_opendate;
        elements.date.textContent = formatKoreanDate(openDate);
        elements.runtime.textContent = movieData.m_show_tm ? `${movieData.m_show_tm}분` : '정보없음';
        code = movieData.m_code;

        // 팝업 표시
        document.getElementById('movie-popup').classList.add('active');
        document.body.style.overflow = 'hidden';

        console.log('팝업 데이터 로드 성공:', movieData.m_title || movieData.title);

    } catch (error) {
        console.error('팝업 표시 중 오류 발생:', error);
    }
}

// 팝업 닫기 함수
function closePopup() {
    document.getElementById('movie-popup').classList.remove('active');
    document.body.style.overflow = '';
}

// 검색 팝업 표시 함수
function showSearchPopup(movieData) {
    const popup = document.getElementById('popup');
    const popupBody = document.getElementById('popup-body');

    if (!popup || !popupBody) {
        console.error('검색 팝업 요소를 찾을 수 없습니다.');
        return;
    }

    const posterUrl = movieData.m_poster_url ? IMAGE_PROXY(movieData.m_poster_url) : movieData.imageSrc;
    const title = movieData.m_title || movieData.title;
    const genre = movieData.m_genre || movieData.genre;
    const rating = movieData.m_rating || movieData.rating;

    popupBody.innerHTML = `
        <img src="${posterUrl}" alt="${title}" style="width:100%; max-width:300px; margin-bottom:15px; border-radius:8px;">
        <h3 style="margin:10px 0; color:#fff;">${title}</h3>
        <p style="margin:5px 0; color:#ccc;">장르: ${genre}</p>
        <p style="margin:5px 0; color:#ccc;">평점: ${rating}</p>
        <div style="margin-top:15px;">
            <button onclick="window.open('Ticketingpage.html', '_blank')" 
                    style="background:#E50914; color:white; border:none; padding:10px 20px; margin-right:10px; border-radius:5px; cursor:pointer;">
                예매하기
            </button>
            <button onclick="window.open('Mypage.html', '_blank')" 
                    style="background:rgba(255,255,255,0.2); color:white; border:none; padding:10px 20px; border-radius:5px; cursor:pointer;">
                찜하기
            </button>
        </div>
    `;

    popup.style.display = 'flex';
}



// 장르별 영화 데이터 로드 및 슬라이더 생성
async function fetchAndPopulateMovies() {
    try {
        console.log('영화 데이터 로드중');
        const response = await axios.get(API_URL);
        const movies = response.data;

        // 전역 변수에 저장
        allMoviesData = movies;

        console.log('로드된 영화 데이터:', movies.length, '개');

        // 각 장르별 슬라이더 처리
        document.querySelectorAll('.movie-swiper').forEach(swiperElement => {
            const genre = swiperElement.dataset.genre;
            const wrapper = swiperElement.querySelector('.swiper-wrapper');

            if (!wrapper) {
                console.error(`${genre} 장르의 swiper-wrapper를 찾을 수 없습니다.`);
                return;
            }

            wrapper.innerHTML = '';

            const genreMovies = movies.filter(movie => {
                return movie.m_genre && movie.m_genre.includes(genre);
            });

            console.log(`${genre} 장르 영화:`, genreMovies.length, '개');

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

                img.onerror = function() {
                    this.src = 'https://via.placeholder.com/240x360?text=No+Image';
                };

                slide.appendChild(img);

                slide.addEventListener('click', () => {
                    console.log('영화 클릭:', movie.m_title);
                    openPopup(movie);
                });

                wrapper.appendChild(slide);
            });

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

    } catch (error) {
        console.error('영화 데이터 로드 실패:', error);
    }
}

// 검색 기능 초기화
function initializeSearch() {
    const searchIcon = document.getElementById('search_icon');
    const searchBar = document.getElementById('search_bar');
    const searchDropdown = document.getElementById('search_dropdown');

    if (!searchIcon || !searchBar || !searchDropdown) {
        console.error('검색 요소들을 찾을 수 없습니다.');
        return;
    }

    // 검색 아이콘 클릭 시 검색바 토글
    searchIcon.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();

        searchBar.classList.toggle('active');
        if (searchBar.classList.contains('active')) {
            searchBar.focus();
        } else {
            searchDropdown.classList.remove('active');
            searchBar.value = '';
        }
    });

    // 검색어 입력 시 실시간 검색
    searchBar.addEventListener('input', function() {
        const query = this.value.trim().toLowerCase();
        searchDropdown.innerHTML = '';

        if (!query) {
            searchDropdown.classList.remove('active');
            return;
        }

        // 영화 데이터에서 검색
        const matches = allMoviesData.filter(movie =>
            movie.m_title && movie.m_title.toLowerCase().includes(query)
        );

        if (matches.length > 0) {
            matches.slice(0, 8).forEach(movie => { // 최대 8개만 표시
                const item = document.createElement('div');
                item.className = 'search-item';
                item.textContent = movie.m_title;
                item.addEventListener('click', function() {
                    showSearchPopup(movie);
                    searchDropdown.classList.remove('active');
                    searchBar.value = movie.m_title;
                });
                searchDropdown.appendChild(item);
            });
            searchDropdown.classList.add('active');
        } else {
            const noResult = document.createElement('div');
            noResult.className = 'search-item no-results';
            noResult.textContent = '검색된 영화가 없습니다.';
            searchDropdown.appendChild(noResult);
            searchDropdown.classList.add('active');
        }
    });

    // Enter 키 처리
    searchBar.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            const query = this.value.trim().toLowerCase();

            if (!query) return;

            const firstMatch = allMoviesData.find(movie =>
                movie.m_title && movie.m_title.toLowerCase().includes(query)
            );

            if (firstMatch) {
                showSearchPopup(firstMatch);
                searchDropdown.classList.remove('active');
            } else {
                alert('일치하는 영화가 없습니다.');
            }
        }
    });

    // 외부 클릭 시 검색바 숨기기
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.search_container') && !e.target.closest('#search_icon')) {
            searchBar.classList.remove('active');
            searchDropdown.classList.remove('active');
        }
    });
}

// 사용자 메뉴 초기화
function initializeUserMenu() {
    const userIcon = document.getElementById('user-icon');
    const userDropdown = document.getElementById('user-dropdown');

    if (!userIcon || !userDropdown) return;

    const loggedInUser = localStorage.getItem('loggedInUser');

    userDropdown.innerHTML = '';
    if (loggedInUser) {
        userDropdown.innerHTML = `
            <a href="#" id="logout-btn" style="color: white; text-decoration: none; padding: 8px 12px; display: block;">로그아웃</a>
            <a href="Mypage.html" style="color: white; text-decoration: none; padding: 8px 12px; display: block;">마이페이지</a>
        `;
    } else {
        userDropdown.innerHTML = `
            <a href="Loginpage.html" style="color: white; text-decoration: none; padding: 8px 12px; display: block;">로그인</a>
            <a href="Mypage.html" style="color: white; text-decoration: none; padding: 8px 12px; display: block;">마이페이지</a>
        `;
    }

    // 사용자 아이콘 클릭 시 드롭다운 토글
    userIcon.addEventListener('click', function(e) {
        e.stopPropagation();
        userDropdown.style.display = userDropdown.style.display === 'block' ? 'none' : 'block';
    });

    // 로그아웃 버튼 클릭 처리
    userDropdown.addEventListener('click', function(e) {
        if (e.target.id === 'logout-btn') {
            e.preventDefault();
            localStorage.removeItem('loggedInUser');
            location.reload();
        }
    });

    // 외부 클릭 시 드롭다운 숨기기
    document.addEventListener('click', function(e) {
        if (!e.target.closest('#user-menu-container')) {
            userDropdown.style.display = 'none';
        }
    });
}

// DOM 로드 완료 후 실행
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM 로드 완료, 초기화 시작');

    // 팝업 닫기 이벤트 리스너
    const closeButton = document.getElementById('popup-close');
    if (closeButton) {
        closeButton.addEventListener('click', closePopup);
    }

    // 영화 팝업 배경 클릭 시 닫기
    const moviePopup = document.getElementById('movie-popup');
    if (moviePopup) {
        moviePopup.addEventListener('click', function(e) {
            if (e.target === this) {
                closePopup();
            }
        });
    }

    // 검색 팝업 닫기
    const searchPopup = document.getElementById('popup');
    const popupClose = document.querySelector('.popup-close');
    const popupOverlay = document.querySelector('.popup-overlay');

    if (popupClose) {
        popupClose.addEventListener('click', function() {
            searchPopup.style.display = 'none';
        });
    }

    if (popupOverlay) {
        popupOverlay.addEventListener('click', function() {
            searchPopup.style.display = 'none';
        });
    }

    $('.btn_primary').on('click', function() {

        window.location.href = "Ticketingpage.html?type=movie&content_id=" + code;
    });

    // 각 기능 초기화
    fetchAndPopulateMovies().then(() => {
        initializeSearch(); // 영화 데이터 로드 후 검색 초기화
    });

    initializeUserMenu();
});

