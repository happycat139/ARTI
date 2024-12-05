<%@page import="com.smhrd.Arti.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="/css/Header.css" />
</head>
<body>
	<header class="Top-Container">
		<div id="top-content">
			<a href="/"><img src="/img/ArtiLogo.png"></a>
			<div id="menu">
				<div class="menu-container">
					<a href="/arti/test">심리검사</a> <a href="/arti/storybook/main">스케치북</a>
					<a href="#">게시판</a> <a href="/arti/board/main">문의하기</a>
				</div>

				<div class="AccountContainer">
					<%
					User user = (User) session.getAttribute("user");
					// 세션에서 로그인 상태 확인
					if (user != null) {
					%>
					
					<a href="/arti/coin"><img src="/img/ArtiCoin.png" id="articoin"></a>
					
					<!-- 로그인 상태일 때 프로필 표시 -->
					<div class="profile-btn" onclick="location.href='/profile'">
						<img
							src="<%=user != null && user.getProfile_img() != null ? user.getProfile_img() : "/img/default-profile.png"%>"
							alt="프로필 사진" class="rounded-profile"> <a href="#"><%=user.getNickname()%></a>
					</div>
					<%
					} else {
					%>
					<div class="auth-button" onclick="location.href='/welcome'">
						<a href="/welcome">로그인</a> <span>|</span> <a href="#">회원가입</a>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</header>
</body>
</html>