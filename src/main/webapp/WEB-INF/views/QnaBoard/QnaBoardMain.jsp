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
				</div>
				<c:forEach items="${boardList}" var="board">
					<div class="top">
						<div class="num">${board.idx}</div>
						<div class="title">
							<a href="/arti/board/detail/${board.idx}">${board.title}</a>
						</div>
						<div class="writer">${board.writer}</div>
						<div class="date">${board.created_at.toString().substring(0, 10)}</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<div class="board_page">
			<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
			<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
				href="#" class="num">3</a> <a href="#" class="bt next">></a> <a
				href="#" class="bt last">>></a>
		</div>
		<div class="bt_wrap">
			<a href="#" class="on">목록</a> <a href="/arti/board/write" class="on">글쓰기</a>
		</div>
	</div>
	



	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>