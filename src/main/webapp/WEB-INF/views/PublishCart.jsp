<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.Arti.Model.StoryBook"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
</head>
<style>
@font-face {
	font-family: 'STUNNING-Bd';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body, div, p, span, input, table {
	margin: 0;
	padding: 0;
	font-family: 'STUNNING-Bd';
	box-sizing: border-box; /* 레이아웃 계산 안정화 */
}

.Pub_container {
	width: 80%; /* 가로 너비 */
	margin: 0 auto; /* 가로 가운데 정렬 */
	padding-top: 50px; /* 위쪽 여백 추가 */
	position: relative;
	margin-bottom:150px;
}

.Pub_header_name {
	width: 100%; /* 너비를 컨테이너 기준으로 맞춤 */
	margin-bottom: 16px; /* 아래 여백 */
	font-size: 20px;
	font-weight: 600;
	position: relative;
	text-align: left;
	line-height: 1.5; /* 텍스트 세로 정렬 */
	padding-top: 20px; /* 위쪽 여백 추가 */
}

.Pub_list {
	display: grid;
	margin-left: 65px;
	grid-template-columns: 3fr 1fr 0.95fr 0.95fr; /* 동일한 비율로 설정 */
	gap: 20px;
	align-items: center;
	padding: 10px 0; /* 위아래 여백 설정 */
	font-size: 14px;
	font-weight: 500;
	text-align: center;
	border-top: 1px solid black;
	box-sizing: border-box;
	margin: 0 auto; /* 중앙 정렬 */
	font-family: 'STUNNING-Bd';
}

.Pub_product_name {
	flex: 1; /* Flexbox를 활용해 너비 균등 분배 */
	text-align: left;
	margin-left: 200px;
}

.Pub_ea_name, .Pub_regular_name, .Pub_price_name{
	flex: 1; /* Flexbox를 활용해 너비 균등 분배 */
	text-align: center;
}

.Pub_list, .Pub_cart_item {
	margin: 0 auto;
	box-sizing: border-box;
	gap: 20px;
	align-items: center;
}

.Pub_cart_item {
	display: grid;
	grid-template-columns: 0.02fr 2.8fr 1fr 1fr 1fr; /* 비율 재조정 */
	gap: 10px; /* 열 간격 */
	align-items: center; /* 세로 가운데 정렬 */
	padding: 16px 0; /* 상하 여백 */
	border-top: 1px solid #E6E6E6;
	margin: 0 auto; /* 중앙 정렬 */
	box-sizing: border-box; /* 패딩 포함 크기 계산 */
}

.Pub_product {
	display: flex;
	align-items: center;
	gap: 20px;
}

.Pub_product_img img {
	width: 84px;
	height: 84px;
	object-fit: cover;
	border-radius: 8px;
	margin-right: 20px;
}

.Pub_ea {
	display: flex;
	flex-direction: column; /* 수직 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
	gap: 10px; /* 요소 간 간격 */
}

.Pub_ea, .Pub_regular, .Pub_price {
	text-align: center;
	font-size: 14px;
	font-weight: 500;
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
	height: 100%; /* 부모 높이에 맞추기 */
	font-family: 'STUNNING-Bd';
}

.Pub_product_text p:first-child {
	font-size: 18px;
	font-weight: bold;
}

.Pub_product_text p:last-child {
	color: #A4A4A4;
	font-size: 16px;
}

.Pub_product p {
	margin-bottom: 15px;
}

.option-button {
	display: inline-block;
	margin-top: 10px;
	padding: 5px 10px;
	font-size: 13px;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.option-button:hover {
	background-color: #ddd;
}

.Pub_delete {
	float: left;
	display: inline-block;
	width: 63px;
	height: -webkit-fill-available;
	min-height: 90px;
	text-align: center;
	position: relative;
}

.Pub_ea_top {
	display: flex; /* 가로 정렬 */
	align-items: center; /* 세로 정렬 */
	gap: 5px; /* input과 span 간격 */
}

input[type='text'], textarea {
	display: inline-block;
	width: 60px;
	height: 30px;
	padding: 0 13px;
	font-size: 14px;
	color: rgba(0, 0, 0, 0.9);
	border: 1px solid #A4A4A4;
	border-radius: 5px;
	box-sizing: border-box !important;
}

.input-ea {
	display: inline-block;
	width: 55px !important;
	height: 35px !important;
	margin: 0 !important;
	padding: 1px 10px !important;
	font-size: 14px !important;
	border: 1px solid rgba(0, 0, 0, 0.3) !important;
	border-radius: 5px !important;
	text-align: right !important;
	box-sizing: border-box !important;
}

#Pub_cart_total {
	margin-top: 50px;
	display: flex; /* Flexbox 사용 */
	justify-content: flex-end; /* 오른쪽 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
	height: 90px;
	font-size: 18px;
	font-weight: 500;
	text-align: center;
	background: #F9F9F9;
	font-family: 'STUNNING-Bd';
}

.Pub_total_regular, .Pub_total_delivery, .Pub_total_price,
	.Pub_total_operator {
	text-align: right; /* 텍스트도 오른쪽 정렬 */
	margin-right: 20px; /* 요소 간격 추가 */
}

.Pub_total_highlight {
	color: #FE6565;
	font-weight: bold;
}

.Pub_total_regular {
	float: left;
	display: inline-block;
	min-width: 80px;
	padding: 0 10px;
	box-sizing: border-box !important;
}

.Pub_total_info {
	margin-bottom: 4px;
	font-size: 14px;
}

.Pub_total_operator {
	float: left;
	display: inline-block;
	width: 48px;
}

.Pub_total_delivery {
	float: left;
	display: inline-block;
	min-width: 80px;
	padding: 0 10px;
	box-sizing: border-box !important;
}

.Pub_total_price {
	float: left;
	display: inline-block;
	min-width: 80px;
	padding: 0 10px;
	box-sizing: border-box !important;
}

.Pub_main_button {
	display: block;
	width: 184px;
	height: 50px;
	line-height: 44px;
	margin: 50px auto;
	font-size: 16px;
	font-weight: 300;
	text-align: center;
	border-radius: 8px;
	border: 1px solid #6133E2;
	background-color: #6133E2;
	color: #fff;
	cursor: pointer;
	box-sizing: border-box !important;
	font-family: 'STUNNING-Bd';
}

.Pub_order_button {
	position: absolute;
	bottom: 162px;
	right: 0;
}

.Pub_warning-list {
	margin: 0;
	padding: 0;
	font-size: 14px;
}

.Pub_delete img {
	width: 17px;
	height: 17px;
}

.Pub_delete {
	display: flex;
	align-items: center;
}
</style>

<body>
	<%@ include file="Header.jsp"%>

	<div class="Pub_container">

		<div class="Pub_header_name">장바구니</div>

		<div class="Pub_grid_list">
			<div class="Pub_list">
				<div class="Pub_product_name">상품명</div>
				<div class="Pub_ea_name">수량</div>
				<div class="Pub_regular_name">판매금액</div>
				<div class="Pub_price_name">결제금액</div>
			</div>
			<c:forEach items="${cartList}" var="cart">
				<div class="Pub_cart_item">
					<!-- 삭제 버튼 -->
					<div class="Pub_delete">
						<img alt="" src="/img/Pub_X.png">
					</div>

					<!-- 상품 정보 -->
					<div class="Pub_product">
						<div class="Pub_product_img">
							<img src="${cart.book_thumbnail}" alt="동화 썸네일">
						</div>
						<div class="Pub_product_text">
							<p>${cart.book_name}</p>
							<p style="color: #A4A4A4;">고화질 스퀘어북 24P</p>
						</div>
					</div>

					<!-- 수량 -->
					<div class="Pub_ea">
						<div class="Pub_ea_top">
							<input type="text" name="ea" value="${cart.quantity}" maxlength="3"> <span>권</span>
						</div>
						<a class="option-button" onclick="changeEa(${cart.book_idx}, document.getElementById('quantity-${cart.book_idx}'))">수량 변경</a>
					</div>

					<!-- 판매금액 -->
					<div class="Pub_regular">
						<p>${9900 * cart.quantity}원</p>
					</div>

					<!-- 결제금액 -->
					<div class="Pub_price">
						<p>${9900 * cart.quantity}원</p>
					</div>
				</div>
			</c:forEach>

			<div id="Pub_cart_total">
				<div class="Pub_total_regular">
					<div class="Pub_total_info">판매금액</div>
					${totalPrice}원
				</div>
				<div class="Pub_total_operator">
					<div class="Pub_total_info"></div>
					+
				</div>
				<div class="Pub_total_delivery">
					<div class="Pub_total_info">배송비</div>
					${totalPrice < 50000 ? 3000 : 0}원
				</div>
				<div class="Pub_total_operator">
					<div class="Pub_total_info"></div>
					=
				</div>
				<div class="Pub_total_price">
					<div class="Pub_total_info">결제금액</div>
					<div class="Pub_total_highlight"><c:out value="${totalPrice + (totalPrice < 50000 ? 3000 : 0)}"/>원</div>
				</div>
			</div>


			<div class="Pub_main_button" onclick="location.href='/arti/publish/check'">
				주문하기
				<button class="Pub_order_button"></button>
			</div>

			<div
				style="margin-bottom: 5px; padding-top: 22px; font-size: 13px; font-weight: 500;">유의사항
			</div>
			<ul class="Pub_warning_list">
				<li>결제금액 5만원 미만일 시 배송비 3,000원이 추가됩니다.</li>
				<li>고객님께서 편집한 그대로 제작됩니다.</li>
				<li>주문 전에 표지 이미지를 클릭해 빠진 사진, 오타를 꼭 검토해 주세요!</li>
				<li>편집한 상품은 주문 후 수정할 수 없습니다.</li>
			</ul>
		</div>

	</div>


	<%@ include file="Footer.jsp"%>

</body>
</html>