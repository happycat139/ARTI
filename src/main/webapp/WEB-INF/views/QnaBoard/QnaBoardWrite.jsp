<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/QnaBoard/QnaBoardWrite.css">
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div class="board_wrap">
		<div class="board_title">
			<strong>글쓰기</strong>
		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="board_write_title">
					<dl>
						<dt>제목</dt>
						<dd><input type="text" placeholder="제목 입력" name="title" /></dd>
					</dl>
				</div>
				<div class="board_write_info">
					<dl>
						<dt>글쓴이</dt>
						<dd><input type="text" placeholder="글쓴이 입력"  name="writer" /></dd>
					</dl>
					<dl>
						<dt>비밀번호</dt>
						<dd><input type="password" placeholder="비밀번호 입력" name="pw" /></dd>
					</dl>
				</div>
				<div class="board_write_cont">
					<textarea placeholder="내용 입력"></textarea>
				</div>
			</div>
		</div>
		
		<div class="bt_wrap">
			<a href="#" class="on">등록</a>
			<a href="#">취소</a>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>