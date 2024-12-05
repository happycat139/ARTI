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
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin:0 auto;
}

.AC_container {
    background-color: white;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin:0 auto;
    text-align:center;
}


img{
	width: 300px;
	height: 200px;

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
    color:#325fff;
    cursor: pointer;
    border-radius: 25px;
    transition: all 0.3s ease;
    font-weight:bold;
    float:right;
    margin-left:30px;

}

.coin-btn:hover {
    border: 1px solid #fff;
    background-color: #325fff;
    color:#fff;
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
    text-align:left;
}

.coin-spans {
    float:left;
}

.amount {
    font-size: 20px;
}

.description {
    font-size: 13px;
}

.container-description{
    font-size: 13px;
    text-align:left;
    margin-top:10px;
}




</style>



</head>
<body>
	<%@ include file="Header.jsp" %>
	
	<div class="AC_container">
		<img alt="로고 사진" src="/img/ArtiLogo.png">
		<br>
		<h3>아티코인 충전</h3>
		<div class="coin-buttons">
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">5000원</span>
					<br>
					<span class="description">+5 코인</span>
				</div>
				<button class="coin-btn" data-value="5000" onclick="next(5000);">충전하기</button>
			</div>
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">10000원</span>
					<br>
					<span class="description">+10 코인</span>
				</div>
				<button class="coin-btn" data-value="10000" onclick="next(10000);">충전하기</button>
			</div>
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">30000원</span>
					<br>
					<span class="description">+30 코인</span>
				</div>
				<button class="coin-btn" data-value="30000" onclick="next(30000);">충전하기</button>
			</div>
			<div class="coin-div">
				<div class="coin-spans">
					<span class="amount">50000원</span>
					<br>
					<span class="description">+50 코인</span>
				</div>
				<button class="coin-btn" data-value="50000" onclick="next(50000);">충전하기</button>
			</div>
			
			<p class="container-description"> ‣ 카드/실시간계좌이체/휴대폰 결제만 가능합니다.
			<br>
			 ‣ 코인 이용약관에 동의하시면 충전하기를 눌러주세요.</p>
		</div>
		
			
		
		
		
		
		
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>
	
	
	
	
	<%@ include file="Footer.jsp" %>

</body>
</html>