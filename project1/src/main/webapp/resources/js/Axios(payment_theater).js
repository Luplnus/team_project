// axios.get('/app/payment/data/theater')
//     .then(function (res) {
//         const data = res.data;
//         const theater = data.theaterDto;
//
//         document.getElementById('tck_title').textContent = theater.t_title || '제목 없음';
//         document.getElementById('tck_seat').textContent = data.s_label || '좌석 없음';
//         document.getElementById('tck_showtime').textContent = data.time || '시간 없음';
//         document.getElementById('tck_poster').src = theater.t_poster || '';
//     })
//     .catch(function (error) {
//         console.error("결제 데이터 로딩 실패", error);
//     });