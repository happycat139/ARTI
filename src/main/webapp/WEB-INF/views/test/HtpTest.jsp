<%@page import="com.smhrd.Arti.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

@font-face {
    font-family: 'STUNNING-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

.TI_Header > h1 {
    color: rgb(34, 34, 34);
    font-size: 20px;
    line-height: 40px;
    letter-spacing: -0.5px;
    font-family: 'STUNNING-Bd'; 
}

.TI_SubContent {
	color: gray;
	margin-top: 5px;
	font-family: 'STUNNING-Bd'; 
}

.TI-Content-Container {
	width: 1010px;
	height: 480px;
    margin-top: 20px;
    padding: 15px 10px 10px 20px;
    border: 1px solid #ddd; /* 테두리 설정 */
    border-radius: 15px; /* 둥근 모서리 설정 */
    background-color: #ffffff; /* 배경색 설정 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 살짝 그림자 효과 */
    
}

.TI-Content-Container > p {
    color: rgb(34, 34, 34);
    font-size: 17px;
    line-height: 40px;
    letter-spacing: 0px;
    font-family: 'STUNNING-Bd'; 
    
}

.TI2 {
	padding-top:5px;
}

</style>
<body>

<% User user = (User) session.getAttribute("user"); %>

<section class="TestInfo-Container">
	<div class="TI-View-Box">
         <header class="TI_Header">
              <h1>HTP검사</h1>
              <p class="TI_SubContent">내 아이의 마음을 확인해요</p>
         </header>
                
         <form action="/htp/upload" method="post" enctype="multipart/form-data">
    		<div class="TI-Content-Container">
        		<input type="file" name="file" id="testImageInput" accept="image/*" required><br>
        		<button type="submit">이미지 업로드</button>
    		</div>
		</form>
	</div>
</section>
</body>
</html>