<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<style>
@font-face {
	font-family: 'STUNNING-Bd';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'STUNNING-Bd';
	text-align: center;
}

.PCO_container {
	min-height: 600px;
	margin-top: 200px;
}

.success-message {
	font-size: 30px;
	font-weight: bold;
	color: #1150ab;
}

.details {
	margin-top: 25px;
	font-size: 20px;
}

.home-btn {
	display: inline-block;
	margin-top: 30px;
	padding: 10px 20px;
	background-color: #1150ab;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	margin-right: 10px;
	font-size: 20px;
}

.home-btn:hover, .publish-btn:hover {
	background-color: #45a049;
}

.publish-btn {
	display: inline-block;
	margin-top: 30px;
	padding: 10px 20px;
	background-color: #1150ab;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	margin-left: 10px;
	font-size: 20px;
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="PCO_container">






		<h1 class="success-message">결제가 성공적으로 완료되었습니다!</h1>
		<div class="details">

			<p>
				감사합니다, <strong>우니</strong>님!
			</p>
		</div>
		<a href="/" class="home-btn">홈으로 돌아가기</a> <a href="#"
			class="publish-btn">배송내역 확인</a>



	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>