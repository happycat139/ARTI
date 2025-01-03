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
<style>
body {
	margin: 0px;
	padding: 0px;
	font-family: "Noto Sans KR", sans-serif;
	background-color: #f7f7fc;
	box-sizing: border-box; /* 모든 요소에 border-box 적용 */
}

.SbEditPage {
	display: flex;
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: space-between; /* 양쪽 버튼을 좌우에 배치하고 가운데 공간을 차지하게 함 */
	width: 100%;
	padding-bottom: 76px;
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
	flex-grow: 1; /* 중앙 콘텐츠가 가능한 모든 공간을 차지하도록 설정 */
	max-width: 1500px;
	height: 750px;
	border: 1px solid black;
	border-color: #bdbbbb;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
	background-color: #fff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
	transition: box-shadow 0.3s ease-in-out;
	display: flex; /* Flexbox를 사용하여 내부 요소를 수평으로 배치 */
	flex-direction: row; /* 가로로 나열 */
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
	width: 400px;
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
	transition: box-shadow 0.3s ease-in-out;
	display: flex; /* Flexbox를 사용하여 내부 요소를 수평으로 배치 */
	flex-direction: row; /* 가로로 나열 */
	position: relative; /* 자식 요소의 절대 위치를 기준으로 함 */
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

/* 팝업창 관련 CSS */
.SbEdit-ModifyModalBack {
	width: 100vw;
	height: 100vh;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	z-index: 2;
}

.SbEdit-ModifyModal {
	width: 663px;
	height: 700px;
	border-radius: 20px;
	background: #fff;
	box-shadow: 0px 0px 5px -1px rgba(0, 0, 0, 0.15);
	position: fixed;
	left: calc(50vw - 317px);
	top: 5%;
}

.SbEdit-ModifyTitle {
	color: #000;
	padding: 20px 0 0 30px;
	text-align: left;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 22px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
}

.SbEdit-ModifyInput {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	width: 570px;
	height: 490px;
	border-radius: 8px;
	border: white;
	resize: none;
	background: #f4f4fc;
	margin: 24px 0 20px 30px;
	padding: 16px;
}

.SbEdit-ModifyInput:focus {
	outline: none;
	border: none;
}

.SbEdit-BtnCon {
	display: flex; /* 플렉스 박스로 설정 */
	justify-content: center; /* 수평으로 중앙 정렬 */
	gap: 20px; /* 버튼들 사이에 간격 설정 */
	margin-top: 10px; /* 모달과 버튼 사이의 간격 설정 */
}

.Modify-SEModal-Cbtn {
	width: 234px;
	height: 46px;
	flex-shrink: 0;
	border-radius: 8px;
	border: 2px solid #6133e2;
	background-color: #fff;
	color: #6133e2;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
	cursor: pointer;
}

.Modify-SEModal-btn {
	width: 234px;
	height: 46px;
	margin: 0 0 0 0;
	flex-shrink: 0;
	border-radius: 8px;
	border: 1px solid #6133e2;
	background-color: var(--story, #6133e2);
	color: #fff;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
	cursor: pointer;
}

/* 제목 편집 팝업창 관련 CSS */
.SbEdit-ModifyModalBack_Title {
	width: 100vw;
	height: 100vh;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	z-index: 2;
}

.SbEdit-ModifyModal_Title {
	width: 750px;
	height: 250px;
	border-radius: 20px;
	background: #fff;
	box-shadow: 0px 0px 5px -1px rgba(0, 0, 0, 0.15);
	position: fixed;
	left: calc(50vw - 317px);
	top: 5%;
}

.SbEdit-TitleModalCon {
	display: flex; /* 플렉스 박스로 설정하여 한 줄에 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	padding: 0 30px; /* 양쪽 여백 설정 */
	gap: 20px; /* 드롭다운과 텍스트 영역 사이의 간격 설정 */
}

.dropdown-container {
	position: relative;
	border-bottom: 1px solid #ddd; /* 하단에 선 추가 */
	flex-shrink: 0; /* 드롭다운 크기가 줄어들지 않도록 설정 */
	width: 150px;
}

.styled-select {
	width: 150px;
	padding: 10px;
	font-size: 16px;
	border: none; /* 기본 경계선을 제거 */
	outline: none;
	-webkit-appearance: none; /* 크롬 등 웹킷 브라우저에서 기본 화살표 제거 */
	-moz-appearance: none; /* 파이어폭스에서 기본 화살표 제거 */
	appearance: none; /* 기본 화살표 제거 */
	background: transparent;
	margin-top: 10px;
}

.dropdown-container::after {
	content: '\25BC'; /* 드롭다운 화살표 추가 (▼) */
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	pointer-events: none; /* 화살표 클릭을 방지 */
	color: #aaa;
}

.SbEdit-ModifyInput_Title {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	width: 500px; /* 너비 설정 */
	height: 30px; /* 높이 설정 */
	border-radius: 8px;
	border: white;
	resize: none;
	background: #f4f4fc;
	padding: 10px;
}

.SbEdit-ModifyInput_Title:focus {
	outline: none;
	border: none;
}

.SbEdit-BtnCon_Title {
	display: flex; /* 플렉스 박스로 설정 */
	justify-content: center; /* 수평으로 중앙 정렬 */
	gap: 20px; /* 버튼들 사이에 간격 설정 */
	margin-top: 30px; /* 모달과 버튼 사이의 간격 설정 */
}

.Modify-SEModal-Cbtn_Title {
	width: 234px;
	height: 46px;
	flex-shrink: 0;
	border-radius: 8px;
	border: 2px solid #6133e2;
	background-color: #fff;
	color: #6133e2;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
	cursor: pointer;
}

.Modify-SEModal-btn_Title {
	width: 234px;
	height: 46px;
	margin: 0;
	flex-shrink: 0;
	border-radius: 8px;
	border: 1px solid #6133e2;
	background-color: var(--story, #6133e2);
	color: #fff;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
	cursor: pointer;
}

/* 썸네일 팝업 CSS */
.SbPlotModifyModalBack_THUMB {
	width: 100vw;
	height: 100vh;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	z-index: 2;
}

.SbPlot-ModifyModal_THUMB {
	width: 663px;
	height: 600px;
	border-radius: 20px;
	background: #fff;
	box-shadow: 0px 0px 5px -1px rgba(0, 0, 0, 0.15);
	position: fixed;
	left: calc(50vw - 317px);
	top: 22%;
}

.SbPlotModalCloseBtn_THUMB {
	margin: 20px 0 15px 615px;
}

.SbPlot-ModifyTHUMB {
	color: #000;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 22px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
}

.SbPlot-ModifySubTHUMB {
	color: #000;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 22px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
	margin-top: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.SbPlot-ModifyInput_THUMB {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	width: 570px;
	height: 276px;
	border-radius: 8px;
	border: white;
	resize: none;
	background: #f4f4fc;
	margin: 24px 0 20px 30px;
	padding: 16px;
}

.SbPlot-ModifyInput_THUMB:focus {
	outline: none;
	border: none;
}

.Modify-SBPModal-btn_THUMB {
	float: right;
	width: 234px;
	height: 46px;
	margin: 0 35px 0 15px;
	flex-shrink: 0;
	border-radius: 8px;
	border: 1px solid #6133e2;
	background-color: var(--story, #6133e2);
	color: #fff;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-style: normal;
	font-weight: 500;
	line-height: 30px;
	cursor: pointer;
}

.Modify-SBPModal-credit_THUMB {
	color: rgba(0, 0, 0, 0.7);
	text-align: right;
	font-family: Inter;
	font-size: 14px;
	font-style: normal;
	font-weight: 400;
	line-height: 46px;
	float: right;
}

.Modify-SbEdit_THUMB {
	color: var(--story, #6133e2);
	text-align: left;
	font-family: Inter;
	font-size: 18px;
	font-style: normal;
	font-weight: 400;
	line-height: 46px;
	float: left;
	margin: 0 0 20px 30px;
}

.SbEdit-Option {
	color: #6133e2;
	margin-left: 10px;
	cursor: pointer;
	border: 2px solid #6133e2;
	padding: 5px 10px;
	border-radius: 30px;
}
</style>
<body>
	<%@ include file="SbCreateHeader.jsp"%>
	

	<div class="SbEditPage" id="ArtiBook-Page">
		<!-- 이전 버튼 div -->
		<div class="SbEdit_pBtn">
			<img class="SbEdit_prevBtn" src="/img/prev-grey.svg" alt="Previous"
				onclick="showPreviousPage()">
		</div>

		<!-- 중앙 책 콘텐츠 div -->
		<div class="SbEdit_Book" id="page1">

			<!-- 책 왼쪽 -->
			<div class="left-section">
				<div>
					<div class="SbEdit_BookBackImg" id="SbEdit_BookBackImg">
						<img class="SbEdit_BackImg" src="/img/backImg.png">
					</div>
					<div class="SbEdit_BookPage"></div>
				</div>
			</div>

			<!-- 책 중앙 -->
			<div class="center-section">
				<div class="SbEdit_BookTitle">
					<p class="vertical-text">${storybook.book_name}</p>
				</div>
				<div class="SbEdit_Writer" style="align-self: flex-end;">
					<p class="vertical-text">${storybook.author}지음</p>
				</div>
				<div class="SbEdit_Publisher">
					<img src="/img/publisher.png">
				</div>
			</div>

			<!-- 책 오른쪽 -->
			<div class="right-section">
				<div class="SbEdit_BookThumb">
					<img class="SbEdit_BookThumb_icon" src="/img/images.png">
					<p>클릭하여 이미지를 업로드 해주세요!</p>
				</div>

				<div class="bottom-right">
					<p class="SbEdit_BookMainTitle" id="SbEdit_BookMainTitle">${storybook.book_name}</p>
					<p class="SbEdit_BookMainWriter">${storybook.author}지음</p>
				</div>
			</div>
		</div>

		<!-- 두 번째 페이지 -->
		<div class="SbEdit_MainBook hidden" id="page2">
			<div class="center-shadow"></div>
			<div class="SbEdit_PageLeft">
				<div class="text-content SbEdit_InputContent">인쇄되지 않는 페이지입니다.
				</div>
			</div>
			<div class="SbEdit_PageRight">
				<div class="text-content SbEdit_InputContent">내용을 입력해주세요.</div>
			</div>
		</div>


		<input type="hidden" name="book_idx" value="${storybook.book_idx}">
		<!-- 페이지 3부터 13까지 반복 생성 -->
		<c:forEach var="content" items="${storyContentList}"
			varStatus="status">
			<div class="SbEdit_MainBook hidden" id="page${status.index + 3}"
				data-page-num="${content.pageNum}"
				data-book-idx="${content.book_idx}">
				<div class="center-shadow"></div>

				<!-- 책 왼쪽 -->
				<div class="SbEdit_PageLeft1">
					<div class="text-content SbEdit_InputContent">
						<img class="Sb_PutImage" src="/img/images.png">
						<p>클릭하면 AI를 이용해 페이지에 어울리는 이미지가 자동으로 생성됩니다.</p>
					</div>
				</div>

				<!-- 책 오른쪽 -->
				<div class="SbEdit_PageRight1">
					<div class="text-content SbEdit_InputContent"
						id="SbContent-page${status.index + 3}">${content.content != null ? content.content : "내용을 입력해주세요."}
					</div>
				</div>
			</div>
		</c:forEach>





		<!-- 14번째 페이지 생성 -->
		<div class="SbEdit_MainBook hidden" id="page14">
			<div class="center-shadow"></div>
			<div class="SbEdit_PageLeft">
				<div class="SbEdit_info">
					<img class="SbEdit_BackImg2" src="/img/backImg.png"> <br>
					<p>${storybook.book_name}</p>
					<br> <b>발행일</b> ${storybook.book_name} <br> <b>지은이</b>
					${storybook.author} <br> <b>제 작</b> ARTI <br>

					<div class="SbEdit_Info2">
						<img class="SbEdit_PImg" src="/img/ArtiLogo.png">
						<div>
							서울특별시 서초구 동작대로 132 9층 스마트인재개발원 <br> www.arti.com | ARTI
						</div>
					</div>
				</div>
			</div>
			<div class="SbEdit_PageRight">
				<div class="text-content">
					인쇄되지 않는 <br> 페이지입니다.
				</div>
			</div>
		</div>


		<!-- 다음 버튼 div -->
		<div class="SbEdit_nBtn">
			<img class="SbEdit_nextBtn" src="/img/next-grey.svg" alt="Next"
				onclick="showNextPage()">
		</div>

		<!-- 내용 편집 팝업창 -->
		<div id="SbEditModifyModalBack" class="SbEdit-ModifyModalBack"
			style="display: none;">
			<div class="SbEdit-ModifyModal">
				<div class="SbEdit-ModifyTitle">내용 편집</div>
				<textarea class="SbEdit-ModifyInput"></textarea>
				<div class="SbEdit-BtnCon">
					<button class="Modify-SEModal-Cbtn">취소하기</button>
					<button class="Modify-SEModal-btn" type="button">수정하기</button>
				</div>
			</div>
		</div>

		<!-- 제목 편집 팝업창 -->
		<div id="SbEdit-ModifyModalBack_Title"
			class="SbEdit-ModifyModalBack_Title" style="display: none;">
			<input type="hidden" name="book_idx" value="${storybook.book_idx}">
			<div class="SbEdit-ModifyModal_Title">
				<div class="SbEdit-ModifyTitle">제목 편집</div>
				<div class="SbEdit-TitleModalCon">
					<div class="dropdown-container">
						<select class="styled-select">
							<option value="option0"></option>
							<option value="option1">궁서체</option>
							<option value="option2">고딕체</option>
							<option value="option3">진미채</option>
							<option value="option4">무생채</option>
						</select>
					</div>
					<textarea class="SbEdit-ModifyInput_Title">${storybook.book_name}</textarea>
				</div>
				<div class="SbEdit-BtnCon_Title">
					<button class="Modify-SEModal-Cbtn_Title">취소하기</button>
					<button class="Modify-SEModal-btn_Title" type="button">수정하기</button>
				</div>
			</div>
		</div>

		<!-- 썸네일 편집 팝업창 -->
		<div id="SbPlotModifyModalBack_THUMB"
			class="SbPlotModifyModalBack_THUMB" style="display: none;">
			<div class="SbPlot-ModifyModal_THUMB">
				<img src="/img/close-icon.svg" id="SbPlotModifyModalClose_THUMB"
					class="SbPlotModalCloseBtn_THUMB">
				<div class="SbPlot-ModifyTHUMB">
					<b>원하는 장면을 자세히 적으면 AI가 그림을 생성합니다.</b>
				</div>
				<div class="SbPlot-ModifySubTHUMB">
					현재 그림체 :
					<div class="SbEdit-Option">
						수채화 일러스트 <img src="/img/gear.png" style="margin-top: 5px;">
					</div>
				</div>
				<textarea class="SbPlot-ModifyInput_THUMB"></textarea>
				<button class="Modify-SBPModal-btn_THUMB">생성하기</button>
				<br>
				<div class="Modify-SBPModal-credit_THUMB">잔여 크레딧 : 31</div>
				<div class="Modify-SbEdit_THUMB">
					<b>직접 그림 업로드</b>
				</div>
			</div>
		</div>
	</div>
	
	
	
	 <div>
        브러쉬 크기<input id="input" type="number" min="0" max="100" value="1"></input>
        <button onclick="colorChange('black')" style="background-color: black; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('blue')" style="background-color: blue; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('red')" style="background-color: red; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('green')" style="background-color: green; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('pink')" style="background-color: pink; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('yellow')" style="background-color: yellow; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('skyblue')" style="background-color: skyblue; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('violet')" style="background-color: violet; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('lime')" style="background-color: lime; width: 20px; height: 20px; border: solid 1px;"></button>
        <button onclick="colorChange('white')">지우개</button>
        <button onclick="clearAll()">전체지우기</button>
    </div>

<canvas id='canvas' width='500' height='500' style="border:1px solid black"></canvas>

	<script>
let currentPage = 1;
const totalPages = 14;

function showNextPage() {
    if (currentPage < totalPages) {
        const current = document.getElementById("page" + currentPage);
        const next = document.getElementById("page" + (currentPage + 1));

        current.classList.add("hidden");
        next.classList.remove("hidden");
        currentPage++;
    }
}

function showPreviousPage() {
    if (currentPage > 1) {
        const current = document.getElementById("page" + currentPage);
        const previous = document.getElementById("page" + (currentPage - 1));

        current.classList.add("hidden");
        previous.classList.remove("hidden");
        currentPage--;
    }
}

window.onload = function() {
    document.getElementById("page1").classList.remove("hidden");

    for (let i = 2; i <= totalPages; i++) {
        document.getElementById("page" + i).classList.add("hidden");
    }




    /* 제목 편집 팝업창 관련 JS */
    const bookMainTitle = document.querySelectorAll("#SbEdit_BookMainTitle");
    bookMainTitle.forEach((div) => {
        div.addEventListener("click", function() {
            document.getElementById("SbEdit-ModifyModalBack_Title").style.display = "block";
        });
    });
};

// 내용 팝업창 닫기 (취소 버튼 클릭 시)
document.querySelector(".Modify-SEModal-Cbtn").onclick = function() {
    document.getElementById("SbEditModifyModalBack").style.display = "none";
};

// 제목 팝업창 닫기 (취소 버튼 클릭 시)
document.querySelector(".Modify-SEModal-Cbtn_Title").onclick = function() {
    document.getElementById("SbEdit-ModifyModalBack_Title").style.display = "none";
};

// 팝업창 닫기 (배경 클릭 시)
window.onclick = function(event) {
    const modal1 = document.getElementById("SbEditModifyModalBack");
    const modal2 = document.getElementById("SbEdit-ModifyModalBack_Title");
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
    if (event.target == modal2) {
        modal2.style.display = "none";
    }
};

// 제목 변경
// 제목 변경
document.querySelector('.Modify-SEModal-btn_Title').addEventListener('click', function () {
    // 수정할 데이터 가져오기
    const bookIdx = document.querySelector('input[name="book_idx"]').value;
    const bookName = document.querySelector('.SbEdit-ModifyInput_Title').value;

    // 서버로 수정 요청 보내기
    fetch('/arti/book/updateTitle', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            book_idx: bookIdx,
            book_name: bookName,
        }),
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 팝업창 닫기
                const modal = document.getElementById('SbEdit-ModifyModalBack_Title');
                if (modal) {
                    modal.style.display = 'none';
                }

                // 변경된 제목 반영 (책 오른쪽 하단 제목)
                const titleDisplay = document.querySelector('.SbEdit_BookMainTitle');
                if (titleDisplay) {
                    titleDisplay.textContent = bookName;

                    // 미세한 시각적 피드백 추가
                    titleDisplay.style.transition = "opacity 0.3s ease-in-out";
                    titleDisplay.style.opacity = "0.7";
                    setTimeout(() => {
                        titleDisplay.style.opacity = "1";
                    }, 300);
                }

                // 변경된 제목 반영 (책 중앙 세로 텍스트 부분)
                const verticalText = document.querySelector('.SbEdit_BookTitle .vertical-text');
                if (verticalText) {
                    verticalText.textContent = bookName;

                    // 미세한 시각적 피드백 추가
                    verticalText.style.transition = "opacity 0.3s ease-in-out";
                    verticalText.style.opacity = "0.7";
                    setTimeout(() => {
                        verticalText.style.opacity = "1";
                    }, 300);
                }
            } else {
                console.error('서버 응답 오류:', data.message || '제목 수정 중 문제가 발생했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
});


document.querySelectorAll('.SbEdit_PageRight1').forEach((page) => {
    page.addEventListener('click', function () {
        const modal = document.getElementById('SbEditModifyModalBack'); // 줄거리 모달창
        modal.style.display = 'block';

        // 페이지 번호 가져오기
        const pageNum = page.closest('.SbEdit_MainBook').getAttribute('data-page-num');
        const bookIdx = document.querySelector('input[name="book_idx"]').value; // book_idx 가져오기

        // 줄거리 내용 가져오기
        const storyContent = page.querySelector('.SbEdit_InputContent').textContent.trim();

        // 모달창에 데이터 반영
        modal.querySelector('.SbEdit-ModifyInput').value = storyContent;

        // 선택한 페이지 번호 및 책 ID 저장 (수정 요청 시 활용)
        modal.setAttribute('data-page-num', pageNum);
        modal.setAttribute('data-book-idx', bookIdx); // book_idx 저장

        console.log('Selected Page Number:', pageNum);
        console.log('Story Content:', storyContent);
    });
});

//줄거리 수정 버튼 클릭 이벤트
document.querySelector('.Modify-SEModal-btn').addEventListener('click', function () {
    const modal = document.getElementById('SbEditModifyModalBack');
    const pageNum = modal.getAttribute('data-page-num'); // 페이지 번호
    const bookIdx = modal.getAttribute('data-book-idx'); // book_idx 가져오기
    const updatedContent = modal.querySelector('.SbEdit-ModifyInput').value; // 수정된 내용

    console.log('Request data:', { book_idx: bookIdx, pageNum: pageNum, content: updatedContent });

    // 서버로 수정 요청
    fetch('/arti/book/updateStoryContent', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            book_idx: parseInt(bookIdx, 10), // 책 식별자
            pageNum: parseInt(pageNum, 10), // 페이지 식별자
            content: updatedContent,
        }),
    })
        .then(response => response.json())
        .then(data => {
            console.log('Response data:', data);

            if (data.success) {
                // 팝업창 닫기
                modal.style.display = 'none';

                // 수정된 줄거리 내용을 페이지에 반영
                const contentElement = document.getElementById("SbContent-page" + (parseInt(pageNum, 10) + 2));

                if (contentElement) {
                    // 기존 내용을 수정된 내용으로 업데이트
                    contentElement.textContent = data.updatedContent || updatedContent; // 서버 응답 사용

                    // 미세한 시각적 피드백 추가 (투명도 살짝 변화)
                    contentElement.style.transition = "opacity 0.3s ease-in-out";
                    contentElement.style.opacity = "0.7";
                    setTimeout(() => {
                        contentElement.style.opacity = "1";
                    }, 300); // 0.3초 후 원래 상태로 복구
                } else {
                    console.error('DOM 업데이트 실패: 페이지 콘텐츠를 찾을 수 없습니다.', pageNum);
                }
            } else {
                console.error('서버 응답 오류:', data.message || '줄거리 수정 중 문제가 발생했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
});


var pos = {
    drawable : false,
    x : -1,
    y : -1,
};
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
var rect = canvas.getBoundingClientRect();  // 터치 스크린

//전체 지우기
function clearAll(){
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}

//스타일 추가
input.oninput = function(){
    ctx.lineWidth = input.value;
}
ctx.lineCap = 'round';
ctx.lineJoin = 'round';

function colorChange(color){
    ctx.strokeStyle = color;
} 

canvas.addEventListener("mousedown", listener);
canvas.addEventListener("mousemove", listener);
canvas.addEventListener("mouseup", listener);
canvas.addEventListener("mouseout", listener);

/// 터치 스크린
canvas.addEventListener("touchstart", listener);
canvas.addEventListener("touchmove", listener);
canvas.addEventListener("touchend", listener);

function listener(e){
    switch(e.type){
        case "mousedown":
            drawStart(e);
            break;
        case "mousemove":
            if(pos.drawable){
                draw(e);
            }
            break;
        case "mouseout":
        case "mouseup":
            drawEnd();
            break;
        case "touchstart":
            touchStart(e);
            break;
        case "touchmove":
            if(pos.drawable)
                touch(e);
            break;
        case "touchend":
            drawEnd();
            break;
        default:
    }
}

function drawStart(e){
    pos.drawable = true;
    ctx.beginPath();
    pos.x = e.offsetX;
    pos.y = e.offsetY;
    ctx.moveTo(pos.x, pos.y);
}
function touchStart(e){
    pos.drawable = true;
    ctx.beginPath();
    pos.x = e.touches[0].pageX - rect.left
    pos.y = e.touches[0].pageY - rect.top
    ctx.moveTo(pos.x, pos.y);
}
function draw(e){
    ctx.lineTo(e.offsetX, e.offsetY);
    pos.x = e.offsetX;
    pos.y = e.offsetY;
    ctx.stroke();
}
function touch(e){
    ctx.lineTo(e.touches[0].pageX - rect.left, e.touches[0].pageY - rect.top);
    pos.x = e.touches[0].pageX - rect.left;
    pos.y = e.touches[0].pageY - rect.top;
    ctx.stroke();
}
function drawEnd(){
    pos.drawable = false;
    pos.x = -1;
    pos.y = -1;
}





</script>
</body>
</html>
