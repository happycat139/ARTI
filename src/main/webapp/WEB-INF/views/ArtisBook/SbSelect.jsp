<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/StoryBook/SbSelect.css">
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
<%@ include file="SbCreateHeader.jsp" %>
<div class="SBS_page">   
    <div class="SBS_title">
        이야기를 어떻게 쓸까요?
    </div>
    <div class="SBS_Container">
    	<div class="SBS_select_box">
    		<img class="SBS_select_icon" src="/img/edit.svg" >
    		
    		<div class="SBS_select_box-title">
    			직접 쓸래요
    		</div>
    		
    		<div class="SBS_select_box-content" style="margin-top:20px;">
    			AI를 사용하지 않고 글을 써요
    		<br>
    			제목도 내용도 내가 직접 써요
    		</div>
    		<button class="SBS_select_button empty">글 편집 단계로</button>
    	</div>
    	
    	<div class="SBS_select_box">
    		<div class="SBS_tag">추천</div>
    		<img class="SBS_select-icon with-tag" src="/img/with-ai.svg" >
    		<div class="SBS_select_box-title" style="margin-top:30px;">
    			AI와 함께 쓸래요
    		</div>
    		<div class="SBS_select_box-content" style="margin-top:20px;">
    			AI와 동화책의 줄거리를 만들어요.
    		<br>
                AI 기술을 활용해서 글을 쓸 수 있어요.
    		</div>
    		<button onclick="location.href='arti/book/topic'" class="SBS_select_button filled" style="margin-top:40px; margin-right: 130px;">시작하기</button>
    	</div>
    	
    </div>
</div> 
</body>
</html>
