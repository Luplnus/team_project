<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>

<form action="<c:url value="/postRegister" />" method="post">
    <c:if test="${not empty param.msg}">
        <p style="color: red;">${URLDecoder.decode(param.msg)}</p>
    </c:if>

    <label for="u_id">아이디:</label>
    <input type="text" name="u_id" id="u_id" required><br><br>

    <label for="u_pw">비밀번호:</label>
    <input type="password" name="u_pw" id="u_pw" required><br><br>

    <label for="u_name">이름:</label>
    <input type="text" name="u_name" id="u_name" required><br><br>

    <label for="u_email">이메일:</label>
    <input type="email" name="u_email" id="u_email" required><br><br>

    <label for="u_address">주소:</label>
    <input type="text" name="u_address" id="u_address" required><br><br>

    <label for="u_cellnum">전화번호:</label>
    <input type="tel" name="u_cellnum" id="u_cellnum" required><br><br>

    <button type="submit">가입하기</button>
</form>
</body>
</html>

