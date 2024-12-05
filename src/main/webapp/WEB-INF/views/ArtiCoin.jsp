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

.AC_container {
	background-color: white;
	padding: 30px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	margin: 0 auto;
	text-align: center;
}

h3 {
	font-size: 20px;
	font-family: 'STUNNING-Bd';
}

.AC_logo {
	width: 200px;
	height: 100px;
}

.coin-buttons {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.coin-btn {
	padding: 10px 20px;
	font-size: 16px;
	border: 1px solid #325fff;
	background-color: #fff;
	color: #325fff;
	cursor: pointer;
	border-radius: 25px;
	transition: all 0.3s ease;
	font-weight: bold;
	float: right;
	margin-left: 30px;
}

.coin-btn:hover {
	border: 1px solid #fff;
	background-color: #325fff;
	color: #fff;
}

.coin-buttons {
	display: flex;
	flex-direction: column; /* 버튼을 세로로 정렬합니다. */
	gap: 10px;
}

.coin-div {
	padding: 20px 20px;
	font-size: 16px;
	border: 1px solid #d1d1d1;
	background-color: #f8f8f8;
	cursor: pointer;
	border-radius: 5px;
	transition: all 0.3s ease;
	text-align: left;
}

.coin-spans {
	font-family: 'STUNNING-Bd';
	float: left;
	line-height: 1.4;
}

.amount {
	font-size: 20px;
}

.description {
	font-size: 13px;
}

.container-description {
	font-size: 13px;
	text-align: left;
	margin-top: 10px;
}
</style>



</head>
<body>

	<div class="AC_container">
		<img class="AC_logo" alt="로고 사진" src="/img/ArtiLogo.png"> <br>
		<h3>아티코인 충전</h3>
		<div class="coin-buttons">
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">1000원</span> <br> <span
						class="description">+1 아티코인</span>
				</div>
				<button class="coin-btn" data-value="1000" onclick="next(1000);">충전하기</button>
			</div>
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">10000원</span> <br> <span
						class="description">+10 아티코인</span>
				</div>
				<button class="coin-btn" data-value="10000" onclick="next(10000);">충전하기</button>
			</div>
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">30000원</span> <br> <span
						class="description">+30 아티코인</span>
				</div>
				<button class="coin-btn" data-value="30000" onclick="next(30000);">충전하기</button>
			</div>
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">50000원</span> <br> <span
						class="description">+50 아티코인</span>
				</div>
				<button class="coin-btn" data-value="50000" onclick="next(50000);">충전하기</button>
			</div>

			<p class="container-description">
				‣ 카드/실시간계좌이체/휴대폰 결제만 가능합니다. <br> ‣ 코인 이용약관에 동의하시면 충전하기를 눌러주세요.
			</p>
		</div>
	</div>

	<script>
		function next(amount) {
		    fetch("/arti/payments/request", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json" // JSON 형식 사용
		        },
		        body: JSON.stringify({ amount: amount }) // JSON 데이터
		    })
		    .then(function(response) {
		        return response.json(); // 응답을 JSON으로 파싱
		    })
		    .then(function(data) {
		        console.log("결제 요청 성공:", data);
		    })
		    .catch(function(error) {
		        console.error("결제 요청 실패:", error);
		    });
		}
	</script>



</body>
</html>