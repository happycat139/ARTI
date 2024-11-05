<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
</head>
<style>
@font-face {
    font-family: 'STUNNING-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, menu, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, main, menu, nav, output, ruby, section, summary, time, mark, audio, video {
	margin: 0px;
	padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
}
		
h1, h2, h3, h4, h5, h6, strong, b {
    font-weight: 700;
}
        
select, input, textarea, a {
    outline: none;
}
		
textarea, input {
    appearance: none;
}
		
* {
	box-sizing: border-box;
}

.Test-Container {
    -webkit-box-flex: 1;
    flex-grow: 1;
    padding: 20px 0px 206px;
}

.Test-Container > div {
    width: 1400px;
    margin: 0px auto;
}

.View-Box {
    transition: padding 250ms ease-in-out;
    padding: 68px;
}

.TM_Header {
    padding-bottom: 28px; 
    padding-left: 20px;       
}

.TM_Header > h1 {
    color: rgb(34, 34, 34);
    font-size: 30px;
    line-height: 40px;
    letter-spacing: -0.5px;
    font-weight: 700;
}

.TM_Header > p.Pf_EmailContent {
	color: gray;
	margin-top: 15px;
	font-family: 'STUNNING-Bd'; 
} 

.TM-Container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 40px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 40px;
     overflow: hidden; 
}

.TM-Content-Container {
    flex: 1;
    display: flex;
    
}


.TM-Left-Section {
	flex: 1; /* 왼쪽 영역이 더 넓어지도록 */
	
}

.TM-Left-Menu {
    padding:30px 10px 30px 30px;
}

.TM-Left-Menu a {
	display: block;
    flex: 0 0 auto;
    color: rgb(34, 34, 34);
    font-size: 17px;
    line-height: 26px;
    font-weight: 400;
    border-radius: 8px;
    user-select: none;
    background-color: rgb(255, 255, 255);
	font-family: 'STUNNING-Bd';
	padding: 20px 0 15px 10px;
	
}

.TM-Left-Menu a:hover {
    background-color: #bef5f7;
    color: #4781ed;
}

.TM-Left-Menu a:focus {
    background-color: #bef5f7;
    color: #4781ed;
}

.TM-Right-Section {
	flex: 5;
    display: flex;
    align-items: left;
    justify-content: left;
    background-color: #F9F9F9 ;
    padding:20px;
    width: 80px;
    height: 600px;
}


</style>
<body>

<%@ include file="Header.jsp" %>
 <section class="Test-Container">
            <div class="View-Box">
            
                <header class="TM_Header">
                    <h1>ARTI 심리검사</h1>
                    <p class="Pf_EmailContent">내 아이의 마음을 알아보세요</p>
                </header>
                
               <div class="TM-Container">
                    <div class="TM-Content-Container">
                    
                        <div class="TM-Left-Section">
                        	<div class="TM-Left-Menu">
								<a href="javascript:void(0);" onclick="loadContent('${pageContext.request.contextPath}/arti/test/info')">HTP검사 소개</a> 
								<a href="javascript:void(0);" onclick="loadContent('${pageContext.request.contextPath}/arti/test/method')">HTP검사 방법</a>
								<a href="javascript:void(0);" onclick="loadContent('${pageContext.request.contextPath}/arti/test/htp')">HTP검사 시작</a>
								<a href="javascript:void(0);" onclick="loadContent('${pageContext.request.contextPath}/arti/test/faq')">자주묻는질문</a>
                        	</div>
                        </div>
                        
                        <div class="TM-Right-Section" id="content-area">
                        	<img src="/img/ArtiLogo.png">
                        	<!-- 동적 컨텐츠 공간 -->
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
<%@ include file="Footer.jsp" %>

<script>

/* 왼쪽 메뉴에 따라 오른쪽 화면 호출 */
function loadContent(url) {
    fetch(url)
        .then(response => response.text())
        .then(data => {
            document.getElementById('content-area').innerHTML = data;
        })
        .catch(error => console.error('화면 호출 에러:', error));
}

</script>
</body>
</html>