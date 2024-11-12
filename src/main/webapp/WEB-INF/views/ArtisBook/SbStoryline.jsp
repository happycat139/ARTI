<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/StoryBook/SbTopic.css">
</head>
<body>
<%@ include file="SbCreateHeader.jsp" %>
<div class="SBT_page">   
    <div class="SBT_title">
        생성된 줄거리
    </div>
    <div class="SBT_story-content">
        <!-- 컨트롤러에서 전달받은 줄거리 표시 -->
        ${storyline}
    </div>
    <button onclick="window.location.href='/storyInputPage.jsp'">다시 생성하기</button>
</div>
</body>
</html>