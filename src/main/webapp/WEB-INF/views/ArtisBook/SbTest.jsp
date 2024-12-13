<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
</head>
<style>

.HtpMainSec {
	position: relative;
}

.MainSec {
	display: flex;
    flex-flow: row wrap;
}

/* 왼쪽 섹션 */

.MainSec .InfoSec > p {
    text-align: center;
}

.InfoSec {
    position: relative;
    width: 39.0625%;
    padding-top: 205px;
    box-sizing: border-box;
}

.InfoSec .Logo {
	margin-bottom: 32px;
    font-size: 3.556em;
    font-family: "ivymode-variable", sans-serif;
    font-variation-settings: "ital" 0, "wght" 300;
    line-height: 1;
    letter-spacing: 0;
}

.MainSec .InfoSec .Logo, .MainSec .InfoSec .info_txt {
    color: #565656;
}

.MainSec .InfoSec .Logo > em {
    display: block;
    font-size: 2em;
    font-style: normal;
}

.MainSec .InfoSec .info_txt {
    font-size: 1.222em;
    font-weight: 500;
    font-family: "Spoqa Han Sans Neo", sans-serif;
    letter-spacing: -.05em;
    line-height: 1.273;
}

/* 오른쪽 섹션 */
.ListSec {
    display: flex;
    flex-flow: row wrap;
    flex: 1 1 0;
}

.ListSec > a {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    background-repeat: no-repeat;
    background-position: right bottom;
    width: 50%;
    min-height: 400px;
    padding: 60px;
    box-sizing: border-box;
}

/* 리스트 개별 CSS */

.ListSec > a.List01 {
    background-image: url(#);
    background-color: black;
}

.ListSec > a.List02 {
    background-image: url(#);
    background-color: gray;
}

.ListSec > a.List03 {
    background-image: url(#);
    background-color: navy;
}

.ListSec > a.List04 {
    background-image: url(#);
    background-color: orange; 
}

/* 리스트 공통 CSS */

.ListSec > a .List_txt_box {
    width: 100%;
}

.ListSec > a span {
    display: block;
    color: #fff;
    letter-spacing: -.05em;
    line-height: 1.25;
}

.ListSec > a .List_Title {
    margin-bottom: 10px;
    font-size: 1.778em;
    font-weight: 700;
}

.ListSec > a .List_SubTitle {
    font-size: 1.111em;
    font-weight: 500;
}

.ListSec > a .List_btn {
    background-color: #fff;
    border-radius: 35px;
    width: 138px;
    padding: 15px 25px 12px;
    color: #000;
    font-size: .889em;
    font-family: "ivymode-variable", sans-serif;
    font-variation-settings: "ital" 0, "wght" 400;
    letter-spacing: .03em;
    line-height: 1;
    text-align: center;
    box-sizing: border-box;
}




</style>
</head>
<body>
<!-- Header -->
<%@ include file="SbHeader.jsp"%>

<!-- Section -->
<section class="HtpMainSec">
<div>
	<div class="MainSec">
		
		<!-- 왼쪽 섹션 -->
		<div class="InfoSec">
			<p class="Logo">
				<em>ARTI</em>
				Services
			</p>
			<p class="info_txt">
				ARTI와 AI가 만나 
			<br>
				새로운 도전을 합니다			
			</p>
		</div>
		
		<!-- 오른쪽 섹션 -->
		<div class="ListSec">
			<a class="List01">
				<span class="List_txt_box">
					<span class="List_Title">
						HTP검사
					</span>
					<span class="List_SubTitle">
						아이가 그린 특정 그림을 보고
					<br> 
						ARTI가 분석해드려요
					</span>
				</span>
				<span class="List_btn">
					More View
				</span>
			</a>
			<a class="List02">
			    <span class="List_txt_box">
					<span class="List_Title">
						미술심리분석
					</span>
					<span class="List_SubTitle">
						아이가 그린 그림을 보고
					<br> 
						AI가 분석해드려요
					</span>
				</span>
				<span class="List_btn">
					More View
				</span>
			</a>
			<a class="List03">
				<span class="List_txt_box">
					<span class="List_Title">
						동화 생성
					</span>
					<span class="List_SubTitle">
						동화생성은 어떠신가요?
					<br> 
						ARTI가 생성해드려요
					</span>
				</span>
				<span class="List_btn">
					More View
				</span>
			</a>
			<a class="List04">
				<span class="List_txt_box">
					<span class="List_Title">
						문의하기
					</span>
					<span class="List_SubTitle">
						궁금하거나 문의가있으신가요?
					<br> 
						ARTI가 도와드릴게요
					</span>
				</span>
				<span class="List_btn">
					More View
				</span>
			</a>
		</div>
	</div>
</div>
</section>
</body>
</html>