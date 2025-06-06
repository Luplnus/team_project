<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<c:set var="logInTxt" value="${ sessionScope.u_id==null?'done':'notDone'}" />
<c:set var="logInOutTxt" value="${ sessionScope.u_id==null?'logIn':'logOut'}" />
<c:set var="logInOutLink" value="${ sessionScope.u_id==null?'/logIn':'/logOut'}" />
<%--<html>--%>
<%--<head>--%>
<%--  <title>로그인</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>로그인</h1>--%>

<%--<form action="<c:url value="/logIn" />" method="post">--%>
<%--  <c:if test="${not empty param.msg}">--%>
<%--    <p style="color: red;">${URLDecoder.decode(param.msg)}</p>--%>
<%--  </c:if>--%>

<%--  <label for="u_id">아이디:</label>--%>
<%--  <input type="text" name="u_id" id="u_id" required><br><br>--%>

<%--  <label for="u_pw">비밀번호:</label>--%>
<%--  <input type="password" name="u_pw" id="u_pw" required><br><br>--%>

<%--  <label>--%>
<%--    <input type="checkbox" name="u_rId" ${empty cookie.id.value?"":"checked" }>아이디 기억하기--%>
<%--  </label><br><br>--%>

<%--  <button type="submit">로그인</button>--%>
<%--</form>--%>

<%--<p>회원이 아니신가요? <a href="<c:url value='/register'/>">회원가입</a></p>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>

    body {
      margin: 0;
    }

    .login {
      border: 1px solid;
      border-radius: 5px;
      max-width: 400px;
      padding: 20px 35px;

    }

    h2 {
      margin: 0;
      padding: 0;
      font-size: 25px;
      text-align: center;
    }

    .close_box {
      width: 100%;
      display: flex;
      justify-content: flex-end;
    }

    .close_button {
      width: 30px;
      height: 30px;
    }

    .login_box, .password_box {
      margin-top: 20px;
    }

    .login_panel, .password_panel {
      width: 100%;
      height: 50px;
      border: 1px solid;
      border-radius: 5px;
      box-sizing: border-box;
      padding: 0.375rem 1rem;
      font-size: 1rem;
      margin-top: 8px;
    }

    .login_ttl, .password_ttl {
      font-size: 20px;
    }

    .login_put {
      width: 100%;
      height: 50px;
      margin-top: 20px;
      font-size: 1rem;
      font-weight: 500;
      color: #fff;
      background: rgb(229, 9, 20);
      border: 1px solid rgb(229, 9, 20);
      border-radius: 5px;
    }

    .login_put:hover {
      background-color: rgb(192, 0, 10);
      color: rgb(255, 255, 255);;
      transition-duration: 250ms;
      transition-property: background-color, border-color;
      transition-timing-function: cubic-bezier(0.4, 0, 0.68, 0.06);
    }

    .mb_put {
      width: 100%;
      height: 40px;
      border: 1px solid;
      border-radius: 5px;
      font-size: 1rem;
      font-weight: 500;
      margin-top: 15px;
      color: #fff;
      background: rgb(87, 87, 87);
      border: 1px solid rgb(87, 87, 87);
    }

    .mb_put:hover {
      background-color: rgb(37, 37, 37);
      color: rgb(255, 255, 255);;
      transition-duration: 250ms;
      transition-property: background-color, border-color;
      transition-timing-function: cubic-bezier(0.4, 0, 0.68, 0.06);
    }

    .chk_btn {
      display: flex;
      align-items: center;
    }

    .chk_box {
      width: 20px;
      height: 25px;
      border: 1px solid;
      margin-right: 5px;
    }

  </style>
</head>
<body>
<form action="<c:url value="/logIn"/>" method="post">

  <div class="login">
    <div class="close_box">
      <div class="close_button">
        <img src="<c:url value="./pt_img/x-circle.svg"/>" alt="">
      </div>
    </div>

    <div class="login_header">
      <h2>JPIEL</h2>
    </div>

    <c:if test="${not empty param.msg}">
      <p style="color: red;">${URLDecoder.decode(param.msg)}</p>
    </c:if>

    <div class="login_box">
      <div class="login_ttl">로그인</div>
      <label>
        <input type="text" class="login_panel" name="u_id" placeholder="아이디" required>
      </label>
    </div>

    <div class="password_box">
      <label>
        <input type="password" class="password_panel" name="u_pw" placeholder="비밀번호" required>
      </label>
    </div>

    <div class="chk_btn">
      <label>
        <input type="checkbox" id="checkbox" class="chk_box" name="u_rId" ${empty cookie.id.value?"":"checked" }>아이디 기억하기
      </label>
    </div>

    <button type="submit" class="login_put">로그인</button>

    <button class="mb_put">
      <a href="<c:url value="/register" />" style="color: inherit; text-decoration: none">회원가입</a>
    </button>
  </div>
</form>
</body>
</html>
