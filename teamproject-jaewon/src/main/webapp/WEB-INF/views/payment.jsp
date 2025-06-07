<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<c:set var="logInTxt" value="${ sessionScope.u_id==null?'notDone':'done'}" />
<c:set var="logInOutTxt" value="${ sessionScope.u_id==null?'logIn':'logOut'}" />
<c:set var="logInOutLink" value="${ sessionScope.u_id==null?'/logIn':'/logOut'}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>

        body {
            margin: 0;
            background-color: #292929;
        }

        h2 {
            color: #fff;
        }

        .main_menu {
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
            position: relative;
            z-index: 20;
            background-color: rgba(0, 0, 0, 0.8);
        }

        .h_menubox {
            max-width: 1285px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-sizing: border-box;
            padding: 0 10px;
        }

        .main_logo h2 {
            margin: 0;
            width: 70px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            color: #fff;
            box-sizing: border-box;
            font-weight: bold;
        }

        .menu_bar {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            box-sizing: border-box;
            justify-content: flex-end;
            flex: 1;
        }

        .text_p {
            font-size: 24px;
            color: #ffffff;
            margin: 30px 0 20px 0;
            font-weight: bold;
            padding-left: 15px;
        }

        .tck_p {
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            margin-top: 40px;
        }

        .menu_box {
            width: 80px;
            height: 35px;
            margin: 0 15px;
            text-align: center;
            line-height: 35px;
            color: #fff;
            box-sizing: border-box;
            cursor: pointer;
            transition: color 0.3s;
            font-size: 15px;
        }


        .menu_box:hover {
            color: #E50914;
        }

        .content {
            width: 100px;
            height: 30px;
            display: flex;
            justify-content: space-around;
        }

        .content_box {
            width: 30px;
            line-height: 35px;
            text-align: center;
            color: #fff;
        }

        .content_box a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

        .pay_box {
            width: 100%;
            margin-top: 15px;
            min-height: 1580px;
        }

        .pay_tool {
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
            background: rgb(16 16 16 / 95%);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }

        .line {
            height: 2px;
            background: linear-gradient(90deg, transparent, #E50914, transparent);
            margin: 30px 0;
            border-radius: 1px;
        }

        .ticket_info {
            display: flex;
            justify-content: space-around;
            gap: 40px;
            margin: 30px 0;
            background: #242424;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid rgb(85, 18, 18) ;
        }

        .post_banner, .bn_img {
            border: 1px solid rgba(255, 255, 255, 0.1);
            width: 260px;
            height: 340px;
            object-fit: cover;
            border-radius: 10px;
            background: #141414;
        }

        .tck_text {
            border: 1px solid rgba(255, 255, 255, 0.1);
            width: 700px;
            border-radius: 10px;
            padding: 20px;
            background: linear-gradient(145deg, #2a2a2a 0%, #1f1f1f 100%);
            border-radius: 15px;
        }

        .card_text, .pay_text {
            margin-left: 20px;
            color: #fff;
            font-size: 16px;
            font-weight: 500;
        }

        .card_info {
            width: 100%;
            max-width: 1165px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: repeat(2, 1fr);
            gap: 30px;
            padding: 20px;
            box-sizing: border-box;
        }

        .card_nm {
            height: 60px;
            background: linear-gradient(145deg, #2a2a2a 0%, #1f1f1f 100%);
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .card_nm:hover {
            background: linear-gradient(145deg, #E50914 0%, #c20812 100%);
            border-color: #E50914;
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(229, 9, 20, 0.3);
        }

        .card_nm.selected {
            background: linear-gradient(145deg, #E50914 0%, #c20812 100%);
            border-color: #E50914;
            box-shadow: 0 5px 15px rgba(229, 9, 20, 0.3);
        }

        .chose_card, .pay_history {
            width: 100%;
            max-width: 450px;
            height: 60px;
            border: 2px solid #686868;
            margin: 0 auto;
            margin-bottom: 20px;
            border-radius: 12px;
            color: #fff;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            background: linear-gradient(145deg, #2a2a2a, #1f1f1f);
        }

        .payment_tool {
            display: flex;
            align-items: flex-start;
            justify-content: space-evenly;
            gap: 40px;
            margin-top: 30px;
        }

        .payment_box, .payment_box2 {
            flex: 1;
            border: 1px solid #494949;
            border-radius: 15px;
            padding: 30px;
            background: linear-gradient(145deg, #2a2a2a 0%, #1f1f1f 100%);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .payment_box {
            max-width: 500px;
        }

        .payment_box2 {
            max-width: 500px;
        }

        .card_input_section {
            margin-bottom: 25px;
        }

        .input_label {
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
        }

        .cd_pwbox {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 20px;
        }

        .cd_pw {
            width: 70px;
            height: 45px;
            border: 2px solid #494949;
            border-radius: 8px;
            background-color: #181818;
            text-align: center;
            font-weight: bold;
            color: #fff;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .cd_pw:focus {
            outline: none;
            border-color: #E50914;
            box-shadow: 0 0 10px rgba(229, 9, 20, 0.3);
        }

        .cd_pw::placeholder {
            color: #666;
        }

        .next_p {
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            margin: 0 5px;
        }

        .agree_text {
            color: #fff;
            font-size: 14px;
            margin-left: 8px;
        }

        .agree_tool {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 0 15px;
        }

        .terms_checkbox {
            width: 18px;
            height: 18px;
            cursor: pointer;
            transition: transform 0.2s ease;
            accent-color: #E50914;
        }

        .terms_checkbox:hover {
            transform: scale(1.1);
        }

        .chk_boxtol {
            background-color: #181818;
            border: 1px solid rgb(85, 18, 18);
            border-radius: 12px;
            padding: 20px;
            margin-top: 20px;
        }

        .btn_set {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 30px;
        }

        .buy_btn, .no_buy {
            flex: 1;
            height: 50px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .buy_btn {
            background: linear-gradient(135deg, #E50914, #c20812);
            color: #fff;
            border: none;
        }

        .buy_btn:hover {
            background: linear-gradient(135deg, #c20812, #a1060f);
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(229, 9, 20, 0.3);
        }

        .no_buy {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .no_buy:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.4);
        }

        .all_chk {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px;
            background: rgba(229, 9, 20, 0.1);
            border-radius: 8px;
            border: 1px solid rgba(229, 9, 20, 0.3);
        }

        .all_chk .agree_text {
            font-weight: 600;
            color: #E50914;
        }

        .payment_section_title {
            color: #fff;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
        }

        .fot_end {
            margin-top: 40px;
            width: 100%;
            height: 400px;
            background-color: #000;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .footer_content {
            width: 80%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .footer_logo {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .footer_box {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .footer_box a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
        }

        .footer_end {
            text-align: center;
            font-size: 14px;
            opacity: 0.7;
        }


    </style>
</head>
<body>

<header>
    <div id="wrap">
        <div class="main_menu">
            <div class="h_menubox">
                <div class="main_logo">
                    <h2>JPIEL</h2>
                </div>
                <div class="menu_bar">
                    <div class="menu_box">영화</div>
                    <div class="menu_box">뮤지컬</div>
                    <div class="menu_box">연극</div>
                    <div class="menu_box">예매</div>
                </div>
                <div class="content">
                    <div class="content_box">
                        <a href="#">
                            <img src="./pt_img/search.svg" alt="">
                        </a>
                    </div>
                    <div class="content_box">
                        <a href="#">
                            <img src="./pt_img/user.svg" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<form action="#">

    <div class="pay_box">
        <div class="pay_tool">
            <h2 style="text-align: center;">결제하기</h2>

            <div class="line"></div>

            <p class="text_p">예매정보</p>

            <div class="ticket_info">
                <div class="post_banner">
                    <img src="./pt_img/heroclass.webp" alt="관련 포스터" class="bn_img">
                </div>

                <div class="tck_text">
                    <h2 id="tck_title">관련 제목</h2>
                    <p class="tck_p" id="tck_seat">좌석</p>
                    <p class="tck_p" id="tck_count">인원수</p>
                    <p class="tck_p" id="tck_date">관람일시</p>
                </div>
            </div>

            <p class="text_p">카드결제</p>

            <div class="card_info">
                <div class="card_nm">국민</div>
                <div class="card_nm">농협</div>
                <div class="card_nm">신한</div>
                <div class="card_nm">우리</div>
                <div class="card_nm">하나</div>
                <div class="card_nm">삼성</div>
                <div class="card_nm">현대</div>
                <div class="card_nm">롯데</div>
            </div>

            <div class="line"></div>

            <p class="text_p">결제수단</p>

            <div class="payment_tool">

                <div class="payment_box">
                    <div class="payment_section_title">카드 정보 입력</div>

                    <div class="card_input_section">
                        <label class="input_label">카드번호</label>
                        <div class="cd_pwbox">
                            <input type="text" class="cd_pw" maxlength="4" placeholder="0000">
                            <span class="next_p">-</span>
                            <input type="text" class="cd_pw" maxlength="4" placeholder="0000">
                            <span class="next_p">-</span>
                            <input type="text" class="cd_pw" maxlength="4" placeholder="0000">
                            <span class="next_p">-</span>
                            <input type="text" class="cd_pw" maxlength="4" placeholder="0000">
                        </div>
                    </div>

                    <div class="card_input_section">
                        <label class="input_label">유효기간&nbsp;&nbsp;/&nbsp;&nbsp;CVC</label>
                        <div class="cd_pwbox">
                            <input type="text" class="cd_pw" maxlength="2" placeholder="MM">
                            <span class="next_p">/</span>
                            <input type="text" class="cd_pw" maxlength="2" placeholder="YY">
                            <span style="margin: 0 -5px;"></span>
                            <span class="next_p">,</span>
                            <input type="text" class="cd_pw" maxlength="3" placeholder="CVC">
                        </div>
                    </div>

                    <div class="card_input_section">
                        <label class="input_label">카드 비밀번호 앞 2자리</label>
                        <div class="cd_pwbox">
                            <input type="password" class="cd_pw" maxlength="1" placeholder="*">
                            <input type="password" class="cd_pw" maxlength="1" placeholder="*">
                            <span class="next_p">* *</span>
                        </div>
                    </div>
                </div>

                <div class="payment_box2">
                    <div class="payment_section_title">결제 확인</div>

                    <div class="chose_card">
                        <div class="card_text">선택하신 카드사</div>
                    </div>

                    <div class="pay_history">
                        <div class="pay_text">결제금액</div>
                    </div>

                    <div class="chk_boxtol">
                        <div class="all_chk">
                            <input type="checkbox" id="terms_all" class="terms_checkbox">
                            <label for="terms_all" class="agree_text">전체 동의</label>
                        </div>

                        <div class="agree_tool">
                            <label class="agree_text">개인정보 수집 및 이용에 대한 동의</label>
                            <input type="checkbox" id="terms_privacy" class="terms_checkbox">
                        </div>
                        <div class="agree_tool">
                            <label class="agree_text">개인정보 제 3자 제공 동의</label>
                            <input type="checkbox" id="terms_third_party" class="terms_checkbox">
                        </div>
                        <div class="agree_tool">
                            <label class="agree_text">개인정보 처리 위탁 동의</label>
                            <input type="checkbox" id="terms_processing" class="terms_checkbox">
                        </div>
                    </div>

                    <div class="btn_set">
                        <button type="submit" class="buy_btn" id="payButton">결제하기</button>
                        <button type="button" class="no_buy" onclick="cancelPayment()">결제취소</button>
                    </div>
                </div>
            </div>

        </div>
    </div>

</form>

<footer>
    <div class="fot_end">
        <div class="footer_content">
            <div class="footer_logo">JPIEL</div>
            <div class="footer_box">
                <a href="#">회사소개</a>
                <a href="#">서비스이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">고객센터</a>
                <a href="#">광고문의</a>
            </div>
            <div class="footer_end">
                <span>JPIEL STUDIO</span>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    // 해당 칸 입력이 끝나면 다음칸으로이동
    document.querySelectorAll('.cd_pwbox').forEach(group => {
        const inputs = group.   querySelectorAll('input.cd_pw');

        inputs.forEach((input, idx) => {
            input.addEventListener('input', () => {
                if (input.value.length === input.maxLength) {
                    if (idx + 1 < inputs.length) {
                        inputs[idx + 1].focus();
                    }
                }
            });
        });
    });


    // 카드결제에서 카드 선택하면 결제확인에서 국민(카드) <- 이런식으로 국민카드 출력해줌
    const cardButtons = document.querySelectorAll('.card_nm');
    const chosenCardText = document.querySelector('.chose_card .card_text');

    cardButtons.forEach(button => {
        button.addEventListener('click', () => {
            cardButtons.forEach(btn => btn.classList.remove('selected'));
            button.classList.add('selected');
            const cardName = button.textContent.trim();
            chosenCardText.textContent = `${cardName}카드`;
        });
    });

    const checkAll = document.getElementById('terms_all');
    const individuals = document.querySelectorAll('#terms_privacy, #terms_third_party, #terms_processing');
    const payButton = document.getElementById('payButton');

    // 전체 동의 체크/해제 시 개별 모두 체크/해제
    checkAll.addEventListener('change', function() {
        const isChecked = this.checked;

        individuals.forEach(checkbox => {
            checkbox.checked = isChecked;
        });
    });

    // 개별 체크박스 상태 변경 시 전체 동의 상태 조정
    individuals.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            updateAllCheckStatus();
        });
    });

    function updateAllCheckStatus() {
        const totalCheckboxes = individuals.length;
        const checkedCheckboxes = Array.from(individuals).filter(chk => chk.checked).length;
        // 모든 개별 체크박스가 체크되어 있으면 전체 동의도 체크
        // 하나라도 체크되어 있지 않으면 전체 동의 체크 해제
        checkAll.checked = (totalCheckboxes === checkedCheckboxes);
    }
    // 결제 버튼 클릭 시 모든 체크 여부 확인
    payButton.addEventListener('click', function () {
        if ([...individuals].every(chk => chk.checked)) {
            alert('"결제되었습니다."?"결제 정보 일치하지 않음"');
            // 결제 페이지 이동 코드 삽입, 예: window.location.href = '/payment/complete'
        } else {
            alert('모든 항목에 동의해야 결제할 수 있습니다.');
        }
    });

</script>

</body>
</html>