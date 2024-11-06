<%@page import="com.smhrd.Arti.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="/css/SbHeader.css" />	
</head>
<body>
		<header class="Top-Container">
            <div id="top-content">
                <a href="/"><img src="/img/ArtiLogo.png"></a>
                <div id="menu">
                    <div class="menu-container">
                        <a href="#">나의 동화책</a>
                        <a href="#">공개 갤러리</a>
                        <a href="#">문의하기</a>
                    </div>
                    <div class="AccountContainer">
                    <%
                        // 세션에서 로그인 상태 확인
                        User user = (User) session.getAttribute("user");
                        if (user != null) {
                    %>
                        <!-- 로그인 상태일 때 프로필 표시 -->
                        <div class="profile-btn" onclick="location.href='/profile'">
                            <img src="/img/default-profile.png" alt="프로필 이미지" class="rounded-profile" />
                            <a href="#"><%=user.getNickname() %></a>
                        </div>
                    <%
                        } else {
                    %>
                    	<div class="auth-button" onclick="location.href='/welcome'">
                        	<a href="/welcome">로그인</a>
                        <span>|</span>
                        	<a href="#">회원가입</a>
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