<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

		<div class="qna_write_notice">
			-글 작성 시 제목, 글쓴이 또는 본문 내에 <strong> <span class="qna-cont-p">개인정보(주민등록번호,
					연락처, 이메일 등)가 포함되어 게시하지 않도록 유의</span>
			</strong> 하시기 바랍니다. <span class="qna-cont-b">개인정보가 노출되면 악용될 수 있으며, 특히
				타인의 개인정보가 노출될 경우, </span> <span class="qna-cont-ulb">개인정보보호법에 의해 처벌</span>
			<span class="qna-cont-b">받을 수 있습니다. </span>
		</div>


		<div class="short_border"></div>
		<form action="new" method="post">
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="board_write_title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" placeholder="제목 입력" maxlength="30"
									name="qna_title" required />
							</dd>
						</dl>
					</div>
					<c:if test="${sessionScope.user == null}">
						<div class="board_write_info">
							<dl>
								<dt>글쓴이</dt>
								<dd>
									<input type="text" placeholder="글쓴이 입력" maxlength="10"
										name="qna_name" required />
								</dd>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<dd>
									<input type="password" placeholder="비밀번호 입력" name="qna_pw"
										required />
								</dd>
							</dl>
						</div>
					</c:if>
					<div class="board_write_cont">
						<textarea placeholder="내용 입력" name="qna_content" required></textarea>
					</div>
				</div>
			</div>

			<div class="bt_wrap">
				<input type="submit" class="on" value="등록"> <a href="main"
					id="write_x">취소</a>
			</div>
		</form>
	</div>


	<script>
		document.getElementById('write_x').addEventListener('click',
				function(event) {
					// 이동을 일단 막기 위해 기본 동작을 방지
					event.preventDefault();

					// 경고창에서 확인을 누르면 페이지로 이동
					if (confirm('이 페이지를 나가시겠습니까? 작성하던 게시글이 사라집니다.')) {
						window.location.href = this.href; // href 속성으로 페이지 이동
					}
				});
	</script>

	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>