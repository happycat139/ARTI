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

.SbEdit_PageLeft {
    flex: 1; 
    background-color: #fff;
    position: relative; /* 텍스트 중앙 정렬을 위한 설정 */
    display: flex; /* Flexbox를 사용하여 내부 요소를 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: left; /* 수평 중앙 정렬 */
    height: 100%; /* 부모 요소의 높이에 맞추기 */
    border-right: 1px solid rgba(0, 0, 0, 0.1);
    margin-left: 60px;
}

.SbEdit_PageRight {
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

.SbEdit_Info {
    text-align: left;
}

.SbEdit_Info > p {
    margin: 0;
}

.SbEdit_Info2 {
    display: flex;
    align-items: center;
    margin-top: 150px;
}

.SbEdit_BackImg2 {
    width: 200px;
    height: 180px;
    margin-top: 180px;
}

.SbEdit_PImg {
    width: 70px;
    height: 35px;
    margin-right: 10px;
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
    <div class="SbEdit_MainBook">
    
        <!-- 그림자 효과를 위한 중앙 선 -->
        <div class="center-shadow"></div>

        <!-- 책 왼쪽 -->
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
        
        <!-- 책 오른쪽 -->
        <div class="SbEdit_PageRight">
            <div class="text-content">
                인쇄되지 않는 <br>
                페이지입니다.
            </div>
        </div>
        
    </div>

    <!-- 다음 버튼 div -->
    <div class="SbEdit_nBtn">
        <img class="SbEdit_nextBtn" src="/img/next-grey.svg" alt="Next">
    </div>
</div>
</body>
</html>
