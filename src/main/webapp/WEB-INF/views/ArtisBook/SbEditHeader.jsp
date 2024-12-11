<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'STUNNING-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
		
body {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    background-color: white;
    color: #333;
    line-height: 1.6;
    margin: 0;
    padding: 0;
}

/* 헤더 스타일 */
.SBCH_Top-Container {
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: space-between; /* 좌우 공간 분배 */
    width: 100%;
    height: 80px;
    border-bottom: 1px solid rgb(237, 237, 237);
    z-index: 999;
    background-color: white;
    padding: 0 20px;
    box-sizing: border-box;
}

#SBCH_menu {
    display: flex;
    align-items: center;
}

.SBCH_menu-container {
    display: flex;
    align-items: center;
}

.SBCH_menu-container a {
    padding: 8px 16px;
    color: rgb(34, 34, 34);
    font-size: 16px;
    line-height: 26px;
    font-weight: 400;
    background-color: rgb(255, 255, 255);
    font-family: 'STUNNING-Bd';
    text-decoration: none;
    margin-right: 10px;
}

.SBCH_menu-container p {
    padding: 8px 16px;
    color: #BFBFBF;
    font-size: 16px;
    font-weight: 400;
    background-color: rgb(255, 255, 255);
    font-family: 'STUNNING-Bd';
    margin-right: 10px;
}

.SBCH_menu-container .qqqqq {
    background-color: #F7F7F7;
    border-radius: 10%;
}

/* 제목 중앙 배치 */
.SBCH_title-container {
    position: absolute;
    left: 50%;
    top:4.5%;
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    text-align: center;
    font-size: 20px; /* 제목 폰트 크기 조정 */
    font-family: 'STUNNING-Bd';
    white-space: nowrap; /* 줄바꿈 방지 */
    color: rgb(34, 34, 34);
}

.SBCH_setting-container {
    display: flex;
    align-items: center;
    gap: 20px; /* 설정과 저장 버튼 간격 */
}

.SBCH_setting-container a {
    display: flex;
    font-size: 18px;
    align-items: center;
    line-height: 26px;
    font-weight: 200;
    text-decoration: none;
    font-family: 'STUNNING-Bd';
    padding: 15px 25px;
}

/* 환경설정 버튼 */
.SBCH_setting-p {
	color:#6133e2 ;
}

.SBCH_setting-p > img {
	margin-right: 5px;
}

/* 저장 버튼 */
.SBCH_save-p {
	color:white ;
	background-color: #6133e2 ; 
	border-radius: 10px;
}

.SBCH_save-p > img {
	margin-right: 10px;
	width: 24px;
	height: 24px;
}

</style>
</head>
<body>
<header class="SBCH_Top-Container">
    <!-- 왼쪽 로고 및 메뉴 -->
    <div id="SBCH_menu">
        <a href="/"><img src="/img/ArtiLogo.png" alt="로고" style="height: 50px;"></a>
        <div class="SBCH_menu-container">
            <a href="#">AI 스토리 추천</a>
            <p>></p>
            <a href="#">글 편집</a>
            <p>></p>
            <a href="#" class="qqqqq">이미지 편집</a>
        </div>
    </div>

    <!-- 제목 (중앙 정렬) -->
    <div class="SBCH_title-container">
        <p>${storybook.book_name}</p>
    </div>

    <!-- 오른쪽 설정 및 저장 -->
    <div class="SBCH_setting-container">
        <a class="SBCH_setting-p" href="#">
        	<img src="/img/chat_popup/setting-deactivate.svg"> 설정
        </a>
        <a class="SBCH_save-p" href='/arti/book/storybook?book_idx=${storybook.book_idx}'>
        	<img src="/img/down.png"> 저장
        </a>
    </div>
</header>
</body>
</html>
