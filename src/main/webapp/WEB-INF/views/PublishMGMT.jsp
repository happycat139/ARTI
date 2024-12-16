<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
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
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.content-wrapper {
	min-height: calc(100vh - 180px);
	width: 80%;
	margin: 50px auto;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 30px;
	color: #333;
}

.mgmt_title {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 30px;
}

table th, table td {
	border: 1px solid #ccc;
	padding: 20px;
	text-align: left;
}

table th {
	background-color: #f4f4f4;
	font-weight: bold;
}

table tr:nth-child(even) {
	background-color: #f9f9f9;
}

table tr:hover {
	background-color: #f1f1f1;
}

/* page-wrapper 관련 CSS */
#page-wrapper {
	display: flex;
	flex-direction: row;
	justify-content: center;
	gap: 6px;
	height: 40px;
	margin-bottom: 128px;
	margin-top: 60px;
}

.page-item {
	width: 40px;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	font-weight: 500;
	text-align: center;
	color: rgba(0, 0, 0, 0.5);
	cursor: pointer;
}

.page-item.active {
	color: blue;
	font-weight: 700;
	font-style: normal;
}

.page-item>img {
	vertical-align: middle;
	border-style: none;
}
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="Header.jsp"%>


	<div class="content-wrapper">
		<h1 class="mgmt_title">주문 관리</h1>

		<table>
			<thead>
				<tr>
					<th>출판 ID</th>
					<th>생성일</th>
					<th>배송지명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>총 가격</th>
					<th>배송 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="publish" items="${publishes}" varStatus="status">
					<c:if test="${status.index < 8}">
						<tr>
							<td>${publish.pub_idx}</td>
							<td>${publish.createdAt}</td>
							<td>${publish.pub_sender}</td>
							<td>${publish.sender_phone}</td>
							<td>${publish.address}</td>
							<td>${publish.pub_email}</td>
							<td>${publish.totalPrice}원</td>
							<td>배송 완료</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>







		<div id="page-wrapper">
			<div id="first" class="page-item" style="height: 20px;"
				onclick="location.href='mgmt?page=1'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_first.png">
			</div>
			<div id="prev" class="page-item" style="height: 20px;"
				onclick="location.href='mgmt?page=${currentPage > 1 ? currentPage - 1 : 1}'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_prev.png">
			</div>

			<!-- 페이지 번호 반복 -->
			<c:forEach begin="1" end="${totalPages}" var="page">
				<c:choose>
					<c:when test="${page eq currentPage}">
						<div id="" class="page-item active">${page}</div>
					</c:when>
					<c:otherwise>
						<div id="" class="page-item"
							onclick="location.href='mgmt?page=${page}'">${page}</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<div id="next" class="page-item" style="height: 20px;"
				onclick="location.href='mgmt?page=${currentPage < totalPages ? currentPage + 1 : totalPages}'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_next.png">
			</div>
			<div id="last" class="page-item" style="height: 20px;"
				onclick="location.href='mgmt?page=${totalPages}'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_last.png">
			</div>
		</div>
	</div>


	<!-- Footer -->
	<%@ include file="Footer.jsp"%>
</body>
</html>
