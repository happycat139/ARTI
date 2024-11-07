<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/StoryBook/SbTopic.css">
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
<%@ include file="SbCreateHeader.jsp" %>
<div class="SBT_page">   
    <div class="SBT_title">
        떠오르는 스토리를 자유롭게 적어주세요.
    </div>
    <div class="SBT_Subtitle">
        ARTI가 적은 내용을 토대로 줄거리를 만들어드려요.
    </div>
    <textarea class="SBT_input-field" placeholder="동화책의 내용을 적어주세요."></textarea>
	<div class="SBT_EX-content">
		예시1) 소피아가 신비로운 마법의 숲을 탐험하며 친구들과 함께 숲을 지켜내는 이야기
		<br>
		예시2) 등장인물 : 빨간머리 앤 줄거리 : 앤이 친구 줄리아와 함께 숲으로 놀러간다.
		<br>
		예시3) 권선징악을 주제로 하고 주인공은 고양이가 나쁜 악당을 무찔렀으면 좋겠어
	</div>
	<button class="SBT_request-button">줄거리 생성하기</button>
</div> 
</body>
</html>
