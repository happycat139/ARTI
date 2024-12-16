<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/* 전체 컨테이너 설정 */
.container {
	max-width: 1400px; /* 전체 크기를 조금 더 키움 */
	margin: 0 auto;
	padding: 10px;
}

/* 카드 설정 */
.card {
	border-radius: 10px;
	box-shadow: 0 5px 8px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
	padding: 25px; /* 카드 내 여백 확대 */
	margin-bottom: 25px;
}

/* 카드 바디 */
.card .card-body {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.card .card-text {
	font-size: 16px; /* 글자 크기 확대 */
	color: #6c757d;
}

.card h4 {
	font-size: 28px; /* 금액 및 숫자 크기 확대 */
	font-weight: bold;
	color: #333333;
}

.card i {
	font-size: 35px; /* 아이콘 크기 확대 */
	color: #6c757d;
}

/* 행별 여백 설정 */
.row {
	display: flex;
	flex-wrap: wrap;
	gap: 20px; /* 카드 간격 조정 */
	margin-bottom: 30px;
}

.col-lg-3 {
	flex: 1;
	max-width: 24%; /* 카드 비율 유지 */
	min-width: 240px; /* 카드 최소 크기 키움 */
}

.col-lg-8 {
	flex: 2;
	max-width: 68%; /* 차트 크기 키움 */
	min-width: 400px;
}

.col-lg-4 {
	flex: 1;
	max-width: 32%; /* Tasks 크기 키움 */
	min-width: 300px;
}

/* 색상 설정 */
.monthly {
	border-left: 6px solid #0074d9;
}

.annual {
	border-left: 6px solid #00509e;
}

.tasks {
	border-left: 6px solid #003f88;
}

.requests {
	border-left: 6px solid #001f3f;
}

/* 차트 및 작업 리스트 설정 */
.card-header {
	background-color: #f8f9fc;
	border-bottom: 2px solid #e3e6f0;
	padding: 20px;
	font-size: 18px; /* 카드 헤더 크기 확대 */
	font-weight: bold;
	color: #5a5c69;
}

.card ul.list-group {
	margin: 0;
	padding: 0;
}

.card ul.list-group .list-group-item {
	padding: 15px; /* 리스트 아이템 간격 확대 */
	font-size: 16px; /* 리스트 글자 크기 확대 */
	color: #5a5c69;
}

.card ul.list-group .list-group-item:not(:last-child) {
	border-bottom: 1px solid #e3e6f0;
}

/* 차트 설정 */
canvas {
	margin-top: 20px;
}

.my-4 {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 20px;
}
</style>



</head>
<body>

	<%@ include file="Header.jsp"%>
	<div class="container">
		<h4 class="my-4">Dashboard</h4>
		<div class="row">
			<div class="col-lg-3">
				<div class="card monthly">
					<div class="card-body d-flex justify-content-between">
						<div>
							<p class="card-text mb-2">매출 (일)</p>
							<h4>339,800원</h4>
						</div>
						<i class="fas fa-calendar"
							style="font-size: 30px; margin-top: 20px; color: #6c757d"></i> <img
							src="/img/dashboard_cal.png" id="articoin">
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card annual">
					<div class="card-body d-flex justify-content-between">
						<div>
							<p class="card-text mb-2">출판 동화책 (일)</p>
							<h4>7</h4>
						</div>
						<i class="fa-solid fa-dollar-sign"
							style="font-size: 30px; margin-top: 20px; color: #6c757d"></i> <img
							src="/img/dashboard_book.png" id="articoin">
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card tasks">
					<div class="card-body d-flex justify-content-between">
						<div>
							<p class="card-text mb-2">회원 수</p>
							<h4>13</h4>
						</div>
						<i class="fa-solid fa-list-check"
							style="font-size: 30px; margin-top: 20px; color: #6c757d"></i> <img
							src="/img/dashboard_user.png" id="articoin">
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card requests">
					<div class="card-body d-flex justify-content-between">
						<div>
							<p class="card-text mb-2">미답변 질문 수</p>
							<h4>8</h4>
						</div>
						<i class="fa-solid fa-comments"
							style="font-size: 30px; margin-top: 20px; color: #6c757d"></i> <img
							src="/img/dashboard_qna.png" id="articoin">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container mt-3">
		<div class="row">
			<div class="col-lg-8">
				<div class="card-header h5">일일 매출 현황</div>
				<div class="card-body">
					<canvas id="myChart"></canvas>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="card">
					<div class="card-header h5">추가정보</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"> 월 매출 : 4,543,800원</li>
						<li class="list-group-item"> 일 평균 매출 : 206,000원</li>
						<li class="list-group-item"> 오늘의 신규 가입자 : 2명 </li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="Footer.jsp"%>ㄴ

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		var ctx = document.getElementById("myChart").getContext("2d");
		var myChart = new Chart(ctx, {
			type : "line",
			data : {
				labels : [ "2024-12-14", "2024-12-15", "2024-12-16", "2024-12-17", "2024-12-18", "2024-12-19"
						],
				datasets : [ {
					label : "일",
					data : [ 89000, 129000, 234400, 258900, 188000, 339800 ],
					backgroundColor : "rgba(255, 99, 132, 0.2)",
					borderColor : "rgba(255, 99, 132, 1)",
					borderWidth : 1,
					fill : true,
					tension : 0.2,
				}, ],
			},
			options : {
				scales : {
					y : {
						beginAtZero : true,
					},
				},
			},
		});
	</script>

</body>
</html>