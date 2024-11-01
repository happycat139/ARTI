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
                        <a href="#">심리검사</a>
                        <a href="#">스케치북</a>
                        <a href="#">분석결과</a>
                    </div>
                    <div class="AccountContainer">
                    	<div class="auth-button" onclick="location.href='/welcome'">
                        	<a href="#">로그인</a>
                        <span>|</span>
                        	<a href="#">회원가입</a>
                    	</div>
                    </div>
                </div>
            </div>
        </header>
</body>
</html>