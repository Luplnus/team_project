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
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
  <link rel="stylesheet" href="<c:url value="/css/Main_page.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/css/function_more.css"/>"/>
  <title>JPIEL</title>
</head>
<body>
<header>
  <div id="wrap">
    <!-- iframe 대신 video 태그 사용 -->
    <div class="video_background" id="videoBackground">
      <video id="videoPlayer" autoplay muted loop playsinline>
        <source src="" type="video/mp4">
        브라우저가 비디오 태그를 지원하지 않습니다.
      </video>
    </div>

    <!-- 비디오 오버레이 추가 -->
    <div class="video_overlay"></div>

    <div class="main_menu">
      <div class="h_menubox">
        <div class="main_logo">
          <h2><a href="<c:url value="/Main_page.html" />" style="color: inherit; text-decoration: none" >JPIEL</a></h2>
        </div>
        <div class="menu_bar">
          <a href="<c:url value="/Movie.html" />" style="text-decoration: none"><div class="menu_box">영화</div></a>
          <a href="<c:url value="/musical" />" style="text-decoration: none"><div class="menu_box">뮤지컬</div></a>
          <a href="<c:url value="/Theaterpage.html" />" style="text-decoration: none"><div class="menu_box">연극</div></a>
          <a href="<c:url value="/Pay_page.html" />" style="text-decoration: none"><div class="menu_box">예매</div></a>
        </div>
        <div class="content" style="width: 120px">
          <div class="content_box">
              <img src="<c:url value="/pt_img/search.svg"/>" alt="">
          </div>
          <c:choose>
            <c:when test="${logInTxt == 'notDone'}">
              <div class="content_box content_box_login" style="width: 50px">
                <a href="<c:url value='/logIn' />" >
                  로그인
                </a>
              </div>
            </c:when>
            <c:otherwise>
              <div class="content_box content_box_myPageIcon">
                <img src="<c:url value="/pt_img/user.svg"/>" alt="">
                <div class="more_btn_nav">
                  <div class="more_btn_nav_myPage more_menu">
                    <a href="<c:url value="/myPage"/>">My Page</a>
                  </div>
                  <div class="more_btn_nav_logOut more_menu">
                    <a href="<c:url value="/logOut"/>">로그아웃</a>
                  </div>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
    <div class="genre_bar">
      <div class="intro_ttl">
        <!--JS로 구현-->
      </div>

      <div class="intro_view">
        <div class="main-container">
          <div class="swiper main-swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide main-slide">
                <img src="./img/19636c6ce2a211e76.jpg" alt="" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/yFHHfHcUgGAxziP1C3lLt0q2T4s.webp" alt="" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/MISSION1.jpg" alt="" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/2893d8b7b3f94f.webp" alt="" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/위키드.webp" alt="약한영웅 Class 2" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/25005672_p.gif" alt="" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/L0000113_p.gif" alt="" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/25004642_p.gif" alt="" class="img_box">
              </div>
              <div class="swiper-slide main-slide" data-video-src="">
                <img src="./img/23005704_p.gif" alt="" class="img_box">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</header>


<div class="genrn_tool">

  <div class="genrn_mn">
    <nav class="genrn_menu">영화</nav>
    <nav class="genrn_menu">연극</nav>
    <nav class="genrn_menu">뮤지컬</nav>
  </div>

  <div class="genrn_ttl">
    <div class="genrn_new">
      <strong>장르별 최신순</strong>
      <ul>
        <li class="detail_mn">영화이름</li>
        <li class="detail_lating">평점</li>
        <li class="detail_mn">장르</li>
        <li class="detail_mn">개봉일</li>
      </ul>
      <div class="btn_mv">
        <button class="ticketing">예매하기</button>
        <button class="zzim">찜하기</button>
      </div>
    </div>

    <div class="slide_box">
      <div class="swiper movie-swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide movie-slide">슬라이드 1</div>
          <div class="swiper-slide movie-slide">슬라이드 2</div>
          <div class="swiper-slide movie-slide">슬라이드 3</div>
          <div class="swiper-slide movie-slide">슬라이드 4</div>
          <div class="swiper-slide movie-slide">슬라이드 5</div>
          <div class="swiper-slide movie-slide">슬라이드 5</div>
          <div class="swiper-slide movie-slide">슬라이드 6</div>
          <div class="swiper-slide movie-slide">슬라이드 7</div>
          <div class="swiper-slide movie-slide">슬라이드 8</div>
          <div class="swiper-slide movie-slide">슬라이드 9</div>
          <div class="swiper-slide movie-slide">슬라이드 10</div>
        </div>
      </div>
    </div>
  </div>
</div>


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



<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/js/Main_page.js"/>"></script>
<script src="<c:url value="/js/Main_list.js"/>"></script>
<script src="<c:url value="/js/function_more.js"/>"></script>

<script>
</script>
</body>
</html>
