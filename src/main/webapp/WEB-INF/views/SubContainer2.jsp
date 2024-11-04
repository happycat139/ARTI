<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
font-family: 'UhBeeSe_hyun';
src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
font-weight: normal;
font-style: normal;
}

.SubContainer2 {
    width: 100%;
    -webkit-box-flex: 1;
    flex-grow: 1;
    background-color: rgb(67, 77, 104);
    overflow: hidden;
    background-image: url('img/SubContainer2.png'); /* 배경 이미지 설정 */
    background-size: cover; /* 이미지가 div 전체를 덮도록 설정 */
    background-position: center; /* 이미지의 위치를 중앙으로 설정 */
    background-repeat: no-repeat; /* 이미지 반복 방지 */
    position: relative; /* 자식 요소의 절대 위치 설정을 위해 상대 위치 지정 */
    height: 100vh; /* 전체 화면 높이로 설정 */
}

.SubContainer2 > div {
    width: 1200px;
    height: 100%;
    position: relative;
}

.SubContainer2_header {
    position: absolute; /* 배경 위에 텍스트 배치 */
    top: 20%; /* 텍스트의 세로 위치 (적절히 조정 가능) */
    left: 10%; /* 텍스트의 가로 위치 (적절히 조정 가능) */
    display: flex;
    flex-direction: column; /* 텍스트를 세로로 배치 */
    align-items: flex-start; /* 텍스트를 왼쪽 정렬 */
    color: black; /* 텍스트 색상 */
    padding: 20px;
    border-radius: 10px;
}

.SubContainer2_header > p {
    padding-left: 40px;
    line-height: 80px;
    font-size: 60px;
    margin: 0;
    font-family: 'UhBeeSe_hyun';
    color: #00129A ;
}
</style>
</head>
<body>
<div class="SubContainer2">
    <div>
        <div class="SubContainer2_header">
           
        </div>
    </div>
</div>

</body>
</html>