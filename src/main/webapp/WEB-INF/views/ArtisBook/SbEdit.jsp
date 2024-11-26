<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    height:300px;
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

.SbEdit_Writer > p {
    margin-bottom: 20px;
    font-size: 16px;
}

.SbEdit_Publisher {
    flex: 1;
    align-items: flex-end;
}

.SbEdit_Publisher > img {
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

.SbEdit_BookThumb > p {
    color: #1151ab;
    font-size: 23px;
    margin: 0;
    margin-left: 165px;
}

.SbEdit_BookMainTitle {
	margin: 50px 0 0 0 ;
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

.SbEdit_PageLeft, .SbEdit_PageRight , .SbEdit_PageLeft1, .SbEdit_PageRight1 {
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
    z-index: 5; /* 그림자가 다른 요소들과 어울리게 조정 */
}

.text-content {
    font-size: 1.5em; /* 글씨 크기 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
    color: #333; /* 글씨 색상 설정 */
    vertical-align: center;
}

.text-content > p {
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


</style>
<body>
<%@ include file="SbCreateHeader.jsp"%>
<div class="SbEditPage" id="ArtiBook-Page">
    <!-- 이전 버튼 div -->
    <div class="SbEdit_pBtn">
        <img class="SbEdit_prevBtn" src="/img/prev-grey.svg" alt="Previous" onclick="showPreviousPage()">
    </div>
    
    <!-- 중앙 책 콘텐츠 div -->
    <div class="SbEdit_Book" id="page1">
    
    	<!-- 책 왼쪽 -->
        <div class="left-section">
        	<div>
        		<div class="SbEdit_BookBackImg">
                	<img class="SbEdit_BackImg" src="/img/backImg.png">
            	</div>
            </div>
        </div>
        
        <!-- 책 중앙 -->
        <div class="center-section">
            <div class="SbEdit_BookTitle">
                <p class="vertical-text">ARTI 가이드북</p>
            </div>
            <div class="SbEdit_Writer" style="align-self: flex-end;">
                <p class="vertical-text">안녕하세요잇 지음</p>
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
            	<p class="SbEdit_BookMainTitle">ARTI 가이드북</p>
            	<p class="SbEdit_BookMainWriter">안녕하세요잇 지음</p>
            </div>
        </div>
    </div>
    
    <!-- 두 번째 페이지 -->
    <div class="SbEdit_MainBook hidden" id="page2">
        <div class="center-shadow"></div>
        <div class="SbEdit_PageLeft">
            <div class="text-content">
                인쇄되지 않는 페이지입니다.
            </div>
        </div>
        <div class="SbEdit_PageRight">
            <div class="text-content">
                내용을 입력해주세요.
            </div>
        </div>
    </div>
    
    <!-- 페이지 3부터 13까지 반복 생성 -->
    <% for (int i = 3; i <= 13; i++) { %>
    <div class="SbEdit_MainBook hidden" id="page<%=i%>">
    	<div class="center-shadow"></div>
            
        <div class="SbEdit_PageLeft1">
            <div class="text-content">
                <img class="Sb_PutImage" src="/img/images.png">
                	<p>
                		클릭하면 AI를 이용해 페이지에
                	<br>
                		어울리는 이미지가 자동으로 생성됩니다.
                	</p>
            </div>
        </div>
        
        <!-- 책 오른쪽 -->
        <div class="SbEdit_PageRight1">
            <div class="text-content">
                내용을 입력해주세요.
            </div>
        </div>
    </div>
	<% } %>
	
	<!-- 14번째 페이지 생성 -->
	<!-- 두 번째 페이지 -->
    <div class="SbEdit_MainBook hidden" id="page14">
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
                인쇄되지 않는 <br>
                페이지입니다.
            </div>
        </div>
    </div>
	
	
    <!-- 다음 버튼 div -->
    <div class="SbEdit_nBtn">
        <img class="SbEdit_nextBtn" src="/img/next-grey.svg" alt="Next" onclick="showNextPage()">
    </div>
</div>
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

// 페이지 로딩 시 항상 첫 번째 페이지 보이도록 설정
window.onload = function() {
    document.getElementById("page1").classList.remove("hidden");
    
    for (let i = 2; i <= totalPages; i++) {
        document.getElementById("page" + i).classList.add("hidden");
    }
    
    currentPage = 1;
}

    
</script>
</body>
</html>
