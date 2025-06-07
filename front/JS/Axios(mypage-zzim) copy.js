/***
 * Axios(mypage-zzim).js
 * 사용자 찜 목록을 가져와 Swiper로 표시
 ***/
document.addEventListener('DOMContentLoaded', () => {
    // 로그인된 사용자 ID
    const uId = localStorage.getItem('u_id');
    if (!uId) {
        customAlert('로그인이 필요합니다.');
        location.href = '/Loginpage.html';
        return;
    }

    // Swiper 초기화 (찜 목록용 세로 스크롤)
    const zzimSwiper = new Swiper('.zzimSwiper', {
        direction: 'vertical',
        slidesPerView: 2,
        spaceBetween: 20,
        mousewheel: true,
        scrollbar: {
            el: '.zzimSwiper .swiper-scrollbar',
            draggable: true,
        },
    });

    // 전체 찜 목록 및 필터
    let allWishlist = [];
    let currentFilter = 'all'; // all | movie | theater | musical

    // DOM 요소 참조
    const tags   = document.querySelectorAll('.zzim_tag');
    const counts = document.querySelectorAll('.zzim_nb');
    const wrapper = document.querySelector('.zzimSwiper .swiper-wrapper');

    // 서버에서 찜 목록 조회
    function fetchWishlist() {
        axios.get(`http://http://3.36.29.175:5002/api/user/${uId}/wishlist`)
            .then(res => {
                allWishlist = Array.isArray(res.data) ? res.data : [];
                updateCounts();
                renderList();
            })
            .catch(err => {
                console.error('찜 목록 조회 실패:', err);
                customAlert('찜 목록을 불러오는 중 오류가 발생했습니다.');
            });
    }

    // 카테고리별 개수 갱신
    function updateCounts() {
        const movies   = allWishlist.filter(i => i.w_contentType === 'movie').length;
        const theaters = allWishlist.filter(i => i.w_contentType === 'theater').length;
        const musicals = allWishlist.filter(i => i.w_contentType === 'musical').length;
        counts[0].textContent = `${movies}개`;
        counts[1].textContent = `${theaters}개`;
        counts[2].textContent = `${musicals}개`;
    }

    // 슬라이드 렌더링
    function renderList() {
        const list = currentFilter === 'all'
            ? [...allWishlist]
            : allWishlist.filter(i => i.w_contentType === currentFilter);

        wrapper.innerHTML = '';
        zzimSwiper.removeAllSlides();

        if (list.length === 0) {
            const empty = document.createElement('div');
            empty.className = 'swiper-slide zzim-slide';
            empty.innerHTML = '<p style="color:#aaa; padding:20px;">찜한 항목이 없습니다.</p>';
            wrapper.appendChild(empty);
            zzimSwiper.appendSlide(empty);
            zzimSwiper.update();
            return;
        }

        list.forEach(item => {
            const slide = document.createElement('div');
            slide.className = 'swiper-slide zzim-slide';
            slide.innerHTML = `
                <img src="${item.w_poster_url}" alt="${item.w_title}" />
                <div class="movie_list">
                    <p>${item.w_title}</p>
                    <p>${item.w_contentType === 'movie' ? '영화' : item.w_contentType === 'theater' ? '연극' : '뮤지컬'}</p>
                    <p>${new Date(item.w_start_date).toLocaleString()}</p>
                </div>
                <span class="remove-btn" title="삭제">✖</span>
            `;

            // 삭제 버튼 클릭
            slide.querySelector('.remove-btn').addEventListener('click', ev => {
                ev.stopPropagation();
                if (confirm('찜에서 제거하시겠습니까?')) {
                    deleteWishlist(item.w_contentType, item.w_id);
                }
            });

            // 카드 클릭 시 상세 페이지 이동
            slide.addEventListener('click', ev => {
                if (ev.target.classList.contains('remove-btn')) return;
                let url;
                if (item.w_contentType === 'movie')    url = '/Moviepage.html';
                else if (item.w_contentType === 'theater') url = '/Theaterpage.html';
                else if (item.w_contentType === 'musical') url = '/Musicalpage.html';
                window.location.href = url;
            });

            wrapper.appendChild(slide);
            zzimSwiper.appendSlide(slide);
        });

        zzimSwiper.update();
    }

    // 찜 삭제 요청
    function deleteWishlist(type, id) {
        axios.post(`http://http://3.36.29.175:5002/api/user/${uId}/wishlist/remove`, { w_contentType: type, w_id: id })
            .then(() => {
                customAlert('삭제되었습니다.');
                allWishlist = allWishlist.filter(i => !(i.w_contentType === type && i.w_id === id));
                updateCounts();
                renderList();
            })
            .catch(err => {
                console.error('삭제 실패:', err);
                customAlert('삭제 중 오류가 발생했습니다.');
            });
    }

    // 필터 태그 클릭 처리
    tags.forEach(tag => {
        tag.addEventListener('click', () => {
            tags.forEach(t => t.classList.remove('active'));
            tag.classList.add('active');
            const name = tag.querySelector('.zzim_nm').textContent;
            currentFilter = name === '영화'   ? 'movie'
                         : name === '연극'   ? 'theater'
                         : name === '뮤지컬' ? 'musical'
                         : 'all';
            renderList();
        });
    });

    // 초기 로드
    fetchWishlist();
});
