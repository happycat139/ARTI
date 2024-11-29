<%@page import="com.smhrd.Arti.Model.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
				<div class="top" id="qna_top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="answer">답변여부</div>
				</div>
				<c:forEach items="${boardPage}" var="board" varStatus="status">
					<div class="top">
						<div class="num">${currentPage * 10 + status.index + 1}</div>
						<div class="title">
							<c:choose>
								<c:when test="${fn:length(board.qna_title) > 20}">
									<a href="javascript:void(0)"
										onclick="checkPassword(${board.qna_idx}, '${board.qna_nickname}', '${board.qna_name != null && board.qna_name.trim() != '' ? board.qna_name : ''}')">
										${fn:substring(board.qna_title, 0, 20)}... </a>
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0)"
										onclick="checkPassword(${board.qna_idx}, '${board.qna_nickname}', '${board.qna_name != null && board.qna_name.trim() != '' ? board.qna_name : ''}')">
										${board.qna_title} </a>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="writer">
							<c:choose>
								<c:when test="${board.qna_nickname != null}">
									<c:choose>
										<c:when test="${fn:length(board.qna_nickname) > 5}">
                    						${fn:substring(board.qna_nickname, 0, 5)}...
              					</c:when>
										<c:otherwise>
                    				${board.qna_nickname}
                				</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${fn:length(board.qna_name) > 5}">
                    					${fn:substring(board.qna_name, 0, 5)}...
                					</c:when>
										<c:otherwise>
                    				${board.qna_name}
                				</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="date">${board.qnaDt.toString().substring(0, 10)}</div>
						<div class="answer">
							<img
								src="/img/${board.isAnswered() ? 'board_yes.png' : 'board_no.png'}"
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
    // 관리자 여부를 설정
    const isAdmin = "${sessionScope.user != null && sessionScope.user.role == 'ADMIN' ? 'true' : 'false'}";
    // 현재 로그인한 사용자의 닉네임 (없으면 null)
    const loggedInNickname = "${sessionScope.user != null ? sessionScope.user.nickname : ''}";
    
    console.log("isAdmin:", isAdmin);
    console.log("loggedInNickname:", loggedInNickname);
    
    
    function checkPassword(idx, writerNickname, writerName) {
        console.log("게시글 번호:", idx);
        console.log("작성자 닉네임:", writerNickname || "(회원 닉네임 없음)");
        console.log("작성자 이름 (비회원):", writerName || "(비회원 이름 없음)");

        // 비회원 여부 확인
        const isAnonymous = writerName && writerName.trim().length > 0;
        console.log("비회원 여부 (isAnonymous):", isAnonymous);

        if (isAdmin === 'true') {
            console.log("관리자 접근");
            location.href = "/arti/board/validate?qna_idx=" + idx + "&qna_pw=";
            return;
        }

        if (writerNickname && loggedInNickname === writerNickname) {
            // 작성자가 회원이고, 현재 로그인된 회원이 작성자일 때만
            console.log("작성자 본인 접근");
            location.href = "/arti/board/validate?qna_idx=" + idx + "&qna_pw=";
            return;
        }

        if (!writerNickname && isAnonymous) {
            // 비회원 작성글일 경우
            console.log("비회원 작성글 - 비밀번호 입력창 표시");
            const password = prompt("비밀번호를 입력하세요:");
            if (password && password.trim() !== "") {
                console.log("비밀번호 입력됨:", password);
                location.href = "/arti/board/validate?qna_idx=" + idx + "&qna_pw=" + encodeURIComponent(password);
            } else {
                console.log("비밀번호 입력 취소 또는 빈 값 입력");
                alert("비밀번호를 입력해야 합니다.");
            }
            return;
        }

        console.log("접근 금지 - 작성자 외 접근 시도");
        alert("작성자만 접근할 수 있습니다.");
    }








    
</script>





</body>
</html>