<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
</head>
<style>

.content-wrapper{
	display: flex;
    flex-direction: column;
    width: 1140px;
    min-height: 760px;
    margin: 0 auto;
    padding: 50px 0;
}

.p_pagetitle {
	font-size: 14px;
    color: rgba(0, 0, 0, 0.6);
}

.p_greeting {
    font-size: 22px;
    font-weight: bold;
    color: #283890;
}

.book-wrapper {
    display: flex;
    flex-wrap: wrap;
    margin: 40px 0;
    gap: 30px 21px;
}

.book_info {
    width: calc(33.3% - 15px);
    padding: 0 15px;
    height: auto;
    aspect-ratio: 1 / 1.227;
    border-radius: 20px;
    position: relative;
}

.create_book {
    width: 100%;
    height: auto;
    aspect-ratio: 1 / 1.234;
    margin: 17px auto 6px;
    padding: 10px;
    background: transparent;
    border: 2px dashed rgba(0, 0, 0, 0.15);
    border-radius: 26px;
    position: relative;
    cursor: pointer;
    display: flex;
    flex-direction: column;
}

.create_book-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: auto;
    aspect-ratio: 1 / 1;
    margin: 0 auto;
    text-align: center;
    border-radius: 15px;
    background: #FBFBFB;
}

img {
    vertical-align: middle;
    border-style: none;
}

.create_book-inner > p {
    font-size: 14px;
    line-height: 16px;
    font-weight: 600;
    margin-top: 10px;
    height: 54px;
}

.create-warning {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    gap: 7px;
    width: 100%;
    height: auto;
    aspect-ratio: 296 / 75;
    font-size: 0;
}

.create_book-warn {
    float: left;
    display: inline-block;
    margin-top: 1px;
    vertical-align: top;
}

.create_book-info {
    display: flex;
    flex-direction: column;
    justify-content: center;
    line-height: 18.82px;
    font-size: 13px;
    font-weight: 500;
    text-align: center;
    color: rgba(0, 0, 0, 0.7);
}

/* 샘플 동화책 CSS */

.book_item {
    width: 100%;
    height: auto;
    aspect-ratio: 325 / 398;
    border-radius: 5.775% 1.8% 5.775% 4.975%;
    background: url(/img/book_item.png);
    background-size: cover;
    background-position: center;
    background-size: calc(100% + 1.5px);
    margin: 17px auto 6px;
    padding: 7.8125%;
    position: relative;
    box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.15);
}

.tag_icon {
    position: absolute;
    top: 2px;
    left: 22px;
}

.coverimg-top-empty {
    width: 100%;
    height: auto;
    aspect-ratio: 270 / 43;
}

.booktitle-top-empty {
    width: 100%;
    height: auto;
    aspect-ratio: 270 / 15;
}

.book_item p {
    width: 100%;
    height: auto;
    aspect-ratio: 270 / 39;
    margin: 0 auto;
    padding: 0 5px;
    font-size: 14px;
    font-weight: 600;
    line-height: 16px;
}

.book_item-coverimg img {
	margin-left: 17px;
	margin-top: 15px;
}

</style>
<body>
<%@ include file="SbHeader.jsp" %>
<div class="content-wrapper">
	<p class="p_pagetitle">나의 동화책</p>
	<%
    	// 세션에서 로그인 상태 확인
    	User user2 = (User) session.getAttribute("user");
    	if (user2!= null) {
    %>
    	<p class="p_greeting">안녕하세요, <%=user.getNickname() %>님 </p>
    <%
    	} else {
    %>
		<p class="p_greeting">로그인 후 이용해주세요.</p>
	<%
    	} 
    %>
	
	<div class="book-wrapper">
	
		<div class="book_info">
			<div class="create_book">
				<div class="create_book-inner">
					<img src="/img/sb_create.png" style="width:21px;" alt="추가버튼" onclick="location.href='/arti/book/start'">
					<p style="text-align:center;">
						새로운 스토리
					<br>
						만들기
					</p>
				</div>
				<div class="create-warning">
					<img src="/img/sb_warning.png" class="create_book-warn">
					<div class="create_book-info">
					보유한 크레딧으로 AI그림이나
					<br>
					스토리를 생성할 수 있습니다.
					</div>
				</div>
			</div>
		</div>
		
		<!-- sample 동화책 -->
		<div class="book_info">
			<div class="book_item">
				<div class="tag_icon">
					<img src="/img/tag-sample.png" style="width:64px;">
				</div>
				<div class="coverimg-top-empty"></div>
				<div class="book_item-coverimg"><img src="/img/file.png"></div>
				<div class="booktitle-top-empty"></div>
				<p>오빈의 행복 라이프</p>
			</div>
			<div class="book_date"></div>
			<div class="book_info-hover"></div>
		</div>
		
		<!-- sample 동화책 -->
		<div class="book_info">
			<div class="book_item">
				<div class="tag_icon">
					<img src="/img/tag-sample.png" style="width:64px;">
				</div>
				<div class="coverimg-top-empty"></div>
				<div class="book_item-coverimg"><img src="/img/night.png"></div>
				<div class="booktitle-top-empty"></div>
				<p>오빈의 흑심</p>
			</div>
			<div class="book_date"></div>
			<div class="book_info-hover"></div>
		</div>
		
		
	</div>
	
</div>
<%@ include file="SbFooter.jsp" %>
</body>
</html>