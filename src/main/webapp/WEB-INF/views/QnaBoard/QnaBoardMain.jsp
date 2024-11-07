<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="top" >
                    <div class="num">1</div>
                    <div class="title">
                    	<a href="/arti/board/detail">글 제목이 어디까지 길어질까요</a>
                    </div>
                    <div class="writer">철수</div>
                    <div class="date">2024-11-05</div>
                </div>
                <div class="top" >
                    <div class="num">2</div>
                    <div class="title">
                    	<a href="/arti/board">글 제목이 어디까지 길어질까요</a>
                    </div>
                    <div class="writer">영희</div>
                    <div class="date">2024-11-06</div>
                </div>
            </div>
        </div>
        <div class="board_page">
            <a href="#" class="bt first"><<</a>
            <a href="#" class="bt prev"><</a>
            <a href="#" class="num on">1</a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="bt next">></a>
            <a href="#" class="bt last">>></a>
        </div>
        <div class="bt_wrap">
            <a href="#" class="on">목록</a>
            <a href="/arti/board/write" class="on">글쓰기</a>
        </div>
    </div>

    
<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>