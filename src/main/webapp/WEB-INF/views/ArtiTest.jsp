<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
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

.Login-Container {
    -webkit-box-flex: 1;
    flex-grow: 1;
    padding: 20px 0px 206px;
}

.Login-Container > div {
    width: 800px;
    margin: 0px auto;
}

.View-Box {
    transition: padding 250ms ease-in-out;
    padding: 68px;
}

.Header {
    padding-bottom: 28px;        
}

.Header > h1 {
    color: rgb(34, 34, 34);
    font-size: 30px;
    line-height: 40px;
    letter-spacing: -0.5px;
    font-weight: 700;
}

.Header > p.Pf_EmailContent {
	color: gray;
	margin-top: 15px;
	font-family: 'STUNNING-Bd'; 
} 

.Profile-Container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 40px;
}

.Profile-Details {
    flex: 1;
}

.Profile-img-Container {
    position: relative;
    width: 150px;
    height: 150px;
}

.DescWrap > p {
    color: rgb(34, 34, 34);
    font-size: 20px;
    line-height: 24px;
    font-weight: 700;
}

.DescWrap > p.Pf_EmailContent {
	color: gray;
	margin-top: 15px;
}     

input {
    width: calc(100% - 20px);
    padding: 10px;
    border: none;
    background-color: #F6F6F6;
    color: #333;
    font-size: 16px;
    border-radius: 4px;
    margin-top: 10px;
}

input:focus {
    background-color: #E7E4E4;
}
 
 
input::placeholder {
	color: rgb(34, 34, 34);
	margin-top: 15px;
}

.profile-image {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin-top: 10px;
}

.Pr_edit-icon {
    position: absolute;
    bottom: -12px;
    right: 0;
    width: 40px;
    height: 40px;
    background-color: rgb(209,203,203);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
}

.Pr_edit-icon img {
    width: 20px;
    height: 20px;
}

.Pr_fix_btn {
	font-size: 18px;
	color: gray; 
	margin-left: 368px;
}

.Pr_Pw_btn {
    display: inline-flex;
    align-items: center;
    border: none;
    padding: 5px 10px;
    border-radius: 4px;
    text-decoration: none;
    background-color: #E1E1FF;
    color: #333;
    font-weight: bold;
    font-size: 14px;
    transition: background-color 0.3s ease;
    margin-top: 20px;
    color: blue;
    width: 180px;
    height: 50px;
    font-family: 'STUNNING-Bd'; 
}
       
.Pr_Pw_btn > p {
	margin-left: 35px;
}

.Pr_Pw_btn:hover {
    background-color: #7E7EFF;
    color: white ;
}


/* 밑 컨테이너 */

/* 로그아웃 버튼 */

.Pr_logout_btn {
    display: inline-flex;
    align-items: center;
    border: none;
    padding: 5px 10px;
    border-radius: 15px;
    text-decoration: none;
    background-color: #E9E9E9;
    color: #333;
    font-weight: bold;
    font-size: 14px;
    transition: background-color 0.3s ease;
    margin-top: 20px;
    width: 120px;
    height: 50px;
    font-family: 'STUNNING-Bd'; 
}
       
.Pr_logout_btn > p {
	margin-left: 25px;
	color: gray;
}

.Pr_logout_btn:hover {
    background-color: #DCDCDC;
    color: white ;
}


/* 회원탈퇴 버튼 */

.Pr_exit_btn {
    display: inline-flex;
    align-items: center;
    border: none;
    padding: 5px 10px;
    border-radius: 15px;
    text-decoration: none;
    background-color: red;
    color: #333;
    font-weight: bold;
    font-size: 14px;
    transition: background-color 0.3s ease;
    margin-top: 20px;
    width: 120px;
    height: 50px;
    font-family: 'STUNNING-Bd'; 
}
       
.Pr_exit_btn > p {
	margin-left: 23px;
	color: white;
}

.Pr_exit_btn:hover {
    background-color: #B40000;
    color: white ;
}

</style>
<body>

<%@ include file="Header.jsp" %>
 <section class="Login-Container">
            <div class="View-Box">
                <header class="Header">
                    <h1>ARTI HTP-검사</h1>
                    <p class="Pf_EmailContent">내 아이의 마음을 알아보세요</p>
                    
                </header>
               <div class="Profile-Container">
                    <div class="Profile-Details">
                    
                        <div class="DescWrap">
                            <p><b>이메일</b></p>
                            <p class="Pf_EmailContent"></p>
                        </div>
                        
                        <div class="DescWrap" style="margin-top: 30px;">
                            <p>
                            	<b>이름</b>
                            	<a class="Pr_fix_btn" onclick="editNickname(event)">수정</a>
                            </p>
                            <input class="Pf_NicknameContent" id="nicknameInput" placeholder="" type="text">
                        </div>
                        
                        <div class="DescWrap" style="margin-top: 30px;">
                        	<p>비밀번호</p>
                        	<button class="Pr_Pw_btn"><p>비밀번호 변경</p></button>
                        </div>
                        
                    </div>
                    
                    <!-- 프로필 이미지 컨테이너 -->
                    <div class="Profile-img-Container">
                    	<div class="Pr_edit-icon" onclick="triggerFileUpload()">
                            <img src="/img/edit-icon.png" alt="편집 아이콘">
                        </div>
                        <input type="file" id="profileImageInput" style="display: none;" accept="image/*" onchange="uploadProfileImage()">
                    </div>
                </div>
               
                    <hr style="border: none; border-top: 1px dotted #E9E9E9; margin: 40px 0;">
                    
                    <div class="Profile-Container">
                    	<div class="Profile-Details">
                    
                        	<div class="DescWrap">
                            	<p><b>내 검사지</b></p>
                        	</div>
                       		<div class="DescWrap" style="margin-top: 30px; text-align: right;">
                        		<button class="Pr_logout_btn" onclick="location.href='/user/logout'"><p>로그아웃</p></button>
                        	</div>
                    	</div>
                    </div>
                    
                </div>
                
            	
        </section>
<%@ include file="Footer.jsp" %>
</body>
</html>