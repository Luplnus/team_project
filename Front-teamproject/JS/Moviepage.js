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
        

        // banner-swiper 초기화
        var bannerSwiper = new Swiper(".banner-swiper", {
            loop: true,
            speed: 500,
            scrollbar: {
                el: ".swiper-scrollbar",
                hide: true,
            },
            on: {
            slideChangeTransitionStart: function() {
                // 모든 비디오를 리셋
                document.querySelectorAll('.mv_trailer').forEach(function(video) {
                    video.currentTime = 0;
                    video.classList.remove('show');
                });
                
                // 모든 이미지를 다시 보이게
                document.querySelectorAll('.banner-slide img').forEach(function(img) {
                    img.classList.remove('hide');
                });
                
                // 현재 활성화된 슬라이드의 비디오와 이미지 준비
                setTimeout(function() {
                    const activeSlide = document.querySelector('.swiper-slide-active');
                    if (activeSlide) {
                        const video = activeSlide.querySelector('.mv_trailer');
                        const img = activeSlide.querySelector('img');
                        
                        if (video && img) {
                            // 1초 후 비디오 재생 및 이미지 숨김
                            setTimeout(function() {
                                video.play().then(function() {
                                    img.classList.add('hide');
                                    video.classList.add('show');
                                }).catch(function(error) {
                                    console.log('비디오 재생 실패:', error);
                                });
                            }, 1000);
                        }
                    }
                }, 1000);
            }
        }
    });
      
        setTimeout(function() {
        const firstSlide = document.querySelector('.swiper-slide-active');
        if (firstSlide) {
            const video = firstSlide.querySelector('.mv_trailer');
            const img = firstSlide.querySelector('img');
            
            if (video && img) {
                setTimeout(function() {
                    video.play().then(function() {
                        img.classList.add('hide');
                        video.classList.add('show');
                    }).catch(function(error) {
                        console.log('초기 비디오 재생 실패:', error);
                    });
                }, 1000);
            }
        }
    }, 2000); // 페이지 로드 후 2초 대기

        // movie-swiper 설정
        var movieSwiper = new Swiper(".movie-swiper", {
            slidesPerView: 5,
            spaceBetween: 30,
            freeMode: true,
            loop: true,
            speed: 800,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
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

        // 팝업창 열기/닫기 기능
        document.querySelectorAll('.movie-slide').forEach(function(slide) {
            slide.addEventListener('click', function() {
                const popup = document.querySelector('.movie_popup');
                popup.style.display = 'block';
    
                void popup.offsetWidth;
                popup.classList.add('active');
               
                popup.scrollTo(0, 0);
           
                document.body.style.overflow = 'hidden';
            });
        });

        
        document.querySelector('.close-popup').addEventListener('click', function() {
            const popup = document.querySelector('.movie_popup');
            popup.classList.remove('active');
           
            setTimeout(function() {
                if (!popup.classList.contains('active')) {
                    popup.style.display = 'none';
                    
                    document.body.style.overflow = '';
                }
            }, 500); // transition 시간과 동일하게 설정
        });

        

        // 팝업 외부 클릭시 닫기
        document.querySelector('.movie_popup').addEventListener('click', function(event) {
            if (event.target === this) {
                this.classList.remove('active');
                
                setTimeout(() => {
                    if (!this.classList.contains('active')) {
                        this.style.display = 'none';
                        // 바디 스크롤 다시 활성화
                        document.body.style.overflow = '';
                    }
                }, 500);
            }
        });

        // 반응형 처리
        window.addEventListener('resize', function() {
            if (popupSwiper) {
                popupSwiper.update();
            }
            if (movieSwiper) {
                movieSwiper.update();
            }
            if (bannerSwiper) {
                bannerSwiper.update();
            }
        });