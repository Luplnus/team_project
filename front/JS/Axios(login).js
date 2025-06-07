/***
 * Axios(login).js
 * 로그인 처리
 ***/
document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const btn = document.getElementById('loginBtn');
    btn.classList.add('loading');
    btn.textContent = '';

    axios.post('http://http://3.36.29.175:5002/api/login', {
        u_id: document.getElementById('username').value,
        u_pw: document.getElementById('password').value
    })
    .then(res => {
        localStorage.setItem('loggedInUser', res.data.u_id);
        localStorage.setItem('u_id', res.data.u_id);
        localStorage.setItem('u_name', res.data.u_name);

        const redirectUrl = localStorage.getItem('toUrl');
        if (redirectUrl) {
            localStorage.removeItem('toUrl');
            window.location.href = redirectUrl;
        } else {
            window.location.href = 'Main_page.html';
        }
    })
    .catch(err => {
        btn.classList.remove('loading');
        btn.textContent = '로그인';
        customAlert(err.response?.data?.message || '로그인 실패');
    });
});
