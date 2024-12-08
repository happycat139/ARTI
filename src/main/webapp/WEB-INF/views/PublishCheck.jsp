<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.Arti.Model.StoryBook"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body, div, p, span, input, table {
	margin: 0;
	padding: 0;
}

body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: left;
	background-color: #fff;
}

#Pch_wrapper {
	display: flow-root;
}

.Pch_full_wrapper {
	width: 1140px;
	min-height: 500px;
	margin: 60px auto 130px;
	color: rgba(0, 0, 0, 0.8);
	position: relative;
}

#Pch_left {
	float: left;
	display: inline-block;
	width: 764px;
}

#Pch_list {
	border-bottom: 1px solid #E6E6E6;
}

.Pch_display_list {
	display: grid;
	width: 100%;
	border-top: 1px solid rgba(0, 0, 0, 0.7);
}

.Pch_header {
	height: 60px;
	line-height: 60px;
	padding-left: 12px;
	font-size: 18px;
	font-weight: 600;
	text-align: left;
	box-sizing: border-box !important;
}

.Pch_product {
	float: left;
	display: inline-block;
	width: 513px;
	height: -webkit-fill-available;
	position: relative;
}

.Pch_ea, .Pch_regular, .Pch_price {
	float: left;
	display: inline-block;
	position: relative;
	top: 50%;
	width: 120px;
	transform: translate(0, -50%);
}

#Pch_right {
	float: right;
	display: inline-block;
	width: 356px;
}

#Pch_cart_all {
	display: none;
	transition: height 0.5s linear;
}

.Pch_cart {
	display: inline-block;
	padding: 19px 0;
	font-size: 14px;
	border-top: 1px solid #E6E6E6;
	box-sizing: border-box !important;
}

.Pub_product {
	float: left;
	display: inline-block;
	width: 513px;
	height: -webkit-fill-available;
	position: relative;
	width: 359px;
}

.Pub_product_img {
	float: left;
	display: inline-block;
	margin-right: 38px;
	position: relative;
	top: 50%;
}

.Pub_product_img img {
	width: 70px;
	height: 70px;
	margin-left: 20px;
}
</style>

</head>
<body>
	<%@ include file="Header.jsp"%>
	<div id="Pch_wrapper" class="Pch_full_wrapper">
		<div
			style="font-size: 16px; font-weight: 500; position: absolute; top: -40px; right: 0;">
			<span style="color: rgba(0, 0, 0, 0.5);">장바구니</span> <img
				src="/img/Pch_arrow.png"
				style="margin: 0 13px; vertical-align: inherit;"> <span>주문/결제</span>
			<img src="/img/Pch_arrow.png"
				style="margin: 0 13px; vertical-align: inherit;"> <span
				style="color: rgba(0, 0, 0, 0.5);">완료</span>
		</div>

		<form action="#" method="post">
			<div id="Pch_left">
				<div id="Pch_list" class="Pch_display_list">
					<div class="Pch_header">
						<div class="Pch_product" style="width: 347px;">주문상품</div>
						<div class="Pch_ea" style="font-size: 14px; text-align: center;">수량</div>
						<div class="Pch_regular"
							style="font-size: 14px; text-align: center;">판매금액</div>
						<div class="Pch_price"
							style="font-size: 14px; text-align: center;">결제금엑</div>
					</div>
					<div id="Pch_cart_all" style="display: grid;">
						<c:forEach items="${cartList}" var="cart">
							<div class="Pch_cart">
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
								<div class="Pub_ea"></div>

								<!-- 판매금액 -->
								<div class="Pub_regular">
									<p>22,800원</p>
								</div>

								<!-- 결제금액 -->
								<div class="Pub_price">
									<p>22,800원</p>
								</div>
							</div>
					</div>



					</c:forEach>

				</div>



			</div>
	</div>


	<div id="Pch_right">
		<div id="Pch_moving_div" style="top: 198px; position: fixed;"></div>


	</div>








	</form>












	</div>






	<%@ include file="Footer.jsp"%>

</body>
</html>