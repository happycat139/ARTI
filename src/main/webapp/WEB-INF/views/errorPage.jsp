<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/QnaBoard/QnaBoardMain.css">
<link rel="icon" href="/img/favicon.ico">

<style>
@font-face {
	font-family: 'LINESeedKR-Bd';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2')
		format('woff2');
	font-weight: 200;
	font-style: normal;
}

body, html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

.error {
	display: flex;
	flex-direction: column;
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	height: 90%; /* 부모 요소의 높이 */
	font-family: 'LINESeedKR-Bd';
}

.btn-container {
	display: flex;
	justify-content: center; /* 가로 정렬 */
	gap: 20px; /* 버튼 간 간격 */
	margin-top: 30px;
}

.btn {
	display: inline-block;
	padding: 9px 18px;
	font-size: 1.2rem;
	color: #fff;
	background-color: #1150ab; /* 버튼 배경 색상 */
	border: 2px solid #1150ab; /* 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	text-decoration: none; /* 링크 기본 스타일 제거 */
	font-weight: bold;
	transition: all 0.3s ease; /* 부드러운 효과 */
}

.btn:hover {
	background-color: #fff; /* 호버 시 배경색 */
	color: #1150ab; /* 호버 시 글자색 */
	border-color: #1150ab; /* 호버 시 테두리 색상 */
}
</style>




</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div class="error">
		<img src="/img/error.png"> <br> 죄송합니다. 현재 찾을 수 없는 페이지를
		요청하셨습니다. <br> <strong>페이지 주소가 잘못 입력되었거나, 주소가 변경 혹은 삭제되어
			요청하신 페이지를 찾을 수 없습니다.</strong>
		<div class="btn-container">
			<a href="/" class="btn">메인으로</a> <a href="javascript:history.back();"
				class="btn">이전으로</a>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</body>
</html>