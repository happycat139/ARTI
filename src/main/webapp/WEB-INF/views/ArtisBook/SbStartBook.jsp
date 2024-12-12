<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/StoryBook/SbStartBook.css">
<link rel="icon" href="/img/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // 입력란에 입력을 하면 입력 내용이 출력됨
    $("#SBC_input-field").keyup(function() {
    	
    	// 입력된 값 가져오기
        const writerName = $("#SBC_input-field").val().trim();

        // 입력값이 비어 있으면 기본 메시지 설정
        if (writerName === "") {
            $("#SBC_name").text("안녕하세요 ___ 작가님!");
        } else {
            $("#SBC_name").text("안녕하세요 " + writerName + " 작가님!");
        }
    });
});
</script>
</head>
<body>
    <%@ include file="SbCreateHeader.jsp" %>

    <div class="SBC_container">
        <div class="SBC_index-page">
        <form action="/arti/book/select" method="get">
            <div id="SBC_name" class="SBC_title">안녕하세요 ___ 작가님!</div>
            <input id="SBC_input-field" class="SBC_writer" name="author" placeholder="작가님의 이름을 알려주세요." autocomplete="off" required>
            <button type="submit" id="SBC_next-button" class="SBC_submit-button index">다음</button>
        </form>
        </div>
    </div>
</body>
</html>
