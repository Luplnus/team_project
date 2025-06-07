function refreshWishState() {
    axios.get(`http://http://3.36.29.175:5002/api/user/${uId}/wishlist`)
        .then(res => {
            const isWished = res.data.some(w =>
                w.w_contentType === 'theater' && String(w.w_id) === String(currentTheaterId)
            );
            setWishState(isWished);
        });
}

document.addEventListener('DOMContentLoaded', () => {
    axios.get('http://http://3.36.29.175:5002/api/theaters')
        .then(res => {
            const data = res.data;
            const wrapper = document.querySelector('.main-swiper .swiper-wrapper');

            wrapper.innerHTML = '';
            data.forEach(item => {
                const slide = document.createElement('div');
                slide.className = 'swiper-slide main-slide';
                slide.innerHTML = `<img src="${item.t_poster}" alt="${item.t_title}" ` +
                                  `onerror="this.src='https://via.placeholder.com/240x204?text=No+Image'"/>`;

                slide.addEventListener('click', () => {
                    document.querySelector('.post_img').src       = item.t_poster;
                    document.querySelector('.movie_title').textContent = item.t_title;
                    document.querySelector('.year').textContent       = formatKoreanDate(item.t_start_date);
                    document.querySelector('.runtime').textContent    = formatKoreanDate(item.t_end_date);
                    document.querySelector('.pfm_hall').textContent   = item.t_venue;
                    currentTheaterId = item.t_id;
                    refreshWishState();
                });

                wrapper.appendChild(slide);
            });
            mainSwiper.update();

            if (data.length) {
                const first = data[0];
                document.querySelector('.post_img').src          = first.t_poster;
                document.querySelector('.movie_title').textContent = first.t_title;
                document.querySelector('.year').textContent       = formatKoreanDate(first.t_start_date);
                document.querySelector('.runtime').textContent    = formatKoreanDate(first.t_end_date);
                document.querySelector('.pfm_hall').textContent   = first.t_venue;
                currentTheaterId = first.t_id;
            }

            document.querySelector('.btn_primary').addEventListener('click', () => {
                if (!currentTheaterId) {
                    customAlert('연극을 먼저 선택하세요.');
                    return;
                }
                window.location.href = `/ticketing_page.html?type=theater&content_id=${currentTheaterId}`;
            });
        })
        .catch(err => console.error('연극 데이터 로드 실패:', err));
});