    
        // 메인 슬라이더 설정
        var mainSwiper = new Swiper(".main-swiper", {
            slidesPerView: 5,
            spaceBetween: 30,
            freeMode: true,
            loop: true,
            speed: 800,
            scrollbar: {
                el: ".swiper-scrollbar",
                 hide: true,
            },
            breakpoints: {
                320: {
                    slidesPerView: 1,
                    spaceBetween: 10
                },
                640: {
                    slidesPerView: 2,
                    spaceBetween: 20
                },
                768: {
                    slidesPerView: 3,
                    spaceBetween: 20
                },
                1024: {
                    slidesPerView: 4,
                    spaceBetween: 30
                },
                1440: {
                    slidesPerView: 5,
                    spaceBetween: 30
                }
            }
        });

        // 팝업 슬라이더 설정
        var popupSwiper = new Swiper(".popup-swiper", {
            slidesPerView: 'auto',
            spaceBetween: 10,
            grabCursor: true,
            preventClicks: true,
            preventClicksPropagation: true,
            slidesOffsetBefore: 0,
            slidesOffsetAfter: 0,  
            breakpoints: {
                320: {
                    slidesPerView: 1.5,
                    spaceBetween: 10
                },
                640: {
                    slidesPerView: 2.5,
                    spaceBetween: 10
                },
                800: {
                    slidesPerView: 3,
                    spaceBetween: 10
                }
            }
        });
    

        const searchIcon = document.getElementById('search_icon');
        const searchBar = document.getElementById('search_bar');

        searchIcon.addEventListener('click', function(e) {
            e.preventDefault();
            searchBar.classList.toggle('active');
            if (searchBar.classList.contains('active')) {
                setTimeout(() => {
                    searchBar.focus();
                }, 100);
            }
        });