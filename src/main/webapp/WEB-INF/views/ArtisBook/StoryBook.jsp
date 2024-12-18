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
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/BookkMyungjo-Bd.woff2')
		format('woff2');
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

.storyBook-Wrap {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    position: relative; /* 버튼 위치를 위해 부모를 기준으로 설정 */
    height: 100vh; /* 화면 전체 높이 사용 */
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
	position: relative; 
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.3);
}

#book .page {
	background: #fff;
	border: 1px solid #ccc;
	text-align: center;
}

.SbEdit_pBtn, .SbEdit_nBtn {
    position: absolute; 
    top: 50%; 
    transform: translateY(-50%);
    background-color: white;
    color: black;
    border: none;
    border-radius: 50%;
    font-size: 16px;
    text-align: center;
    box-shadow: 0 2px 3px rgba(0, 0, 0, 0.3);
    width: 60px;
    height: 60px;
    cursor: pointer;
    display: flex; 
    align-items: center; 
    justify-content: center; 
    padding: 0; 
}

.SbEdit_pBtn {
	width: 50px;
	height: 50px;
	left: 120px;
}

.SbEdit_nBtn {
	width: 50px;
	height: 50px;
	right: 120px;
}

.SbEdit_pBtn img, .SbEdit_nBtn img {
    width: 40px; /* 이미지 크기 조정 */
    height: 40px;
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

.SbEdit_PageRight, .SbEdit_PageLeft1, .SbEdit_PageRight1 {
	flex: 1;
	background-color: #fff;
	position: relative; 
	display: flex; 
	align-items: center; 
	justify-content: center; 
	height: 100%; 
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
	padding-top: 330px;
	font-size: 32px;
	font-family: 'BookkMyungjo-Bd';
}

#book #Cp{
	padding-top: 230px;
}


.SbSample_Image {
	width: 700px;
	height: 698px;
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

.SbEdit_page_num {
	position: absolute; /* 화면 기준으로 고정 */
    bottom: 20px; /* 화면의 하단에 배치 */
    right: 20px; /* 왼쪽 시작 */
    color: gray;

}
</style>
</head>
<body>
<%@ include file="SbHeader.jsp"%>
	
<div class="storyBook-Wrap">
	
	<!-- 이전 버튼 div -->
	<button class="SbEdit_pBtn">
		<img src="https://storage.googleapis.com/smhrd_arti/ArtisBook/StoryBook/prev.png">
	</button>

	<!-- 책 구조 -->
	<div id="book">
		<div class="page" class="right-section">
			<div class="SbEdit_BookThumb">
				<img src="${storybook.book_thumbnail}" class="SbEdit_BookThumb_icon">
			</div>

			<div class="bottom-right" id="0">
				<p class="SbEdit_BookMainTitle" id="SbEdit_BookMainTitle">${storybook.book_name}</p>
				<p class="SbEdit_BookMainWriter">${storybook.author}지음</p>
			</div>
			
		</div>
		<div class="page testPage" id="p1"></div>
		<div class="page" class="SbEdit_BookMainWriter" id="p2">${storybook.book_name}</div>

		<!-- 책 시작 -->
		<c:forEach var="content" items="${storyContentList}"
			varStatus="status">
		
				<div class="page" id="Ip">
					<img src="${content.image != null ? content.image : '/img/farARTI.png'}" class="SbSample_Image">
				</div>

				<div class="page" id="Cp">
					<p class="SbSample_Content">${content.content}</p>
					<div class="SbEdit_page_num">${content.pageNum}</div>
				</div>
			
		</c:forEach>

		<div class="page" id="p25">
			<div class="SbEdit_PageLeft">
				<div class="SbEdit_info">
					<img src="${storybook.book_thumbnail}" class="SbEdit_BackImg2">

					<br>
					<p>${storybook.book_name}</p>
					<br> <b>발행일</b> 2024년 12월 2일<br> <b>지은이</b>
					${storybook.author}<br> <b>제 작</b> ARTI <br>

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

		<div class="page" class="Story_LastPage" id="last">
			<img src="${storybook.book_thumbnail}" class="SbEdit_BackImg2">
		</div>
	</div>

	<!-- 다음 버튼 div -->
	<button class="SbEdit_nBtn">
		<img src="https://storage.googleapis.com/smhrd_arti/ArtisBook/StoryBook/next.png">
	</button>

	</div>
	
<script>
    $(document).ready(function () {
        // Turn.js 초기화
        $("#book").turn({
            width: 700, // 초기 싱글 페이지 너비
            height: 700, // 초기 싱글 페이지 높이
            autoCenter: true,
            gradient: true,
            display: 'single', // 첫 페이지 단독 표시
        });

        // 페이지 전환 이벤트 처리
        $("#book").bind("turning", function (event, page) {
            const totalPages = $("#book").turn("pages");

            if (page === 2) {
                // 두 번째 페이지부터는 두 페이지씩 표시
                $("#book").turn("display", "double");
                $("#book").turn("size", 1400, 700); // 크기 변경
            } else if (page === totalPages) {
                // 마지막 페이지는 단독 페이지로 표시
                $("#book").turn("display", "single");
                $("#book").turn("size", 700, 700); // 크기 변경
            }
        });

        // 이전 버튼 동작
        $(".SbEdit_pBtn").on("click", function () {
            $("#book").turn("previous");
        });

        // 다음 버튼 동작
        $(".SbEdit_nBtn").on("click", function () {
            $("#book").turn("next");
        });
    });
</script>

</body>
</html>
