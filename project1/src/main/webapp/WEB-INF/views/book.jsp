<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <title>book</title>
    <style>
        .blue{
            color: blue;
        }
        .flex{
            display: flex;
        }
    </style>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<header>
    <div id="wrap">
        <ul class="flex">
            <li><button>영화</button></li>
            <li><button>뮤지컬</button></li>
            <li><button>연극</button></li>
        </ul>

        <div>
            선택된 뮤지컬 id : ${musicalDto.mu_id}, ${musicalDto.mu_title};
        </div>
        <button class="book_btn"> 예매 </button>
        <ul>
            <c:forEach var="musical_list" items="${musicalList}" varStatus="status">
<%--                <li>${status.index + 1}</li>--%>
            <li id="${musical_list.mu_id}">${musical_list.mu_title}</li>
            </c:forEach>
        </ul>
    </div>
 </header>

<script>
    const mu_id = "${musicalDto.mu_id}";
    const s_id = 1;
    $('#${musicalDto.mu_id}').addClass('blue');
    $('.book_btn').on('click', function (){

        $.ajax({
            type:'POST',
            url: '/app/book/musical',
            headers : { "content-type": "application/json" },
            // b_user_seqno는 세션으로 받고, mu_id, s_id 입력받고
            data : JSON.stringify({mu_id: mu_id, s_id: s_id}),
            success : function(result) {
                if (result == "BOOK_FAIL") {
                    alert("예매 실패");
                    location.replace("/app/book");
                } else if (result == "BOOK_OK") {
                    alert("예매 성공");
                    location.replace("/app");
                }
            },
            error   : function(){ alert("error") }
            });
        })

</script>
</body>
</html>