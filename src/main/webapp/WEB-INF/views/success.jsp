<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin-top: 50px;
}

.success-message {
	font-size: 20px;
	font-weight: bold;
	color: #4CAF50;
}

.details {
	margin-top: 20px;
	font-size: 16px;
}

.home-btn {
	display: inline-block;
	margin-top: 30px;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.home-btn:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h1 class="success-message">결제가 성공적으로 완료되었습니다!</h1>
	<div class="details">
		<p>
			결제 금액: <strong>${amount}원</strong>
		</p>
		<p>
			충전된 코인: <strong>${coinsAdded}개</strong>
		</p>
		<p>
			현재 코인: <strong>${user.coin}개</strong>
		</p>
		<p>
			감사합니다, <strong>${user.nickname}</strong>님!
		</p>
	</div>
	<a href="/" class="home-btn">홈으로 돌아가기</a>

</body>
</html>