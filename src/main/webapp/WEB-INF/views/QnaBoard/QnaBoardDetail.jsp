<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<div class="board_view_title">글 제목입니다</div>
				    <div class="board_view_info">
					    <dl>
						    <dt>번호</dt>
						    <dd>1</dd>
					    </dl>
					    <dl>
						    <dt>글쓴이</dt>
						    <dd>김철수</dd>
					    </dl>
					    <dl>
						    <dt>작성일</dt>
						    <dd>2024.11.06</dd>
					    </dl>
					    <dl>
						    <dt>번호</dt>
						    <dd>2</dd>
					    </dl>
					    <dl>
						    <dt>글쓴이</dt>
						    <dd>김영희</dd>
					    </dl>
					    <dl>
						    <dt>작성일</dt>
						    <dd>2024.11.06</dd>
					    </dl>
				    </div>
				        <div class="board_view_cont">
					        글 내용입니다<br />
					        글 내용입니다<br />
					        글 내용입니다<br />
				        </div>
				    <div class="bt_wrap">
            		    <a href="/arti/board" class="on">목록</a>
        		    </div>
			</div>
		</div>
	
	</div>
<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>