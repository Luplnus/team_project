/***
 * Axios(register).js
 * 회원가입 처리
 ***/
document.getElementById('signupForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const btn = document.getElementById('signupBtn');
    btn.classList.add('loading');
    btn.textContent = '';

    const password    = document.getElementById('signupPassword').value;
    const confirmPass = document.getElementById('confirmPassword').value;
    if (password !== confirmPass) {
        customAlert('비밀번호가 일치하지 않습니다.');
        btn.classList.remove('loading');
        btn.textContent = '회원가입';
        return;
    }

    axios.post('http://http://3.36.29.175:5002/api/register', {
        u_id      : document.getElementById('signupUsername').value,
        u_pw      : password,
        u_name    : document.getElementById('displayName').value,
        u_cellnum : document.getElementById('phoneNumber').value,
        u_address : document.getElementById('userAddress').value,
        u_email   : document.getElementById('userEmail').value
    })
    .then(() => {
        customAlert('회원가입 완료! 로그인 페이지로 이동합니다.');
        goToLogin();
    })
    .catch(err => {
        btn.classList.remove('loading');
        btn.textContent = '회원가입';
        customAlert(err.response?.data?.message || '회원가입 실패');
    });
});
