<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainContainer</title>
<style>

@font-face {
font-family: 'UhBeeSe_hyun';
src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
font-weight: normal;
font-style: normal;
}

.MainContainer {
    width: 100%;
    -webkit-box-flex: 1;
    flex-grow: 1;
    background-color: rgb(67, 77, 104);
    overflow: hidden;
    background-image: url('img/MainPage.png'); /* 배경 이미지 설정 */
    background-size: cover; /* 이미지가 div 전체를 덮도록 설정 */
    background-position: center; /* 이미지의 위치를 중앙으로 설정 */
    background-repeat: no-repeat; /* 이미지 반복 방지 */
    position: relative; /* 자식 요소의 절대 위치 설정을 위해 상대 위치 지정 */
    height: 100vh; /* 전체 화면 높이로 설정 */
}

.MainContainer > div {
    width: 1200px;
    height: 100%;
    position: relative;
}

.MainContainer_header {
    position: absolute; /* 배경 위에 텍스트 배치 */
    top: 20%; /* 텍스트의 세로 위치 (적절히 조정 가능) */
    left: 10%; /* 텍스트의 가로 위치 (적절히 조정 가능) */
    display: flex;
    flex-direction: column; /* 텍스트를 세로로 배치 */
    align-items: flex-start; /* 텍스트를 왼쪽 정렬 */
    color: black; /* 텍스트 색상 */
    background: rgba(255, 255, 255, 0.7); /* 가독성을 위해 반투명한 흰색 배경 추가 */
    padding: 20px;
    border-radius: 10px;
}

.MainContainer_header > p {
    padding-left: 40px;
    line-height: 80px;
    font-size: 40px;
    margin: 0;
    font-family: 'UhBeeSe_hyun';
    color: #00129A ;
}
</style>
</head>
<body>
<div class="MainContainer">
    <div>
        <div class="MainContainer_header">
            <p>내 아이의</p>
            <p>마음 스케치북</p>
            <a><img src="/img/ArtiLogo.png"></a>
           
            <p>아래로 스크롤하세요 !</p>
        </div>
    </div>
</div>
</body>
</html>
