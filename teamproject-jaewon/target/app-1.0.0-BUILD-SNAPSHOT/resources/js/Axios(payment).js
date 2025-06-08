// 베이스, 엔드 포인트 작성해야 함
// const API_URLS = [
//     'http://3.36.29.175:5001/api/payments',
//     'http://3.36.29.175:5001/api/movies'
// ];
const IMAGE_PROXY = url => `http://3.36.29.175:5001/image-proxy?url=${encodeURIComponent(url)}`;

// 날짜 포맷 함수
function formatKoreanDate(dateStr) {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const weekday = days[date.getDay()];
    const hour = date.getHours();
    const minute = date.getMinutes();
    const hourStr = hour.toString().padStart(2, '0');
    const minuteStr = minute.toString().padStart(2, '0');

    return `${year}. ${month}. ${day} (${weekday}) ${hourStr}:${minuteStr}`;
}

// ========================== 카드 데이터 ============================
let buyerCard = null; // 구매자 카드 정보 저장용

axios.get('http://3.36.29.175:5001/api/payments')
    .then(function(res) {
        buyerCard = res.data; // 데이터
    })
    .catch(function(error) {
        console.error('구매자 카드 정보 불러오기 실패', error);
    });


// ===================== 카드사 선택 데이터 처리 =====================
document.querySelectorAll('.card_nm').forEach(function(box) {
    box.addEventListener('click', function() {
        document.querySelectorAll('.card_nm').forEach(el => el.classList.remove('selected')); // 선택된 카드 박스 제외, 선택 표시 없애기 el은 element로 박스 요소
        this.classList.add('selected'); // 선택 표시
        document.getElementById('pm_bank').value = this.dataset.value; // data-value의 속성값을 저장
    });
});

// ===================== 카드 결제 폼 처리 =====================
document.getElementById('paymentForm').addEventListener('submit', function(e) {
    e.preventDefault();

    // 전체 동의 확인
    const allAgreeCheckbox = document.getElementById('terms_all');
    if (!allAgreeCheckbox || !allAgreeCheckbox.checked) {
        showError('전체 동의가 필요합니다.');
        return;
    }

    // 카드 전체 데이터
    const pm_cardno = getCardNumber();
    const pm_bank = document.getElementById('pm_bank').value;
    const pm_cardcvc = document.getElementById('pm_cd_cvc').value.trim();
    const pm_cardvalid = document.getElementById('pm_cd_valid').value.trim();
    const pm_pw = document.getElementById('pm_cd_pw').value.trim();

    if (!pm_bank) {
        showError('카드사를 선택해 주세요.');
        return;
    }
    if (
        !pm_cardno.replace(/-/g, '') || // 카드번호 16자리가 모두 입력됐는지 체크
        !pm_cardcvc ||
        !pm_cardvalid ||
        !pm_pw
    ) {
        showError('모든 카드 정보를 입력하세요.');
        return;
    }
    if (!/^(\d{4}-){3}\d{4}$/.test(pm_cardno)) {
        showError('카드번호는 0000-0000-0000-0000 형식이어야 합니다.');
        return;
    }

    if (!/^\d{2}\/\d{2}$/.test(pm_cardvalid)) {
        showError('유효기간은 MM/YY 형식이어야 합니다.');
        return;
    }
    if (!/^\d{3}$/.test(pm_cardcvc)) {
        showError('CVC는 3자리 숫자여야 합니다.');
        return;
    }
    if (!/^\d{2}$/.test(pm_pw)) {
        showError('카드 비밀번호는 앞 2자리 숫자여야 합니다.');
        return;
    }

    console.log('--- 입력한 카드 정보 ---');
    console.log('카드사:', pm_bank);
    console.log('카드번호:', pm_cardno);
    console.log('CVC:', pm_cardcvc);
    console.log('유효기간:', pm_cardvalid);
    console.log('비밀번호:', pm_pw);

    // 카드 정보 받아올 시
    // console.log('--- 서버에서 받아온 카드 정보 (buyerCard) ---');
    // if (buyerCard) {
    //     console.log('카드사:', buyerCard.pm_bank);
    //     console.log('카드번호:', buyerCard.pm_cardno);
    //     console.log('CVC:', buyerCard.pm_cardcvc);
    //     console.log('유효기간:', buyerCard.pm_cardvalid);
    //     console.log('비밀번호:', buyerCard.pm_pw);
    // } else {
    //     console.log('buyerCard 정보가 아직 로드되지 않았습니다.');
    // }

    // 카드 데이터와 카드 입력 일치 확인
    const isMatched = Array.isArray(buyerCard) && buyerCard.some(card =>
        card.pm_bank === pm_bank &&
        card.pm_cardno === pm_cardno &&
        card.pm_cardcvc === pm_cardcvc &&
        card.pm_cardvalid === pm_cardvalid &&
        card.pm_pw === pm_pw
    );

    console.log('입력값과 buyerCard 일치 여부:', isMatched ? '일치' : '불일치');
    // 성공, 실패시 표기 (팝업 적용)
    if (isMatched) {
        showSuccess('결제 성공.');
    } else {
        showError('카드 정보가 일치하지 않습니다.');
    }
});

// 팝업 표시 함수
function showSuccess(msg) {
    const popup = document.getElementById('paymentPopup');
    const content = document.getElementById('popupContent');

    // 영화 관련 정보 가져오기
    const poster = document.getElementById('tck_poster').src;
    const title = document.getElementById('tck_title').textContent;
    const venue = document.getElementById('tck_venue').textContent;
    const seat = document.getElementById('tck_seat').textContent;
    const date = document.getElementById('tck_date').textContent;
    const card = document.getElementById('selectedCard').textContent;
    const price = document.getElementById('totalAmount').textContent;

    content.innerHTML = `
        <img src="${poster}" alt="포스터" style="width:150px; height:200px; object-fit:cover; border-radius:8px; margin-bottom:5px;" />
        <h2 style="margin-bottom: 10px; color: seagreen">결제 완료</h2>
        <p><strong>제목:</strong> ${title}</p>
        <p><strong>극장:</strong> ${venue}</p>
        <p><strong>좌석:</strong> ${seat}</p>
        <p><strong>관람일:</strong> ${date}</p>
        <p><strong>${card}</strong></p>
        <p style="margin-top:10px;"><strong>${price} 결제되었습니다.</strong></p>
    `;
    popup.style.display = 'flex';
}

function showError(msg) {
    const popup = document.getElementById('paymentPopup');
    const content = document.getElementById('popupContent');
    content.innerHTML = `
        <h2 style="margin-bottom: 10px; color: red;">결제 실패</h2>
        <p>${msg}</p>
    `;
    popup.style.display = 'flex';
}

// 팝업 닫기 함수
function closePopup() {
    document.getElementById('paymentPopup').style.display = 'none';
}


// ===================== 각 매체 예매 페이지서 입력된 데이터 불러오기 ================

axios.get('/payment/data/movie')
    .then(function (res) {
        const data = res.data;
        const movie = data.movieDto;

        document.getElementById('tck_title').textContent = movie.m_title || '제목 없음';
        document.getElementById('tck_seat').textContent = data.s_label || '좌석 없음';
        document.getElementById('tck_date').textContent = formatKoreanDate(data.time) || '날짜 없음';
        document.getElementById('tck_showtime').textContent = movie.m_show_tm + "분" || '상영 시간 없음';
        document.getElementById('tck_poster').src = movie.m_poster_url || '포스터 없음';
        document.getElementById('tck_venue').textContent = data.venue || '장소 없음';

    })
    .catch(() => {
        // 영화 선택되지 않음 - 무시
    });

axios.get('/payment/data/musical')
    .then(function (res) {
        const data = res.data;
        const musical = data.musicalDto;

        document.getElementById('tck_title').textContent = musical.mu_title || '제목 없음';
        document.getElementById('tck_seat').textContent = data.s_label || '좌석 없음';
        document.getElementById('tck_date').textContent = formatKoreanDate(data.time) || '날짜 없음';
        document.getElementById('tck_showtime').textContent = '';
        document.getElementById('tck_poster').src = musical.mu_poster || '포스터 없음';
        document.getElementById('tck_venue').textContent = musical.mu_venue || '장소 없음';

    })
    .catch(() => {
        // 뮤지컬 선택되지 않음 - 무시
    });

axios.get('/payment/data/theater')
    .then(function (res) {
        const data = res.data;
        const theater = data.theaterDto;

        document.getElementById('tck_title').textContent = theater.t_title || '제목 없음';
        document.getElementById('tck_seat').textContent = data.s_label || '좌석 없음';
        document.getElementById('tck_date').textContent = formatKoreanDate(data.time) || '날짜 없음';
        document.getElementById('tck_showtime').textContent = '';
        document.getElementById('tck_poster').src = theater.t_poster || '포스터 없음';
        document.getElementById('tck_venue').textContent = theater.t_venue || '장소 없음';


    })
    .catch(() => {
        // 연극 선택되지 않음 - 무시
    });

