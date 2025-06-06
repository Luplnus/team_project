   const searchIcon = document.getElementById('search_icon');
            const searchBar = document.getElementById('search_bar');
            const movieList = document.getElementById('movieList');
            
            let currentStep = 1;
            let movieCount = 10;

            // 검색 기능
            searchIcon.addEventListener('click', function(e) {
                e.preventDefault();
                searchBar.classList.toggle('active');
                if (searchBar.classList.contains('active')) {
                    setTimeout(() => {
                        searchBar.focus();
                    }, 100);
                }
            });

            // 무한 스크롤 
            movieList.addEventListener('scroll', function() {
                if (movieList.scrollTop + movieList.clientHeight >= movieList.scrollHeight - 10) {
                    loadMoreMovies();
                }
            });

            function loadMoreMovies() {
                for (let i = 1; i <= 4; i++) {
                    movieCount++;
                    const movieItem = document.createElement('div');
                    movieItem.className = 'mv_nm';
                    movieItem.innerHTML = `
                        <h4>영화이름 ${movieCount}</h4>
                        <p>장르/런타임/예매일자</p>
                    `;
                    movieList.appendChild(movieItem);
                }
            }

            // 다음 단계로 이동
            function nextStep() {
                if (currentStep < 4) {
                    document.getElementById('step' + currentStep).classList.remove('active');

                    currentStep++;
                    document.getElementById('step' + currentStep).classList.add('active');
                } else {
                    alert('예매가 완료되었습니다!');
                }
            }

            // 이전 단계로 이동
            function prevStep() {
                if (currentStep > 1) {
                
                    document.getElementById('step' + currentStep).classList.remove('active');

                    currentStep--;
                    document.getElementById('step' + currentStep).classList.add('active');
                }
            }

            // 좌석 클릭 기능 추가
            const seatButtons = document.querySelectorAll('.tck_seat_box button');
            seatButtons.forEach(button => {
                button.addEventListener('click', function() {
                    this.classList.toggle('selected');
                });
            });