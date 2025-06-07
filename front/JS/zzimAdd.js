const uId = localStorage.getItem('loggedInUser');
let currentTheaterId = null;
const wishBtn = $('#wishAdd');

function setWishState(isLiked) {
    if (isLiked) wishBtn.addClass('liked').text('찜취소');
    else         wishBtn.removeClass('liked').text('찜하기');
}

wishBtn.on('click', () => {
    if (!uId) {
        customAlert('로그인 후 이용해주세요.');
        return location.href = 'Loginpage.html';
    }
    if (!currentTheaterId) return customAlert('연극을 먼저 선택해주세요.');

    const action = wishBtn.hasClass('liked') ? 'remove' : 'add';
    axios.post(
        `http://http://3.36.29.175:5002/api/user/${uId}/wishlist/${action}`,
        { w_contentType: 'theater', w_id: String(currentTheaterId) },
        { headers: { 'Content-Type': 'application/json' } }
    )
    .then(() => setWishState(action === 'add'))
    .catch(err => { console.error(err); customAlert(`${action === 'add' ? '찜 추가에' : '찜 취소에'} 실패했습니다.`); });
});

// 초기 찜 상태 조회
axios.get(`http://http://3.36.29.175:5002/api/user/${uId}/wishlist`)
    .then(res => setWishState(
        res.data.some(w => w.w_contentType === 'theater' && String(w.w_id) === String(currentTheaterId))
    ));
