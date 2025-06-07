<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>마이페이지</title>
</head>
<body>
<h1>마이페이지</h1>

<p>
    <b>아이디:</b> ${userDto.u_id}
</p>
<p>
    <b>이름:</b> ${userDto.u_name}
</p>
<p>
    <b>이메일:</b> ${userDto.u_email}
</p>
<p>
    <b>주소:</b> ${userDto.u_address}
</p>
<p>
    <b>전화번호:</b> ${userDto.u_cellnum}
</p>

<h3>회원 정보 수정</h3>
<form action="<c:url value="/myPage/modify" />" method="post">
    <label>
        이름: <input type="text" name="u_name" value="${userDto.u_name}" />
    </label><br/>
    <label>
        주소: <input type="text" name="u_address" value="${userDto.u_address}" />
    </label><br/>
    <label>
        전화번호: <input type="tel" name="u_cellnum" value="${userDto.u_cellnum}" />
    </label><br/>
    <button type="submit">수정하기</button>
</form>

<h3>회원 탈퇴</h3>
<form action="<c:url value="/myPage/remove" />" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
    <button type="submit">탈퇴하기</button>
</form>

<p>
    <a href="<c:url value="/"/>">메인페이지</a>
</p>

</body>
</html>