document.addEventListener("DOMContentLoaded", function () {
    axios.get("http://3.36.29.175:5000/api/theaters").then(function (response) {
        const data = response.data;
        const wrapper = document.querySelector('.main-swiper .swiper-wrapper');

        wrapper.innerHTML = '';
        data.forEach(function(item){

            const slide = document.createElement('div');

            slide.className = 'swiper-slide main-slide';

            slide.innerHTML =
                `<img src="${item.t_poster}" alt="${item.t_title}" onerror="this.src='https://via.placeholder.com/240x204?text=No+Image'">`

                slide.addEventListener('click', function () {
                    document.querySelector('.post_img').src = item.t_poster;
                    document.querySelector('.movie_title').textContent = item.t_title;
                    document.querySelector('.year').textContent = formatKoreanDate(item.t_start_date);
                    document.querySelector('.runtime').textContent = formatKoreanDate(item.t_end_date);
                    document.querySelector('.pfm_hall').textContent = item.t_venue;
                });

                wrapper.appendChild(slide);
            });

            mainSwiper.update();
        })
        .catch(function (error) {
            console.error('연극 데이터 로드 실패:', error);
        });
    });
