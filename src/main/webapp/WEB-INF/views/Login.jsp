<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/Login.css" />
</head>
<body>
<div id="root">
	<div id="content">
		<%@ include file="Header.jsp" %>

        <section class="Login-Container">
        <div class="View-Box">
			<div class="LogoWrap">
				<img src="img/ArtiLogo.png" alt="로고">
			</div>
			<div class="TitleWrap">
				<h1>로그인하고 <br> 마음의 그림을 그려봐요!</h1>
			</div>
			<div class="BtnWrap">
				<button class="kakaoLogin">카카오 로그인</button>
				<button onclick="location.href='/welcome/login'" class="emailLogin">이메일로 로그인</button>
			</div>
			<div class="OrWrap">
				<p>또는</p>
			</div>
			<div class="SnsWrap">
				<button><a href="/oauth2/authorization/google">구글 계정으로 로그인</a></button>
			</div>
			<div class="JoinWrap">
				<p>아직 회원이 아니신가요?</p>
				<button onclick="location.href='/welcome/join'">가입하기</button>
			</div>
        </div>
        </section>
        <%@ include file="Footer.jsp" %>
    </div>
</div>

</body>
</html>