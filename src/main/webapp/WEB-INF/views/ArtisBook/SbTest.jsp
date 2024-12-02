<%@page import="com.smhrd.Arti.Model.StoryBook"%>
<%@page import="com.smhrd.Arti.Model.StoryContent"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/turn.min.js"></script>
<style>

body {
	margin: 0px;
	padding: 0px;
	font-family: "Noto Sans KR", sans-serif;
	background-color: #f7f7fc;
	box-sizing: border-box; /* 모든 요소에 border-box 적용 */
}

#book {
    margin: 0 auto;
}

#book.single-page {
    width: 800px; /* 단일 페이지 너비 */
    height: 800px; /* 단일 페이지 높이 */
    margin: 0 auto; /* 중앙 정렬 */
}

#book.double-page {
    width: 1600px; /* 이중 페이지 너비 */
    height: 800px; /* 이중 페이지 높이 */
}


#book .turn-page {
    -webkit-background-size: 100% 100%;
    background-size: 100% 100%;
}

#book div {
    -webkit-background-size: cover;
    background-size: cover;
    background-position: center center;
}

.SbEditPage {
	display: flex;
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: space-between; /* 양쪽 버튼을 좌우에 배치하고 가운데 공간을 차지하게 함 */
	width: 100%;
	height: 100%;
	padding-bottom: 76px;
	padding-top: 50px;
	
}

.SbEdit_pBtn, .SbEdit_nBtn {
	display: flex;
	align-items: center; /* 버튼을 수직 가운데 정렬 */
	justify-content: center;
	width: 60px; /* 버튼 영역의 너비 설정 */
	height: 100%;
}

.SbEdit_prevBtn, .SbEdit_nextBtn {
	width: 40px; /* 버튼의 이미지 너비 */
	cursor: pointer; /* 버튼 이미지에 마우스를 올렸을 때 커서 변경 */
}

.SbEdit_Book {
    position: relative;
    flex-grow: 1;
    max-width: 750px;
    height: 750px;
    border: 1px solid black;
    border-color: #bdbbbb;
    margin: 20px auto;
    background-color: #fff;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
    transition: transform 0.4s ease-in-out, box-shadow 0.4s ease-in-out;
    transform-origin: bottom left; /* 오른쪽 하단을 기준으로 회전 */
    perspective: 1000px; /* 3D 효과를 위한 원근감 추가 */
}

.SbEdit_Book:hover {
    transform: rotateX(-2deg) rotateY(-15deg); /* 오른쪽 위가 더 들리는 회전 효과 */
}

.left-section {
	flex: 4.95;
	background-color: #fff;
	border: 1px solid black;
	border-color: #bdbbbb;
}

.SbEdit_BackImg {
	width: 400px;
	height: 300px;
	padding-left: 160px;
	padding-top: 220px;
}

.center-section {
	flex: 0.05;
	flex-shrink: 0;
	background-color: #fff;
	padding: 5px; /* 여백 설정 */
	border: 1px solid black;
	border-color: #bdbbbb;
	justify-content: space-between;
}

.vertical-text {
	writing-mode: vertical-rl; /* 텍스트를 세로로 작성 (오른쪽에서 왼쪽 방향) */
	text-orientation: upright; /* 텍스트를 뒤집어 읽기 쉽게 함 */
	font-size: 1.2em; /* 폰트 크기 조절 */
	text-align: center;
	margin: 0;
}

.SbEdit_BookTitle {
	flex: 3;
	display: flex;
	align-items: flex-start;
	justify-content: center;
	margin-top: 80px;
	height: 300px;
}

.SbEdit_Writer {
	flex: 3;
	display: flex;
	align-items: flex-end;
	justify-content: center;
	height: 250px;
}

.SbEdit_Writer>p {
	margin-bottom: 20px;
	font-size: 16px;
}

.SbEdit_Publisher {
	flex: 1;
	align-items: flex-end;
}

.SbEdit_Publisher>img {
	width: 30px;
	height: 100px;
}

.right-section {
	flex: 4.95;
	background-color: #fff;
	border: 1px solid black;
	border-color: #bdbbbb;
	display: flex; /* 내부 요소들을 나누기 위해 Flexbox 사용 */
	flex-direction: column; /* 세로로 배치 */
	justify-content: space-between; /* 각 섹션 사이에 동일한 간격 */
}

.SbEdit_BookThumb {
	flex: 3; /* 세 개의 섹션이 동일한 높이를 가짐 */
	padding: 10px; /* 내부 여백 설정 */
	border-bottom: 1px solid #ccc; /* 섹션 구분을 위한 경계선 추가 */
	background-color: #faf7f7;
}

.bottom-right {
	flex: 1; /* 세 개의 섹션이 동일한 높이를 가짐 */
	padding: 10px; /* 내부 여백 설정 */
	border-bottom: 1px solid #ccc; /* 섹션 구분을 위한 경계선 추가 */
}

.bottom-right {
	border-bottom: none; /* 마지막 섹션은 경계선 제거 */
}

.SbEdit_BookThumb_icon {
	width: 482px;
	margin-top: 20px;
	margin-left: 150px;
}

.SbEdit_BookThumb>p {
	color: #1151ab;
	font-size: 23px;
	margin: 0;
	margin-left: 165px;
}

.SbEdit_BookMainTitle {
	margin: 50px 0 0 0;
	text-align: center;
	font-size: 32px;
}

.SbEdit_BookMainWriter {
	text-align: center;
}

/* 두번째 페이지 */
.hidden {
	display: none !important;
}



.SbEdit_MainBook {
	flex-grow: 1; /* 중앙 콘텐츠가 가능한 모든 공간을 차지하도록 설정 */
	max-width: 1500px;
	height: 750px;
	border: 1px solid black;
	border-color: #bdbbbb;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
	background-color: #fff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
	transition: box-shadow 0.5s ease-in-out;
	display: flex; /* Flexbox를 사용하여 내부 요소를 수평으로 배치 */
	flex-direction: row; /* 가로로 나열 */
	position: relative; /* 자식 요소의 절대 위치를 기준으로 함 */
	overflow: hidden;
	perspective: 1000px; /* 3D 효과를 위해 설정 */
}

.SbEdit_MainBook::after {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    width: 50px; /* 모서리 크기 */
    height: 50px;
    background: linear-gradient(to top left, rgba(255, 255, 255, 0.8), transparent);
    transform: rotateX(0deg) rotateY(0deg);
    transform-origin: bottom left;
    transition: transform 0.3s ease-in-out;
    pointer-events: none;
}

.SbEdit_MainBook:hover::after {
    transform: rotateX(-20deg) rotateY(10deg); /* 모서리가 들리는 효과 */
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3); /* 들리는 모서리에 그림자 추가 */
}





.SbEdit_PageLeft, .SbEdit_PageRight, .SbEdit_PageLeft1,
	.SbEdit_PageRight1 {
	flex: 1;
	background-color: #fff;
	position: relative; /* 텍스트 중앙 정렬을 위한 설정 */
	display: flex; /* Flexbox를 사용하여 내부 요소를 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: center; /* 수평 중앙 정렬 */
	height: 100%; /* 부모 요소의 높이에 맞추기 */
	border-right: 1px solid rgba(0, 0, 0, 0.1);
}

/* 중앙 그림자 효과 */
.center-shadow {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 50%;
	width: 2px; /* 선의 너비를 설정 */
	transform: translateX(-50%);
	background: rgba(0, 0, 0, 0.3); /* 선 자체는 투명하게 설정 */
	box-shadow: 10px 0 20px rgba(0, 0, 0, 0.5); /* 그림자를 오른쪽 방향으로 설정 */
	z-index: 1; /* 그림자가 다른 요소들과 어울리게 조정 */
}

.text-content {
	font-size: 1.5em; /* 글씨 크기 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
	color: #333; /* 글씨 색상 설정 */
	vertical-align: center;
	padding-left: 100px;
	padding-right: 100px;
	line-height: 2em;
}

.text-content>p {
	margin: 0;
	color: #1151AB;
}

.Sb_PutImage {
	height: 400px;
	width: 450px;
}

.SbEdit_PageLeft1 {
	background-color: #F0E9EC;
}

.SbEdit_Info2 {
	display: flex;
	margin-top: 150px;
}

.SbEdit_BackImg2 {
	width: 200px;
	height: 180px;
	margin-top: 180px;
}

.SbEdit_PImg {
	width: 110px;
	height: 50px;
	margin-right: 10px;
}

#book.single-page {
    margin: 0 auto; /* 단일 페이지 중앙 정렬 */
    width: 800px; /* 단일 페이지 너비 */
    height: 800px; /* 단일 페이지 높이 */
}



/* 기존 flip 애니메이션 제거 */

/* 페이지 슬라이드 애니메이션 */
@keyframes slide-left {
    0% {
        transform: translateX(0);
        opacity: 1;
    }
    100% {
        transform: translateX(-100%);
        opacity: 0;
    }
}

@keyframes slide-right {
    0% {
        transform: translateX(100%);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

/* 슬라이드 효과 클래스 */
.page-slide-left {
    animation: slide-left 1s forwards; /* 왼쪽으로 슬라이드 */
}

.page-slide-right {
    animation: slide-right 1s forwards; /* 오른쪽으로 슬라이드 */
}

/* 메인 북 */
.SbEdit_MainBook {
    position: relative;
    display: flex;
    flex-direction: row;
    transition: transform 0.5s ease-in-out;
    overflow: hidden;
}

.SbEdit_MainBook.hidden {
    display: none;
}
</style>
<body>
<%@ include file="SbHeader.jsp"%>



<div class="SbEditPage" id="ArtiBook-Page">
    <!-- 이전 버튼 div -->
    <div class="SbEdit_pBtn">
        <img class="SbEdit_prevBtn" src="/img/prev-grey.svg" alt="Previous">
    </div>
    
    <div id="book">
    
    <!-- 표지 div -->
    <div class="SbEdit_Book" class="page">
    
        <div class="right-section">
            <div class="SbEdit_BookThumb">
                <img class="SbEdit_BookThumb_icon" src="/img/images.png">
                <p>클릭하여 이미지를 업로드 해주세요!</p>
            </div>
            
            <div class="bottom-right">
                <p class="SbEdit_BookMainTitle" id="SbEdit_BookMainTitle">ARTI 가이드북</p>
                <p class="SbEdit_BookMainWriter">안녕하세요잇 지음</p>
            </div>
        </div>
    </div>
    
    <!-- 두 번째 페이지 -->
    <div class="SbEdit_MainBook" class="page">
        <div class="center-shadow"></div>
        <div class="SbEdit_PageLeft">
            <div class="text-content SbEdit_InputContent">
            </div>
        </div>
        <div class="SbEdit_PageRight">
            <div class="text-content SbEdit_InputContent">
                여기에는 제목
            </div>
        </div>
    </div>
    
    <!-- 페이지 3부터 13까지 반복 생성 -->
    <% for (int i = 3; i <= 13; i++) { %>
    <div class="SbEdit_MainBook" class="page">
        <div class="center-shadow"></div>
            
        <div class="SbEdit_PageLeft1">
            <div class="text-content SbEdit_InputContent">
                <img class="Sb_PutImage" src="/img/images.png">
                    <p>
                        여기에는 이미지
                    </p>
            </div>
        </div>
        
        <!-- 책 오른쪽 -->
        <div class="SbEdit_PageRight1">
            <div class="text-content SbEdit_InputContent">
                여기에는 내용
            </div>
        </div>
    </div>
    <% } %>
    
    <!-- 14번째 페이지 생성 -->
    <div class="SbEdit_MainBook" class="page">
        <div class="center-shadow"></div>
        <div class="SbEdit_PageLeft">
            <div class="SbEdit_info">
                <img class="SbEdit_BackImg2" src="/img/backImg.png"> <br>
                <p>책 제목</p> <br>
                <b>발행일</b> 2024년 11월 26일 <br>
                <b>지은이</b> 123 <br>
                <b>제  작</b> ARTI <br>
                
                <div class="SbEdit_Info2">
                    <img class="SbEdit_PImg" src="/img/ArtiLogo.png">
                    <div>
                        서울특별시 서초구 동작대로 132 9층 스마트인재개발원 <br>
                        www.arti.com | ARTI
                    </div>
                </div>
            </div>
        </div>
        <div class="SbEdit_PageRight">
            <div class="text-content">
            </div>
        </div>
    </div>
    
    <!-- 책 마지막 div -->
    <div class="SbEdit_Book" class="page">
    
        <div class="SbEdit_MainBook">
			<div class="SbEdit_PageLeft">
				<div class="SbEdit_info">
					<img class="SbEdit_BackImg2" src="/img/backImg.png"> <br>
					<p>책 제목</p>
					<br> <b>발행일</b> 2024년 12월 2일 <br> 
					<b>지은이</b> OOO <br> 
					<b>제 작</b> ARTI <br>

					<div class="SbEdit_Info2">
						<img class="SbEdit_PImg" src="/img/ArtiLogo.png">
						<div>
							서울특별시 서초구 동작대로 132 9층 스마트인재개발원 <br> www.arti.com | ARTI
						</div>
					</div>
				</div>
			</div>
    </div>
</div>
    
    <!-- 다음 버튼 div -->
    <div class="SbEdit_nBtn">
        <img class="SbEdit_nextBtn" src="/img/next-grey.svg" alt="Next">
    </div>


</div>
<script>
$(document).ready(function () {
    // Turn.js 초기화
    $("#book").turn({
        width: 1600, // 책의 전체 너비
        height: 800, // 책의 전체 높이
        autoCenter: true,
        display: "single", // 초기에는 단일 페이지 모드
        when: {
            turning: function (event, page) {
                const totalPages = $("#book").turn("pages");

                // 첫 페이지 또는 마지막 페이지일 경우 single 모드로 전환
                if (page === 1 || page === totalPages) {
                    $("#book").turn("display", "single"); // 단일 페이지 모드
                } else {
                    $("#book").turn("display", "double"); // 이중 페이지 모드
                }
            },
            turned: function (event, page) {
                const totalPages = $("#book").turn("pages");

                // 첫 페이지와 마지막 페이지 확인 및 보정
                if (page === 1 || page === totalPages) {
                    $("#book").turn("display", "single");
                } else {
                    $("#book").turn("display", "double");
                }
            }
        }
    });

    // 이전 버튼 동작
    $(".SbEdit_pBtn").click(function () {
        $("#book").turn("previous");
    });

    // 다음 버튼 동작
    $(".SbEdit_nBtn").click(function () {
        $("#book").turn("next");
    });

    // 초기 상태 설정: 첫 번째 페이지 single 모드
    if ($("#book").turn("page") === 1) {
        $("#book").turn("display", "single");
    }
});
</script>




</body>
</html>
