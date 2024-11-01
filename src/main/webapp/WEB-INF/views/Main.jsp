<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/Header.css" />
<style>
	
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, menu, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, main, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0px;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section {
    display: block;
}
    
select, input, textarea, a {
    outline: none;
}

input, textarea {
    user-select: text;
}

textarea, input {
    appearance: none;
}

img {
    shape-rendering: geometricprecision;
}

* {
    box-sizing: border-box;
}

h1, h2, h3, h4, h5, h6, strong, b {
    font-weight: 700;
}

#root {
 	width: 100%;
 	height: 100%;
}
 
#content {
 	-webkit-box-flex: 1;
 	flex-grow: 1;
 	display: flex;
 	flex-direction: column;
 	-webkit-box-pack: justify;
 	justify-content: space-between;
 	min-width: 1200px;
 	min-height: calc(var(--vh, 1vh)* 100);
 	position: relative;
}


</style>
</head>
<body>
<div id="root">
	<div id="content">
		<%@ include file="Header.jsp" %>
		<%@ include file="MainContainer.jsp" %>
		<%@ include file="SubContainer.jsp" %>
        <div class="MainWrap1"></div>
        <div class="MainWrap2"></div>
        <div class="MainWrap3"></div>
        <div class="MainWrap4"></div>
        
    </div>
</div>
</body>
</html>