<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.smhrd.Arti.Model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainContainer</title>
<style>
   @font-face {
       font-family: 'UhBeeSe_hyun';
       src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@2.0/UhBeeSe_hyun.woff') format('woff');
       font-weight: normal;
       font-style: normal;
   }

   body, html {
       margin: 0;
       padding: 0;
       width: 100vw;
       height: 100vh;
       font-family: 'UhBeeSe_hyun';
       background-color: white;
       overflow-y: auto; /* 수직 스크롤 허용 */
       overflow-x: hidden; /* 가로 스크롤은 여전히 숨김 */
   }

   /* 컨테이너 정렬 및 배경 */
   #container-wrap {
       display: flex;
       flex-direction: column;
       justify-content: center; /* 세로 중앙 정렬 */
       align-items: center; /* 가로 중앙 정렬 */
       height: 100vh;
       background-image: url('https://storage.googleapis.com/smhrd_arti/MainPage/MainPage1.png');
       background-position: center;
       background-repeat: no-repeat;
       background-size: contain; /* 이미지 비율 유지하면서 화면에 맞춤 */
   }

   .txt-box {
       text-align: center;
       padding-top: 10vh;
   }

   .txt-pkg .tit {
       font-size: 3vw; /* 뷰포트 너비 기반 글자 크기 */
       margin-bottom: 2vh;
       color: #00129A;
       font-family: 'UhBeeSe_hyun';
   }

   .txt-pkg .txt {
       font-size: 4vw; /* 강조 텍스트 크기 */
       color: #007AFF;
       font-family: 'UhBeeSe_hyun';
   }

   .txt-pkg .tot {
       font-size: 4vw; /* 관리자용 강조 텍스트 */
       color: #4682B4;
       font-family: 'UhBeeSe_hyun';
   }

   .gif {
       width: 10vw; /* 비율에 맞는 이미지 크기 */
       height: auto;
       margin-top: 5vh;
       cursor: pointer;
   }

   /* 반응형 디자인 */
   @media (max-width: 768px) {
       .txt-pkg .tit {
           font-size: 6vw;
       }
       .txt-pkg .txt {
           font-size: 7vw;
       }
       .gif {
           width: 15vw;
       }
   }

   @media (max-width: 480px) {
       .txt-pkg .tit {
           font-size: 7vw;
       }
       .txt-pkg .txt {
           font-size: 8vw;
       }
       .gif {
           width: 20vw;
       }
   }
</style>
</head>
<body>
    <div id="container-wrap">
        <div class="txt-box">
            <div class="txt-pkg">
                <c:choose>
                    <c:when test="${user != null && user.role == 'ADMIN'}">
                        <span class="tot">관리자용!</span><br>
                    </c:when>
                </c:choose>
                <span class="tit">내 아이의 마음 스케치북</span><br>
                <span class="txt">ARTI</span><br>
                <img class="gif" src="https://storage.googleapis.com/smhrd_arti/MainPage/MainScroll.gif" 
                     alt="Animated Image" onclick="scrollDownClick()">
            </div>
        </div>
    </div>

    <script>
       function scrollDownClick() {
           window.scrollBy({
               top: window.innerHeight, // 한 화면의 높이만큼 스크롤
               behavior: 'smooth'       // 부드러운 스크롤 효과
           });
       }
    </script>
</body>
</html>
