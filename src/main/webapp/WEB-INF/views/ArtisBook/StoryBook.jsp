<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/turn.min.js"></script>
<style>

@font-face {
    font-family: 'BookkMyungjo-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/BookkMyungjo-Bd.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}


body {
    margin: 0px;
    padding: 0px;
    font-family: "Noto Sans KR", sans-serif;
    background-color: #f7f7fc;
    box-sizing: border-box;
}

.ex1 {
	display: flex;
	vertical-align: middle;
	align-items: center;
}

#book {
    width: 700px;
    height: 700px;
    margin: 5% auto;
}

#book .page {
    background: #fff;
    border: 1px solid #ccc;
    text-align: center;
}

.SbEdit_pBtn, .SbEdit_nBtn {
    cursor: pointer;
    display: inline-block;
    padding: 10px 20px;
    background-color: white;
    color: black;
    border: none;
    border-radius: 50%;
    font-size: 16px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    max-width: 100%; /* 이미지가 버튼 크기를 넘지 않도록 설정 */
    max-height: 100%;
    object-fit: contain; /* 이미지 크기를 버튼 안에 맞게 조정 */ 
}

.SbEdit_pBtn {
    float: left;
    margin-left: 10%;
    width: 60px;
    height: 60px;
}

.SbEdit_nBtn {
    float: right;
    margin-right: 10%;
    width: 60px;
    height: 60px;
}

.SbEdit_PageLeft {
	flex: 1;
	background-color: #fff;
	position: relative;
	display: flex; 
	align-items: center; 
	justify-content: left; 
	height: 100%;
	border-right: 1px solid rgba(0, 0, 0, 0.1);
}

.SbEdit_PageRight, .SbEdit_PageLeft1,
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
	flex: 3; 
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
	width: 700px;
	height: 516px;
}


.SbEdit_BookMainTitle {
	margin: 20px 0 0 0;
	text-align: center;
	font-size: 32px;
	font-family: 'BookkMyungjo-Bd';
}

.SbEdit_BookMainWriter {
	text-align: center;
	font-family: "Nanum Myeongjo";
}

.SbEdit_info {
	text-align: left;
	margin-left: 30px;
}

.SbEdit_Info2 {
	display: flex;
	margin-top: 70px;
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

.Story_LastPage {
	background-color: #fff;
	padding-top: 80px;
	padding-left: 250px;
}

#book #p1 {
    background: #FFEDED;
    border: 1px solid #ccc;
    text-align: center;
}

#book #p26 {
    background: #FFEDED;
    border: 1px solid #ccc;
    text-align: center;
}

#book #cover, #last {
    align-items: center;
}

/* 페이지 세부 CSS */

#book #p2 {
	padding-top:330px;
	font-size: 32px;
	font-family: 'BookkMyungjo-Bd';
}

#book #p4, #p6, #p8, #p10, #p12, #p14, #p16, #p18, #p20, #p22, #p24 {
	padding-top:230px;
}

.SbSample_Image {
	width: 700px;
	height: 700px;
}

.SbSample_Content {
	font-family: "Nanum Myeongjo", serif;
    transform: rotate(0.04deg);
    font-size: 19px;
    font-style: normal;
    font-weight: 400;
    line-height: 31px;
    letter-spacing: 0.032px;
    padding: 50px;
}

</style>
</head>
<body>
<%@ include file="SbHeader.jsp" %>
    <!-- 이전 버튼 div -->
    <button class="SbEdit_pBtn">이전</button>
    
    <!-- 책 구조 -->
    <div id="book">
		<div class="right-section">
            <div class="SbEdit_BookThumb">
                <div class="SbEdit_BookThumb_icon">
                	${stroybook.book_thumbnail} 
                </div>
            </div>
            
            <div class="bottom-right" id="0">
                <p class="SbEdit_BookMainTitle" id="SbEdit_BookMainTitle">${storybook.book_name}</p>
                <p class="SbEdit_BookMainWriter">${storybook.author} 지음</p>
            </div>
		</div>
        <div class="page testPage" id="p1"></div>
        <div class="page" class="SbEdit_BookMainWriter" id="p2">${storybook.book_name}</div>
        
        <!-- 책 시작 -->
		<c:forEach var="content" items="${storyContentList}" varStatus="status">
    	
    	<!-- 홀수 인덱스에서 image 출력 -->
    	<c:if test="${status.index >= 3 && status.index <= 24 && status.index % 2 != 0}">
        	<div class="page" id="p${status.index + 3}">
            	<div class="SbSample_Image">
                	${content.image}
            	</div>
        	</div>
    	</c:if>

    	<!-- 짝수 인덱스에서 content 출력 -->
    	<c:if test="${status.index >= 3 && status.index <= 24 && status.index % 2 == 0}">
        	<div class="page" id="p${status.index + 3}">
            	<p class="SbSample_Content">
                	${content.content}
            	</p>
        	</div>
    	</c:if>
	</c:forEach>
        
        <div class="page" id="p25">
        	<div class="SbEdit_PageLeft">
				<div class="SbEdit_info">
					<div class="SbEdit_BackImg2">
						${stroybook.book_thumbnail} 
					</div>
					
					<br>
					<p>${storybook.book_name}</p><br> 
					<b>발행일</b> 2024년 12월 2일<br> 
					<b>지은이</b> ${storybook.author}<br> 
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
        <div class="page" id="p26"></div>
        
        <div class="Story_LastPage" id="last">
            <div class="SbEdit_BackImg2">
				${stroybook.book_thumbnail} 
			</div>
		</div>
    </div>

    <!-- 다음 버튼 div -->
    <button class="SbEdit_nBtn">다음</button>

    <script>
    $(document).ready(function () {
        $("#book").turn({
            width: 1400, // 책의 너비
            height: 700, // 책의 높이
            autoCenter: true, // 책 중앙 정렬
            gradient: true, // 페이지 말아지는 그림자 활성화
            corners: "tl, tr, bl, br", // 모든 모서리에서 넘기기 가능
        });

        // 이전 버튼
        $(".SbEdit_pBtn").click(function () {
            $("#book").turn("previous");
        });

        // 다음 버튼
        $(".SbEdit_nBtn").click(function () {
            $("#book").turn("next");
        });
    });

    </script>
</body>
</html>
