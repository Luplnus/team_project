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
        ul{
            list-style: none;
            padding: 0;
            margin: 0;
        }
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
            <li><button class="musical_btn">뮤지컬</button></li>
            <li><button class="theater_btn">연극</button></li>
            <li><button class="venue_btn">극장 선택</button></li>
        </ul>
        <div class="book_content">

        </div>
    </div>
 </header>

<script>
    $(document).ready(function(){
        let tmp = "";
        $('.musical_btn').on('click', function (){
            $('.book_content').html(
                `<div>
                    선택된 뮤지컬 id : ${musicalDto.mu_id}, ${musicalDto.mu_title}
                </div>
                <button class="book_btn"> 예매 </button>
                <ul>
                    <c:forEach var="musical_list" items="${musicalList}">
                        <li id="${musical_list.mu_id}">${musical_list.mu_title}</li>
                    </c:forEach>
                </ul>`);
            tmp = "musical";
        })
        $('.musical_btn').trigger('click'); // 그냥 들어왔을때 기본으로 musical 띄워줌

        $('.theater_btn').on('click', function(){
            $('.book_content').html(
                `<div>
                    선택된 연극 id : ${theaterDto.t_id}, ${theaterDto.t_title}
                </div>
                <button class="book_btn"> 예매 </button>
                <ul>
                    <c:forEach var="theater_list" items="${theaterList}">
                        <li id="${theater_list.t_id}">${theater_list.t_title}</li>
                    </c:forEach>
                </ul>`);
            tmp = "theater";
        })

        const mu_id = "${musicalDto.mu_id}";
        const t_id = "${theaterDto.t_id}";
        const s_label = "A10"
        const vm_name = ""
        const b_musical_time = "2025-05-30 14:25:00";
        $('#${musicalDto.mu_id}').addClass('blue');
        $('#${theaterDto.t_id}').addClass('blue');

        $('.book_btn').on('click', function (){
            if(tmp == "musical"){
                $.ajax({
                    type:'POST',
                    url: '/app/book/musical',
                    headers : { "content-type": "application/json" },
                    // b_user_seqno는 세션으로 받고, mu_id, b_musical_time 입력받고
                    data : JSON.stringify({mu_id: mu_id, b_musical_time: b_musical_time, s_label: s_label}),
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
            }
            else{
                $.ajax({
                    type:'POST',
                    url: '/app/book/theater',
                    headers : { "content-type": "application/json" },
                    data : JSON.stringify({t_id: t_id, s_id: s_id}),
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
            }
        })
    })



</script>
</body>
</html>