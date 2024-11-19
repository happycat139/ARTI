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
			<p>문의사항을 빠르고 정확하게 안내합니다</p>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="answer">답변여부</div>
				</div>
				<c:forEach items="${boardPage}" var="board" varStatus="status">
					<div class="top">
						<div class="num">${status.index + 1}</div>
						<div class="title">
							<a href="javascript:checkPassword(${board.idx})">${board.title}</a>
						</div>
						<div class="writer">${board.writer}</div>
						<div class="date">${board.createdAt.toString().substring(0, 10)}</div>
						<div class="answer">
							<img
								src="/img/${board.isAnswered ? 'board_yes.png' : 'board_no.png'}"
								alt="답변 여부">
						</div>
					</div>
				</c:forEach>

			</div>
		</div>

		<!-- Pagination -->

		<div class="pagination_wrap">
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

			<!-- 글쓰기 버튼 -->
			<div class="bt_wrap">
				<a href="/arti/board/write" class="on">글쓰기</a>
			</div>
		</div>





	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		// 관리자 여부를 설정 (JSP에서 값을 렌더링)
		const isAdmin = "${sessionScope.user != null && sessionScope.user.role == 'ADMIN' ? 'true' : 'false'}";

		function checkPassword(idx) {
			if (isAdmin === 'true') {
				// 관리자는 비밀번호 입력 없이 검증 경로로 이동
				location.href = "/arti/board/validate?idx=" + idx
						+ "&password=";
			} else {
				// 일반 사용자는 비밀번호 입력창 표시
				const password = prompt("비밀번호를 입력하세요:");
				if (password) {
					location.href = "/arti/board/validate?idx=" + idx
							+ "&password=" + password;
				}
			}
		}
	</script>



</body>
</html>