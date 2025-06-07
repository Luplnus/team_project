    let isClosing = false;
        function goToSignup() {
            const loginForm = document.getElementById('loginForm');
            const signupForm = document.getElementById('signupForm');
            
            loginForm.classList.add('hidden');
            signupForm.classList.remove('hidden');
        }

        function goToLogin() {
            const loginForm = document.getElementById('loginForm');
            const signupForm = document.getElementById('signupForm');
            
            signupForm.classList.add('hidden');
            loginForm.classList.remove('hidden');
        }
        // 팝업 닫기 
        function closeLogin() {
            if (isClosing) return;
            isClosing = true;
            
            const backdrop = document.getElementById('backdrop');
            
            if (activePanel) {
                activePanel.classList.add('closing');
            }
            
            backdrop.style.animation = 'fadeOut 0.3s ease-out forwards';
            
            setTimeout(() => {
                console.log('팝업이 닫혔습니다');

            }, 300);
        }

        // 이벤트
        document.addEventListener('DOMContentLoaded', function() {
          
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    closeLogin();
                }
            });
            document.querySelector('.login').addEventListener('click', function(e) {
                e.stopPropagation();
            });

            document.querySelector('.member_shp').addEventListener('click', function(e) {
                e.stopPropagation();
            });

            // 로그인 
            document.getElementById('loginForm').addEventListener('submit', function(e) {
                e.preventDefault();
                const loginBtn = document.getElementById('loginBtn');
                loginBtn.classList.add('loading');
                loginBtn.textContent = '';
                setTimeout(() => {
                    loginBtn.classList.remove('loading');
                    loginBtn.textContent = '로그인';
                    console.log('로그인 처리 완료');
                }, 2000);
            });

            // 회원가입 
            document.getElementById('signupForm').addEventListener('submit', function(e) {
                e.preventDefault();
                const signupBtn = document.getElementById('signupBtn');

                signupBtn.classList.add('loading');
                signupBtn.textContent = '';

                setTimeout(() => {
                    signupBtn.classList.remove('loading');
                    signupBtn.textContent = '회원가입';
                    console.log('회원가입 처리 완료');
                }, 2000);
            });

            // 전체 동의 체크박스
            document.getElementById('terms_all').addEventListener('change', function() {
                const checkboxes = ['terms_service', 'terms_privacy', 'terms_marketing'];
                checkboxes.forEach(id => {
                    document.getElementById(id).checked = this.checked;
                });
            });

            // 개별 동의 체크박스
            const individualCheckboxes = ['terms_service', 'terms_privacy', 'terms_marketing'];
            individualCheckboxes.forEach(id => {
                document.getElementById(id).addEventListener('change', function() {
                    const allChecked = individualCheckboxes.every(checkId => 
                        document.getElementById(checkId).checked
                    );
                    document.getElementById('terms_all').checked = allChecked;
                });
            });
            // 입력
            const inputs = document.querySelectorAll('.login_panel, .password_panel');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    const label = this.parentElement.querySelector('.login_ttl, .password_ttl');
                    if (label) {
                        label.style.color = 'rgb(229, 9, 20)';
                    }
                });
                
                input.addEventListener('blur', function() {
                    const label = this.parentElement.querySelector('.login_ttl, .password_ttl');
                    if (label) {
                        label.style.color = '#fff';
                    }
                });
            });
        });