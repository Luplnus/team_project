document.addEventListener("DOMContentLoaded", function () {
    axios.get("https//localhost:8080/api/musical").then(function (response) {
        const data = response.data;
        const wrapper = document.querySelector('.main-swiper .swiper-wrapper');

        wrapper.innerHTML = '';
        data.forEach(function(item){

            const slide = document.createElement('div');

            slide.className = 'swiper-slide main-slide';

            slide.innerHTML =
                `<img src="${item.mu_poster}" alt="${item.mu_title}" onerror="this.src='https://via.placeholder.com/240x204?text=No+Image'">`

                slide.addEventListener('click', function () {
                    document.querySelector('.post_img').src = item.mu_poster;
                    document.querySelector('.movie_title').textContent = item.mu_title;
                    document.querySelector('.year').textContent = formatKoreanDate(item.mu_prfpdfrom);
                    document.querySelector('.runtime').textContent = formatKoreanDate(item.mu_prfpdto);
                    document.querySelector('.pfm_hall').textContent = item.mu_venue;
                });

                wrapper.appendChild(slide);
            });

            mainSwiper.update();
        })
        .catch(function (error) {
            console.error('연극 데이터 로드 실패:', error);
        });
    });
