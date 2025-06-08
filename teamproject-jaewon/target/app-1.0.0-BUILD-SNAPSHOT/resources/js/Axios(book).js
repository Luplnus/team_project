document.addEventListener("DOMContentLoaded", function () {
    axios.get("http://localhost:8080/api/book")
        .then(function (response) {
            const data = response.data;
            const movies = data.movies;
            const musicals = data.musicals;
            const theaters = data.theaters;
            const urlParams = new URLSearchParams(window.location.search);
            const selectedMovie = urlParams.get('movie');

            // 영화, 연극, 뮤지컬 선택
            $('.tag_box').on('click', function () { // .tag_box(영화, 연극, 뮤지컬) 클릭하면
                const contentType = $(this).text(); // 해당 박스 text (영화, 연극, 뮤지컬)
                $('.content_type').text(contentType); // 영화 선택, 영화 이름 -> 뮤지컬 선택, 뮤지컬 이름 으로 바뀌게

                let html = '';
                if ($(this).attr('id') == 'tag_box_theater') { // 연극 선택하면
                    $('.tag_box').removeClass('tag_box_active'); // tag_box_active 클래스 초기화하고
                    $(this).addClass('tag_box_active'); // tag_box_active 클래스 추가
                    theaters.forEach(t => { // mv_nm theaters 개수만큼 추가
                        html += `
                            <div class="mv_nm" data-poster="${t.t_poster}" data-content_id="${t.t_id}" data-venue="${t.t_venue}" data-type="theater">
                                <h4 class="list_title">${t.t_title}</h4>
                                <p><span class="list_genre">${t.t_genre}</span></p>
                            </div>
                        `;
                    });
                } else if ($(this).attr('id') == 'tag_box_musical') {
                    $('.tag_box').removeClass('tag_box_active'); // tag_box_active 클래스 초기화하고
                    $(this).addClass('tag_box_active'); // tag_box_active 클래스 추가
                    musicals.forEach(mu => {
                        html += `
                            <div class="mv_nm" data-poster="${mu.mu_poster}" data-content_id="${mu.mu_id}" data-venue="${mu.mu_venue}" data-type="musical">
                                <h4 class="list_title">${mu.mu_title}</h4>
                                <p><span class="list_genre">${mu.mu_genre}</span></p>
                            </div>
                        `;
                    });
                } else {
                    $('.tag_box').removeClass('tag_box_active'); // tag_box_active 클래스 초기화하고
                    $(this).addClass('tag_box_active'); // tag_box_active 클래스 추가
                    movies.forEach(m => {
                        const hours = Math.floor(m.m_show_tm / 60);
                        const minutes = m.m_show_tm % 60;
                        html += `
                            <div class="mv_nm" data-poster="${m.m_poster_url}" data-content_id="${m.m_movie_cd}" data-showtime="${m.m_show_tm}" data-type="movie">
                                <h4 class="list_title">${m.m_title}</h4>
                                <p>
                                    <span class="list_genre">${m.m_genre_nm}</span> / ${hours}시간 ${minutes}분
                                </p>
                            </div>
                        `;
                    });
                }
                $('#movieList').html(html);
            });
            // 영화, 연극, 뮤지컬 어떤 상세페이지에서 들어왔는지
            const params = new URLSearchParams(window.location.search); // ?type=movie&content_id=~~ qurey로 받아서
            let content_type = params.get('type');       // 'movie', 'musical', 'theater'
            let content_id = params.get('content_id');   // 콘텐츠 ID

            if (content_type == "musical") { // musical 상세 페이지에서 들어오면
                $('#tag_box_musical').trigger('click'); // 뮤지컬 리스트 띄워줌
            } else if (content_type == "theater") { // theater 상세 페이지에서 들어오면
                $('#tag_box_theater').trigger('click'); // 연극 리스트 띄워줌
            } else { // 그냥 들어오거나 movie 상세 페이지에서 들어오면
                $('#tag_box_movie').trigger('click'); // 영화 리스트 띄워줌
            }

            // 작품 클릭 // 왼쪽에 정보 변하고 극장 세팅
            $(document).on('click', '.mv_nm', function () { // 작품 클릭
                if($(this).hasClass('mv_nm_active')){ // 이미 클릭됐으면
                    $(this).toggleClass('mv_nm_active'); // active 클래스 삭제
                    content_id = ""; // content_id 초기화
                }
                else{
                    $('.mv_nm').removeClass('mv_nm_active'); // active 클래스 초기화
                    $(this).toggleClass('mv_nm_active'); // this만 active 클래스 추가
                    content_id = $(this).data('content_id'); // 선택한 작품의 id를 content_id에 저장
                }

                content_type = $(this).data('type'); // 뮤지컬 선택했으면 type == musical

                let title = $(this).find('.list_title').text(); // 제목
                let genre = $(this).find('.list_genre').text(); // 장르
                let poster = $(this).data('poster'); // 포스터 url
                let venue = $(this).data('venue'); // 극장
                if(!venue) { // 영화면
                    venue = ""; // 극장 없음
                }

                let venue_next_1 = $(this).nextAll().eq(0).data('venue');
                let venue_next_2 = $(this).nextAll().eq(1).data('venue');
                let venue_next_3 = $(this).nextAll().eq(2).data('venue');
                let venue_next_4 = $(this).nextAll().eq(3).data('venue');
                let venue_next_5 = $(this).nextAll().eq(4).data('venue');
                let venue_prev_1 = $(this).prevAll().eq(0).data('venue');
                let venue_prev_2 = $(this).prevAll().eq(1).data('venue');
                let venue_prev_3 = $(this).prevAll().eq(2).data('venue');
                let venue_prev_4 = $(this).prevAll().eq(3).data('venue');
                let venue_prev_5 = $(this).prevAll().eq(4).data('venue');

                let showtime = $(this).data('showtime'); // 쇼타임
                if(showtime) { // 쇼타임이 있으면(영화면)
                    $('.content_runtime').text(Math.floor(showtime / 60) + "시간 " + (showtime % 60) + "분"); // 쇼타임 표시
                }
                else { // 영화가 아니면
                    $('.content_runtime').text(""); // 쇼타임 없음
                }

                $('.post_box').children('img').attr('src', poster);
                $('.content_name').text(title);
                $('.content_genre').text(genre);
                $('.content_venue').text(venue);

                if(venue == ""){
                    $('#venue_list').html( // 근처 상영관
                        `<div class="cinema_box venue_box">CGV</div>
                <div class="cinema_box venue_box">롯데시네마</div>
                <div class="cinema_box venue_box">메가박스</div>
                <div class="cinema_box venue_box">씨네Q</div>
                <div class="cinema_box venue_box">조이앤시네마</div>
                <div class="cinema_box venue_box">씨네큐브</div>
                `
                    );
                }
                else{
                    if(venue_next_5 == null){ // 마지막 5개
                        $('#venue_list').html( // 근처 상영관
                            `<div class="cinema_box venue_box">${venue}</div>
                <div class="cinema_box venue_box">${venue_prev_1}</div>
                <div class="cinema_box venue_box">${venue_prev_2}</div>
                <div class="cinema_box venue_box">${venue_prev_3}</div>
                <div class="cinema_box venue_box">${venue_prev_4}</div>
                <div class="cinema_box venue_box">${venue_prev_5}</div>
                `
                        );
                    }
                    else{
                        $('#venue_list').html( // 근처 상영관
                            `<div class="cinema_box venue_box">${venue}</div>
                <div class="cinema_box venue_box">${venue_next_1}</div>
                <div class="cinema_box venue_box">${venue_next_2}</div>
                <div class="cinema_box venue_box">${venue_next_3}</div>
                <div class="cinema_box venue_box">${venue_next_4}</div>
                <div class="cinema_box venue_box">${venue_next_5}</div>
                `
                        );
                    }
                }
            })

            let seat_is_able = [];
            let count = 0;
            // Axios로 받아온 데이터 저장
            let s_is_available_movie = [];
            let s_is_available_musical = [];
            let s_is_available_theater = [];
            s_is_available_movie = data.s_is_available_movie;
            s_is_available_musical = data.s_is_available_musical;
            s_is_available_theater = data.s_is_available_theater;

            // 작품 선택 후 다음 버튼
            $(document).on('click', '#step_1', function () {
                if (!content_id) {
                    alert("작품을 선택해주세요");
                    return;
                }

                seat_is_able = [];
                count = 0;

                // 해당 콘텐츠에 따라 좌석 s_is_available false인 좌석 s_label만 수집
                if (content_type == "movie") { // 영화 선택했으면
                    s_is_available_movie.forEach(function (s) { // s_is_available_movie배열 에서
                        if (s.m_code == content_id) { // 해당 영화 id와 s_si_available false인 좌석의 id가 같으면
                            seat_is_able.push(s.s_label); //seat_is_able배열에 해당 s_lable을 추가
                        }
                    });
                } else if (content_type == "musical") {
                    s_is_available_musical.forEach(function (s) {
                        if (s.mu_id == content_id) {
                            seat_is_able.push(s.s_label);
                        }
                    });
                } else if (content_type == "theater") {
                    s_is_available_theater.forEach(function (s) {
                        if (s.t_id == content_id) {
                            seat_is_able.push(s.s_label);
                        }
                    });
                }
                // 좌석 버튼 초기화 및 disable 처리
                $('.tck_seat_box button').each(function () { // 좌석 모두 불러와서
                    $(this).removeClass('disabled'); // 초기화
                    const seatLabel = $(this).attr('id'); // 좌석번호 ex: D09
                    if (seat_is_able.includes(seatLabel)) { // seat_is_able에 해당 좌석 번호가 있으면
                        $(this).addClass('disabled'); // disabled 클래스 추가
                    }
                });
                // 다음 스텝 진행
                nextStep();
            });

            // 극장 선택
            let venue = "";
            $(document).on('click', '.venue_box', function () { // 극장 클릭
                if($(this).hasClass('cinema_box_active')){ // 이미 클릭됐으면
                    $(this).toggleClass('cinema_box_active'); // active 클래스 삭제
                    venue = ""; // venue 초기화
                }
                else{
                    $('.venue_box').removeClass('cinema_box_active'); // active 클래스 초기화
                    $(this).toggleClass('cinema_box_active'); // this만 active 클래스 추가
                    venue = $(this).text(); // 선택한 극장 저장
                }
            })

            // 극장 선택 후 다음 버튼
            $(document).on('click', '#step_2', function () {
                if(venue == "") { // 극장 선택 안했으면
                    alert("극장을 선택해주세요");
                }
                else{
                    nextStep();
                }
            })

            // 극장 선택 이전 버튼
            $(document).on('click', '#prev_step_2', function () {
                venue = ""; // venue 초기화해서 다시 다음버튼 눌러서 들어오면 극장 선택
                $('.venue_box').removeClass('cinema_box_active'); // 극장 선택 active 클래스 초기화
                prevStep();
            })

            // 시간 선택
            let time = "";

            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1).padStart(2, '0'); // 0~11이므로 +1
            const day = String(today.getDate()).padStart(2, '0');
            const formattedDate = year + "-" + month + "-" + day;

            $(document).on('click', '.time_box', function () { // 시간 클릭
                if($(this).hasClass('cinema_box_active')){ // 이미 클릭됐으면
                    $(this).toggleClass('cinema_box_active'); // active 클래스 삭제
                    time = ""; // time 초기화
                }
                else{
                    $('.time_box').removeClass('cinema_box_active'); // active 클래스 초기화
                    $(this).toggleClass('cinema_box_active'); // this만 active 클래스 추가
                    time = formattedDate + " " + $(this).text(); // 선택한 시간 저장
                }
            })

            // 시간 선택 후 다음 버튼
            $(document).on('click', '#step_3', function () {
                if(time == "") { // 시간 선택 안했으면
                    alert("시간을 선택해주세요");
                }
                else{
                    nextStep();
                }
            })

            // 시간 선택 이전 버튼
            $(document).on('click', '#prev_step_3', function () {
                time = ""; // time 초기화해서 다시 다음버튼 눌러서 들어오면 시간 선택
                $('.time_box').removeClass('cinema_box_active'); // active 클래스 초기화
                prevStep();
            })

            // 좌석 선택
            let s_label = "";
            $(document).on('click', '.tck_seat_box button', function (){
                if($(this).hasClass('selected')){
                    $(this).toggleClass('selected');
                    s_label = ""; // s_label 초기화
                }
                else{
                    $('.tck_seat_box button').removeClass('selected'); // selected 클래스 초기화
                    $(this).addClass('selected');
                    s_label =  $(this).text(); // s_label에 좌석 번호 저장
                }
            })

            // 좌석 선택 후 다음 버튼
            $(document).on('click', '#tck_complete', function () {
                if(s_label == ""){
                    alert("좌석을 선택하세요");
                }
                else{
                    if(content_type == "movie"){ // 선택한 작품이 영화이면
                        axios.post("http://localhost:8080/payment/movie", // /payment/movie로 post, 컨트롤러에서 session에 movieDto set
                            {
                                content_id: content_id,
                                time: time,
                                venue: venue,
                                s_label: s_label
                            },
                            {
                                headers: {
                                    'Content-Type': 'application/json'
                                }
                            }
                        )
                            .then(function(result) {
                                // 성공 시 결제 페이지로 이동 //
                                window.location.href = "Pay_page.html";
                            })
                            .catch(function(error) {
                                alert("error");
                                console.error(error);
                            });
                    }
                    else if(content_type == "musical"){
                        axios.post("http://localhost:8080/payment/musical",
                            {
                                content_id: content_id,
                                time: time,
                                venue: venue,
                                s_label: s_label
                            },
                            {
                                headers: {
                                    'Content-Type': 'application/json'
                                }
                            }
                        )
                            .then(function(result) {
                                // 성공 시 결제 페이지로 이동
                                window.location.href = "Pay_page.html";
                            })
                            .catch(function(error) {
                                alert("error");
                                console.error(error);
                            });
                    }
                    else {
                        axios.post("http://localhost:8080/payment/theater",
                            {
                                content_id: content_id,
                                time: time,
                                venue: venue,
                                s_label: s_label
                            },
                            {
                                headers: {
                                    'Content-Type': 'application/json'
                                }
                            }
                        )
                            .then(function(result) {
                                // 성공 시 결제 페이지로 이동
                                window.location.href = "Pay_page.html";
                            })
                            .catch(function(error) {
                                alert("error");
                                console.error(error);
                            });
                    }

                }
            })

            // 좌석 선택 이전 버튼
            $(document).on('click', '#prev_step_complete', function () {
                $('.tck_seat_box button').removeClass('selected'); // selected 클래스 초기화
                s_label = ""; // s_label 초기화해서 다시 다음버튼 눌러서 들어오면 좌석 선택
                prevStep();
            })

            // 처음 들어왔을 때 .mv_nm 활성화되게
            let tmp = true;
            $('.mv_nm').each(function(){ // 리스트 각각 불러와서
                if($(this).data('content_id') == content_id){ // 상세페이지에서 들어온 작품과 일치하면
                    tmp = false;
                    $(this).trigger('click'); // 클릭되게
                    this.scrollIntoView({ behavior: 'smooth' });
                }
            })
            if(tmp){
                $('.mv_nm').first().trigger('click'); // 상세페이지에서 들어온게 아니면 기본 첫번째 영화 띄워줌
            }
        })
        .catch(function (error) {
            console.error('데이터 로드 실패:', error);
        });
});