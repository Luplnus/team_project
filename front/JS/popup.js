/***
 * popup.js
 * 커스텀 팝업 알림 기능
 ***/
window.customAlert = message => {
    document.querySelector('.popup_text').innerText       = message;
    document.querySelector('.popup_container').style.display = 'block';
};

document.querySelector('.chk_btn_box').addEventListener('click', () => {
    document.querySelector('.popup_container').style.display = 'none';
    window.location.reload();
});
