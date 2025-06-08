document.getElementById('signupForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const signupBtn = document.getElementById('signupBtn');
    signupBtn.classList.add('loading');
    signupBtn.textContent = '';

    const data = {
        username: document.getElementById('signupUsername').value,
        password: document.getElementById('signupPassword').value,
        confirmPassword: document.getElementById('confirmPassword').value,
        displayName: document.getElementById('displayName').value,
        userAddress: document.getElementById('userAddress').value,
        userEmail: document.getElementById('userEmail').value
    };

    axios.post('http://54.180.234.163:5000/api/signup', data)
        .then(res => {
            alert('회원가입 완료! 로그인 페이지로 이동합니다.');
            goToLogin();
        })
        .catch(err => {
            signupBtn.classList.remove('loading');
            signupBtn.textContent = '회원가입';
            alert(err.response.data.message || '회원가입 실패');
        });
});