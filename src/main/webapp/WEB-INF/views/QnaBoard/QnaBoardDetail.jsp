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
						<dd class="answer">
							<img
								src="/img/${board.isAnswered ? 'board_yes.png' : 'board_no.png'}"
								alt="답변 여부">
						</dd>
					</dl>
					<button onclick="deletePost(${board.idx})">삭제</button>
				</div>
				<div class="board_view_cont">${board.content}</div>

				<!-- 답변 내용 표시 -->
				<c:if test="${board.isAnswered}">
					<div class="admin_answer">
						<strong>관리자 답변:</strong>
						<p>${board.answer}</p>
					</div>
				</c:if>



				<div class="bt_wrap">
					<a href="/arti/board/main" class="on">목록</a>
				</div>
			</div>
		</div>
	</div>


	<!-- 관리자 답변 폼 -->
	<c:if test="${sessionScope.user.role == 'ADMIN'}">
		<div class="admin_reply_wrap">
			<form id="adminReplyForm">
				<input type="hidden" name="idx" value="${board.idx}">
				<textarea name="replyContent" placeholder="답변 내용을 입력하세요." required></textarea>
				<div class="button_wrap">
					<button type="submit">${board.isAnswered ? '답변변경' : '답변하기'}</button>
				</div>
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
    
    
 // 폼 제출 이벤트를 가로챔
    document.getElementById("adminReplyForm").addEventListener("submit", function (e) {
    e.preventDefault(); // 기본 폼 제출 동작 막기

    const idx = document.querySelector("input[name='idx']").value;
    const replyContent = document.querySelector("textarea[name='replyContent']").value;

    if (!replyContent.trim()) {
        alert("답변 내용을 입력하세요.");
        return;
    }

    // AJAX 요청
    $.ajax({
        url: "/arti/board/reply",
        type: "POST",
        data: {
            idx: idx,
            replyContent: replyContent
        },
        success: function (response) {
            alert(response.message);

         // 기존 답변이 있는지 확인
            const existingAnswerDiv = document.querySelector(".admin_answer");
            if (existingAnswerDiv) {
                // 기존 답변 내용 수정
                existingAnswerDiv.innerHTML = "<strong>관리자 답변:</strong><p>" + response.answer + "</p>";
            } else {
                // 새 답변 추가
                const answerDiv = document.createElement("div");
                answerDiv.className = "admin_answer"; // 클래스 추가
                answerDiv.innerHTML = "<strong>관리자 답변:</strong><p>" + response.answer + "</p>";
                document.querySelector(".board_view").appendChild(answerDiv);
            }

            // 답변 여부 이미지 업데이트
            document.querySelector(".answer img").src = "/img/board_yes.png";
            
            // "답변달기" 버튼의 텍스트를 "답변 변경"으로 변경
            const submitButton = document.querySelector("#adminReplyForm button[type='submit']");
            if (submitButton) {
                submitButton.textContent = "답변변경";
            }
        },
        error: function (xhr) {
            alert("답변 등록/수정에 실패했습니다.");
            console.error(xhr);
        }
    });
});



</script>
</body>
</html>