// const API_URL = 'http://localhost:8080/app/api/payments';
// const IMAGE_PROXY = url => `http://localhost:8080/image-proxy?url=${encodeURIComponent(url)}`;

const API_URLS = [
    'http://3.36.29.175:5003/api/payments',
    'http://3.36.29.175:5003/api/movies'
];

const hour = Math.floor(Math.random() * 24);
// 날짜 포맷 함수 (예시)
function formatKoreanDate(dateStr) {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const weekday = days[date.getDay()];
    const hour = Math.floor(Math.random() * 24); // 임의 시간대
    const minute = Math.floor(Math.random() * 6) * 10;
    const minuteStr = minute.toString().padStart(2, '0'); // Str 맥여 한자릿수 0 붙이기

    return `${year}. ${month}. ${day} (${weekday}) ${hour}:${minuteStr}`;
}

Promise.all(API_URLS.map(url => axios.get(url)))
    .then(([paymentsRes, moviesRes]) => { // axios에서 받아온 여러 데이터 응답 받기, 화살표 함수로 중괄호 안 코드 실행(사용해야 함)

        // 데이터 확인 후 해당 배열의 데이터 사용
        const paymentItem = Array.isArray(paymentsRes.data) ? paymentsRes.data[0] : paymentsRes.data;
        const movieItem = Array.isArray(moviesRes.data) ? moviesRes.data[0] : moviesRes.data;

        for(let i = 0; i < moviesRes.data.length; i++) {
            // aaaa.content_id == moviesRes.data[i];
            moviesRes.data[i].m_poster_url;
        }

        // 콘솔 내 데이터 배열
        // console.log('결제 데이터:', paymentsRes.data);
        // console.log('영화 데이터:', moviesRes.data);

        // 티켓 정보 데이터 출력
        // document.getElementById('tck_poster').src = IMAGE_PROXY(movieItem.m_poster_url);
        // document.getElementById('tck_title').textContent = movieItem.m_title || '제목 정보 없음';
        // document.getElementById('tck_seat').textContent = movieItem.m_rating + "점" || '좌석 정보 없음'; // 임의 레이팅
        // document.getElementById('tck_showtime').textContent = movieItem.m_show_tm + "분" || '총 관람 시간 정보 없음';
        // document.getElementById('tck_date').textContent = formatKoreanDate(movieItem.m_open_dt) || '관람 일시 정보 없음'; // 임의 영화 개봉일
    })

