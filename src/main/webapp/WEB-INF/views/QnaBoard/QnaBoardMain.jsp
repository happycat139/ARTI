<%@page import="com.smhrd.Arti.Model.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/QnaBoard/QnaBoardMain.css">
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
	<c:if test="${not empty error}">
		<script>
			alert("${error}");
		</script>
	</c:if>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div class="board_wrap">
		<div class="board_title">
			<strong>문의</strong>
			<div class="bt_wrap">
				<p>문의사항을 빠르고 정확하게 안내합니다</p>
				<a href="/arti/board/write" class="on">글쓰기</a>
			</div>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
				</div>
				<c:forEach items="${boardPage}" var="board" varStatus="status">
					<div class="top">
						<div class="num">${status.index + 1}</div>
						<div class="title">
							<a href="javascript:checkPassword(${board.idx})">${board.title}</a>
						</div>
						<div class="writer">${board.writer}</div>
						<div class="date">${board.createdAt.toString().substring(0, 10)}</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<!-- Pagination -->
		<div class="pagination">
			<c:if test="${currentPage > 0}">
				<a href="?page=${currentPage - 1}">이전</a>
			</c:if>
			<c:if test="${currentPage == 0}">
				<span class="placeholder">이전</span>
			</c:if>
			<c:forEach begin="0" end="${totalPages - 1}" var="pageNum">
				<a href="?page=${pageNum}"
					class="${pageNum == currentPage ? 'active' : ''}">${pageNum + 1}</a>
			</c:forEach>
			<c:if test="${currentPage < totalPages - 1}">
				<a href="?page=${currentPage + 1}">다음</a>
			</c:if>
			<c:if test="${currentPage == totalPages - 1}">
				<span class="placeholder">다음</span>
			</c:if>
		</div>

	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />

	<script>
		function checkPassword(idx) {
			const password = prompt("비밀번호를 입력하세요:");
			if (password) {
				location.href = "/arti/board/validate?idx=" + idx
						+ "&password=" + password;
			}
		}
	</script>
</body>
</html>