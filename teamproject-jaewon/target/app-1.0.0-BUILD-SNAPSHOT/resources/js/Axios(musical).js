let code = "";

document.addEventListener("DOMContentLoaded", function () {
    axios.get("http://3.36.29.175:5001/api/musicals").then(function (response) {
        const data = response.data;
        const wrapper = document.querySelector('.main-swiper .swiper-wrapper');

        document.querySelector('.post_img').src = data[0].mu_poster;
        document.querySelector('.movie_title').textContent = data[0].mu_title;
        document.querySelector('.year').textContent = formatKoreanDate(data[0].mu_prfpdfrom);
        document.querySelector('.runtime').textContent = formatKoreanDate(data[0].mu_prfpdto);
        document.querySelector('.genre').textContent = data[0].mu_genre;
        document.querySelector('.info_label').textContent = data[0].mu_venue;
        code = data[0].mu_id;

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
                    document.querySelector('.genre').textContent = item.mu_genre;
                    document.querySelector('.info_label').textContent = item.mu_venue;
                    code = item.mu_id;
                });

                wrapper.appendChild(slide);
            });

            mainSwiper.update();
        })
        .catch(function (error) {
            console.error('뮤지컬 데이터 로드 실패:', error);
        });
    });
const searchIcon = document.getElementById('search_icon');
const searchBar = document.getElementById('search_bar');
const bookBtn = document.getElementById('book_btn');

// 검색 기능
searchIcon.addEventListener('click', function (e) {
    e.preventDefault();
    searchBar.classList.toggle('active');
    if (searchBar.classList.contains('active')) {
        setTimeout(() => {
            searchBar.focus();
        }, 100);
    }
});

// 검색바에서 엔터 누르면 검색
searchBar.addEventListener('keydown', function (e) {
    if (e.key == 'Enter') {
        e.preventDefault();
        searchValue = searchBar.value.trim();
        if (searchValue) {
            axios.get("http://localhost:8080/api/search_musical" , {
                params: { keyword: searchValue }
            })
                .then(function (response) {
                    const data = response.data;
                    const wrapper = document.querySelector('.main-swiper .swiper-wrapper');

                    document.querySelector('.post_img').src = data[0].mu_poster;
                    document.querySelector('.movie_title').textContent = data[0].mu_title;
                    document.querySelector('.year').textContent = formatKoreanDate(data[0].mu_prfpdfrom);
                    document.querySelector('.runtime').textContent = formatKoreanDate(data[0].mu_prfpdto);
                    document.querySelector('.genre').textContent = data[0].mu_genre;
                    document.querySelector('.info_label').textContent = data[0].mu_venue;
                    code = item.mu_id;

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
                            document.querySelector('.genre').textContent = item.mu_genre;
                            document.querySelector('.info_label').textContent = item.mu_venue;
                            code = item.mu_id;
                        });

                        wrapper.appendChild(slide);
                    });

                    mainSwiper.update();
                })
                .catch(function (error) {
                    alert("검색 결과가 없습니다");
                });
        }
    }
});

// 예매버튼 클릭시 type과 id 보냄
bookBtn.addEventListener('click', function (e) {
    e.preventDefault();
    axios.get("http://localhost:8080/api/loginChk")
        .then(function (response) {
            if(response.data == false){ // 로그인 안되어 있으면
                window.location.href = "/app/login.html";
            }
            else{ // 로그인 되어 있으면
                window.location.href = "/app/ticketing_page.html?type=musical&content_id=" + code;
            }
        })
})
