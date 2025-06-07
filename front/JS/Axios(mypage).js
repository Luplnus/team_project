/***
 * Axios(mypage).js
 * 마이페이지 사용자 정보 조회 및 수정
 ***/
document.addEventListener('DOMContentLoaded', () => {
    const uId = localStorage.getItem('u_id');
    if (!uId) {
        customAlert('로그인이 필요합니다.');
        window.location.href = '/Loginpage.html';
        return;
    }

    // 사용자 정보 조회 및 표시
    axios.get(`http://http://3.36.29.175:5002/api/user/${uId}`)
        .then(res => {
            const user = res.data;
            document.getElementById('profile_u_name').textContent   = user.u_name;
            document.getElementById('userName').textContent        = user.u_name;
            document.getElementById('userID').textContent          = user.u_id;
            document.getElementById('userEmail').textContent       = user.u_email;
            document.getElementById('userAddress').textContent     = user.u_address;
            document.getElementById('userCellnum').textContent     = user.u_cellnum;
            // 입력 필드 초기값 설정
            document.getElementById('userNameInput').value         = user.u_name;
            document.getElementById('userEmailInput').value        = user.u_email;
            document.getElementById('userAddressInput').value      = user.u_address;
            document.getElementById('userCellnumInput').value      = user.u_cellnum;
        })
        .catch(err => {
            console.error('사용자 정보 조회 실패:', err);
            customAlert('로그인 정보가 유효하지 않습니다.');
            localStorage.clear();
            window.location.href = '/Loginpage.html';
        });

    // 수정 모드 토글
    const editBtn = document.getElementById('editBtn');
    const saveBtn = document.getElementById('saveBtn');
    editBtn.addEventListener('click', () => {
        ['Email','Name','Address','Cellnum'].forEach(field => {
            document.getElementById(`user${field}`).style.display       = 'none';
            document.getElementById(`user${field}Input`).style.display  = 'block';
        });
        editBtn.style.display = 'none';
        saveBtn.style.display = 'inline-block';
    });

    // 정보 저장
    saveBtn.addEventListener('click', () => {
        const newData = {
            u_email  : document.getElementById('userEmailInput').value.trim(),
            u_name   : document.getElementById('userNameInput').value.trim(),
            u_address: document.getElementById('userAddressInput').value.trim(),
            u_cellnum: document.getElementById('userCellnumInput').value.trim()
        };
        if (Object.values(newData).some(v => !v)) {
            customAlert('모든 필드를 입력해주세요.');
            return;
        }

        axios.post(`http://http://3.36.29.175:5002/api/user/modify/${uId}`, newData)
            .then(() => {
                customAlert('정보가 수정되었습니다.');
                ['Email','Name','Address','Cellnum'].forEach(field => {
                    document.getElementById(`user${field}`).textContent      = newData[`u_${field.toLowerCase()}`];
                    document.getElementById(`user${field}`).style.display    = 'block';
                    document.getElementById(`user${field}Input`).style.display = 'none';
                });
                editBtn.style.display = 'inline-block';
                saveBtn.style.display = 'none';
            })
            .catch(err => {
                console.error('수정 중 오류 발생:', err);
                customAlert('수정 중 오류가 발생했습니다.');
            });
    });

    // 회원 탈퇴
    document.getElementById('deleteBtn').addEventListener('click', () => {
        if (!confirm('정말 탈퇴하시겠습니까?')) return;
        axios.post(`http://http://3.36.29.175:5002/api/user/remove/${uId}`)
            .then(() => {
                customAlert('탈퇴되었습니다.');
                localStorage.clear();
                window.location.href = '/Main_page.html';
            })
            .catch(err => {
                console.error('탈퇴 실패:', err);
                customAlert('탈퇴 중 오류가 발생했습니다.');
            });
    });
});
