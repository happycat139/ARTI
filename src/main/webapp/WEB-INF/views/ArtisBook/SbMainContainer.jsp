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
    width: 1600px;
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
    color: #6133E2;
    font-size: 28px;
    line-height: 40px;
    letter-spacing: -1px;
    font-weight: 700;
}

.TM_Header > p.Pf_EmailContent {
	margin-top: 15px;
} 

</style>
<body>
 <section class="Test-Container">
            <div class="View-Box">
            	<div class="">
            		<div class="TM_Header">
            			<h1>
            				나만의 동화책을 직접 만드는 경험 
            			<br>
							AI시대 교육 트렌드
						</h1>
            		</div>
            		<div class="Pf_EmailContent">
            			<p> 
            				AI 도움으로 나만의 (한글, 영어) 동화책을 만들어 가면서, 자연스럽게 최신 생성형 
            			<br>
							AI 기술도 체험할 수 있고, AI 이해도와 성취감을 높여줄 수 있습니다.
						</p>
            		</div>
            		<br>
            		<div class="btn"><img><a href="/arti/book/mypage">동화책 만들기</a></div>
                
               </div>
            </div>
</section>
</body>
</html>