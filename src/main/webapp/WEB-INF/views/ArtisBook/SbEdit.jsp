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

</style>
<body>
<%@ include file="SbCreateHeader.jsp"%>
<div class="SbEditPage" id="ArtiBook-Page">
    <!-- 이전 버튼 div -->
    <div class="SbEdit_pBtn">
        <img class="SbEdit_prevBtn" src="/img/prev-grey.svg" alt="Previous">
    </div>
    
    <!-- 중앙 책 콘텐츠 div -->
    <div class="SbEdit_Book">
    
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
        
        <!-- 책 올 -->
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

    <!-- 다음 버튼 div -->
    <div class="SbEdit_nBtn">
        <img class="SbEdit_nextBtn" src="/img/next-grey.svg" alt="Next">
    </div>
</div>

<script>



</script>
</body>
</html>
