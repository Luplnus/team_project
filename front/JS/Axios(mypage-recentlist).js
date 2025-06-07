/***
 * Axios(mypage-recentlist).js
 * 최근 결제 기반 기록을 가져와 Swiper로 표시
 ***/
document.addEventListener('DOMContentLoaded', () => {
    // 로그인된 사용자 ID 가져오기
    const uId = localStorage.getItem('u_id');
    if (!uId) {
        customAlert('로그인이 필요합니다.');
        location.href = '/Loginpage.html';
        return;
    }

    // Swiper 초기화 (최근 기록 전용 세로 스크롤)
    const recentSwiper = new Swiper('.mySwiper', {
        direction: 'vertical',
        slidesPerView: 2,
        spaceBetween: 20,
        mousewheel: true,
        scrollbar: {
            el: '.mySwiper .swiper-scrollbar',
            draggable: true,
        },
    });

    // 전체 기록 및 필터 상태
    let allRecent = [];
    let currentFilter = 'all'; // all | movie | theater | musical

    // DOM 요소 참조
    const wrapper = document.querySelector('.mySwiper .swiper-wrapper');
    const tags = document.querySelectorAll('.tag_nm');

    // 서버에서 최근 기록 조회
    function fetchRecent() {
        axios.get(`http://http://3.36.29.175:5002/api/user/${uId}/recentlist`)
            .then(res => {
                allRecent = Array.isArray(res.data) ? res.data : [];
                renderList();
            })
            .catch(err => {
                console.error('최근 기록 조회 실패:', err);
                customAlert('최근 기록을 불러오는 중 오류가 발생했습니다.');
            });
    }

    // 태그 클릭 시 필터 적용
    tags.forEach(tag => {
        tag.addEventListener('click', () => {
            tags.forEach(t => t.classList.remove('active'));
            tag.classList.add('active');

            const text = tag.textContent.trim();
            currentFilter =
                text === '영화'   ? 'movie' :
                text === '연극'   ? 'theater' :
                text === '뮤지컬' ? 'musical' : 'all';

            renderList();
        });
    });

    // Swiper 슬라이드 렌더링
    function renderList() {
        const list = currentFilter === 'all'
            ? [...allRecent]
            : allRecent.filter(i => i.rc_contentType === currentFilter);

        // 기존 슬라이드 제거
        wrapper.innerHTML = '';
        recentSwiper.removeAllSlides();

        // 항목 없을 때 메시지 표시
        if (list.length === 0) {
            const empty = document.createElement('div');
            empty.className = 'swiper-slide';
            empty.innerHTML = '<p style="color:#aaa; padding:20px;">최근 기록이 없습니다.</p>';
            wrapper.appendChild(empty);
            recentSwiper.appendSlide(empty);
            recentSwiper.update();
            return;
        }

        // 항목마다 슬라이드 생성
        list.forEach(item => {
            const slide = document.createElement('div');
            slide.className = 'swiper-slide';
            slide.innerHTML = `
                <div class="post_box">
                    <img src="${item.rc_poster_url}" alt="${item.rc_title}" />
                </div>
                <div class="movie_list">
                    <p>${item.rc_title}</p>
                    <p>결제일자: ${new Date(item.rc_payed_time).toLocaleString()}</p>
                </div>
            `;

            slide.addEventListener('click', () => {
                let url;
                if (item.rc_contentType === 'movie') url = `/Moviepage.html?m_id=${item.rc_id}`;
                else if (item.rc_contentType === 'theater') url = `/Theaterpage.html?t_id=${item.rc_id}`;
                else if (item.rc_contentType === 'musical') url = `/Musicalpage.html?mu_id=${item.rc_id}`;
                window.location.href = url;
            });

            wrapper.appendChild(slide);
            recentSwiper.appendSlide(slide);
        });

        recentSwiper.update();
    }

    // 초기 데이터 로드
    fetchRecent();
});

