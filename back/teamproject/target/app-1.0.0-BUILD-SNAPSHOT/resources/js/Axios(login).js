document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const loginBtn = document.getElementById('loginBtn');
    loginBtn.classList.add('loading');
    loginBtn.textContent = '';

    const data = {
        username: document.getElementById('username').value,
        password: document.getElementById('password').value
    };

    axios.post('http://54.180.234.163:5000/api/login', data)
        .then(res => {
            // 로그인 성공 시 리다이렉트 혹은 페이지 갱신
            window.location.href = '/dashboard';
        })
        .catch(err => {
            loginBtn.classList.remove('loading');
            loginBtn.textContent = '로그인';
            // 에러 표시
            alert(err.response.data.message || '로그인 실패');
        });
});