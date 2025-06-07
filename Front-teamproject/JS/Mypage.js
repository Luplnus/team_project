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

        const itemsPerPage = 5;

        
        let historyCurrentPage = 0;
        let historyIsLoading = false;
        let historyHasMoreData = true;

        async function loadMoreHistoryData(swiperInstance) {
            if (historyIsLoading || !historyHasMoreData) return;
            
            historyIsLoading = true;
            
            setTimeout(() => {
                const wrapper = swiperInstance.wrapperEl; 
                
                for(let i = 0; i < itemsPerPage; i++) {
                    const slideHTML = `
                        <div class="swiper-slide">
                            <div class="post_box">
                                <img src="" alt="영화 포스터">
                            </div>
                            <div class="movie_list">
                                <p>최근 기록 영화 이름 ${historyCurrentPage * itemsPerPage + i + 1}</p>
                                <p>평점</p>
                                <p>장르</p>
                                <p>관람일자</p>
                            </div>
                        </div>
                    `;
                    wrapper.insertAdjacentHTML('beforeend', slideHTML);
                }
                
                historyCurrentPage++;
                historyIsLoading = false;
                
                swiperInstance.update();
                
                if (historyCurrentPage >= 20) {
                    historyHasMoreData = false;
                }
            }, 1000);
        }

        
        let zzimCurrentPage = 0;
        let zzimIsLoading = false;
        let zzimHasMoreData = true;

        async function loadMoreZzimData(swiperInstance) {
            if (zzimIsLoading || !zzimHasMoreData) return;
            
            zzimIsLoading = true;
            
            setTimeout(() => {
                const wrapper = swiperInstance.wrapperEl; 
                
                for(let i = 0; i < itemsPerPage; i++) {
                    const slideHTML = `
                        <div class="swiper-slide zzim-slide">
                            <div class="post_box">
                                <img src="" alt="영화 포스터">
                            </div>
                            <div class="movie_list">
                                <p>찜 목록 영화 이름 ${zzimCurrentPage * itemsPerPage + i + 1}</p>
                                <p>평점</p>
                                <p>장르</p>
                                <p>관람일자</p>
                            </div>
                        </div>
                    `;
                    wrapper.insertAdjacentHTML('beforeend', slideHTML);
                }
                
                zzimCurrentPage++;
                zzimIsLoading = false;
                
                swiperInstance.update();
                
                if (zzimCurrentPage >= 20) { 
                    zzimHasMoreData = false;
                }
            }, 1000);
        }

        
        var zzimSwiper = new Swiper(".zzimSwiper", {
            direction: "vertical",
            slidesPerView: 2,
            spaceBetween: 20,
            mousewheel: true,
            scrollbar: {
                el: ".zzimSwiper .swiper-scrollbar",
                draggable: true,
            },
            
            on: {
                reachEnd: function () {
                    loadMoreZzimData(this); 
                },
                slideChange: function () {
                    
                    if (this.activeIndex >= this.slides.length - 3) {
                        loadMoreZzimData(this);
                    }
                }
            }
        });

        var mySwiper = new Swiper(".mySwiper", {
            direction: "vertical",
            slidesPerView: 2,
            spaceBetween: 20,
            mousewheel: true,
            scrollbar: {
                el: ".mySwiper .swiper-scrollbar",
                draggable: true,
            },
            
            on: {
                reachEnd: function () {
                    loadMoreHistoryData(this); // `this`는 현재 Swiper 인스턴스를 나타냅니다.
                },
                slideChange: function () {
                    // 끝에서 3번째 슬라이드에 도달하면 미리 로드
                    if (this.activeIndex >= this.slides.length - 3) {
                        loadMoreHistoryData(this);
                    }
                }
            }
        });
        
        //사이드바 메뉴 네비게이션
        document.addEventListener('DOMContentLoaded', function() {
            const sections = document.querySelectorAll('.mypage_container');
            
            // 메뉴 클릭 
            document.addEventListener('click', function(e) {
                if (e.target.classList.contains('menu_item')) {
                    const menuIndex = [...e.target.parentNode.children].indexOf(e.target);

                    document.querySelectorAll('.menu_item').forEach(item => item.classList.remove('active'));
                    sections.forEach(section => section.style.display = 'none');
                    
                    // 해당 섹션 표시 및 메뉴 활성화
                    sections[menuIndex].style.display = 'flex';
                    sections[menuIndex].querySelectorAll('.menu_item')[menuIndex].classList.add('active');
                }
            });
            
            // 첫 번째 섹션표시
            sections.forEach((section, i) => {
                section.style.display = i === 0 ? 'flex' : 'none';
                if (i === 0) section.querySelector('.menu_item').classList.add('active');
            });
        });

        function smoothScrollToSection(targetSection) {
            targetSection.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }