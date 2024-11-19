<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/QnaBoard/QnaBoardDetail.css">
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div class="board_wrap">
		<div class="board_title">
			<strong>문의</strong>
			<p>문의사항을 빠르고 정확하게 안내합니다</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="board_view_title">${board.title}</div>
				<div class="board_view_info">
					<dl>
						<dt>번호</dt>
						<dd>${board.idx}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${board.writer}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${board.createdAt.toString().substring(0, 10)}</dd>
					</dl>
					<dl>
						<dt>답변여부</dt>
						<dd class="answer"><img
								src="/img/${board.isAnswered ? 'board_yes.png' : 'board_no.png'}"
								alt="답변 여부"></dd>
					</dl>
					<button onclick="deletePost(${board.idx})">삭제</button>
				</div>
				<div class="board_view_cont">${board.content}</div>
				<div class="bt_wrap">
					<a href="/arti/board/main" class="on">목록</a>
				</div>
			</div>
		</div>
	</div>


	<!-- 관리자 답변 폼 -->
	<c:if test="${sessionScope.user.role == 'ADMIN'}">
		<div class="admin_reply_wrap">
			<form id="adminReplyForm" action="/arti/board/reply" method="post">
				<input type="hidden" name="boardIdx" value="${board.idx}">
				<textarea name="replyContent" placeholder="답변 내용을 입력하세요." required></textarea>
				<button type="submit">답변하기</button>
			</form>
		</div>
	</c:if>










	<jsp:include page="/WEB-INF/views/Footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    function deletePost(idx) {
        if (confirm("게시글을 삭제하시겠습니까?")) {
            $.ajax({
                url: `/arti/board/delete/${idx}`,
                type: 'DELETE',
                success: function(response) {
                    alert("게시글이 삭제되었습니다.");
                    location.href = "/arti/board/main";
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                    alert("게시글 삭제에 실패했습니다.");
                }
            });
        }
    }
</script>
</body>
</html>