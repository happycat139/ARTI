<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
</head>
<style>

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section {
    display: block;
}

.LoginContainer {
    -webkit-box-flex: 1;
    flex-grow: 1;
    padding: 100px 0px 126px;
}

.LoginContainer > div {
    width: 476px;
    margin: 0px auto;
    border: 1px solid rgb(245, 245, 245);
}

/* LC_ViewBox 관련 CSS */
.LC_ViewBox {
    transition: padding 250ms ease-in-out;
    padding: 68px;
}

.LC_Header {
    padding-bottom: 28px;
    border-bottom: 1px solid rgb(245, 245, 245);
}

.LC_Header > h1 {
    color: rgb(34, 34, 34);
    font-size: 30px;
    line-height: 48px;
    letter-spacing: -0.5px;
    font-weight: 700;
}

.LC_DescWrap {
    padding-top: 28px;
}

.LC_DescWrap > p {
    color: rgb(34, 34, 34);
    font-size: 14px;
    line-height: 24px;
    font-weight: 700;
}

.LC_Form {
    margin-top: 48px;
}

.LC_IdPwContainer {
    flex: 0 0 auto;
    width: auto;
}

.LC_TitleWrap {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: start;
    justify-content: flex-start;
    margin-bottom: 8px;
}

.LC_Title {
    color: rgb(34, 34, 34);
    font-size: 14px;
    line-height: 24px;
    font-weight: 700;
}

.LC_IdPwContent {
    flex: 0 0 auto;
    display: flex;
    width: 100%;
}

.LC_IdPwContent > div {
    -webkit-box-flex: 1;
    flex-grow: 1;
    display: flex;
    flex-flow: wrap;
    -webkit-box-pack: start;
    justify-content: flex-start;
}

.LC_InputWrap {
    display: block;
    width: 100%;
    height: 44px;
    position: relative;
}

.LC_Input {
    width: 100%;
    height: 100%;
    color: rgb(34, 34, 34);
    font-size: 14px;
    line-height: 24px;
    font-weight: 400;
    padding: 0px 0px 0px 16px;
    border: 1px solid rgb(237, 237, 237);
    border-radius: 2px;
    background-color: rgb(255, 255, 255);
    transition: 150ms ease-out;
    user-select: none;
}

.LC_Input:focus {
    border-color: black;
}

.LC_CheckIcon {
    width: 24px;
    height: 24px;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 8px;
    padding: 0px;
    border: 0px;
    background-color: transparent;
    cursor: pointer;
}

button {
    margin: 0px;
    padding: 0px;
    border-radius: 0px;
    background-color: rgb(255, 255, 255);
    cursor: pointer;
    outline: none;
    touch-action: manipulation;
    -webkit-tap-highlight-color: transparent;
}

img {
    shape-rendering: geometricprecision;
}

.LC_CheckIcon.clicked {
    background-image: url('/img/pwcheck.png'); 
}

.LC_SubmitBtn {
    flex: 0 0 auto;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 100%;
    padding: 0px 16px;
    color: rgb(255, 255, 255);
    border: 0px;
    border-radius: 2px;
    transition: 150ms ease-out;
    cursor: pointer;
    height: 56px;
    font-size: 14px;
    line-height: 24px;
    font-weight: 700;
    background-color: rgb(151, 151, 151);
}

.AgreeBtn:enabled {
    cursor: pointer;
    background-color: rgb(50, 108, 249);
}
        
.AgreeBtn.enabled:hover {
    background-color: rgb(30, 65, 208);
}

.LC_Text {
    margin-left: 0px;
    margin-right: 0px;
}

button > span {
    position: relative;
}

.LC_BtnWrap {
    display: grid;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    grid-template-columns: auto 1px auto;
    margin-top: 28px;
    gap: 0px 24px;
    text-align: center;
}

.LC_BtnWrap > button {
    padding: 0px;
    color: rgb(151, 151, 151);
    font-size: 14px;
    line-height: 24px;
    font-weight: 400;
    border: 0px;
    background-color: transparent;
}

.LC_BtnWrap > div {
    width: 1px;
    height: 12px;
    background-color: rgb(237, 237, 237);
}
</style>
<body>
<%@ include file="Header.jsp" %>
<section class="LoginContainer">
	<div class="LC_ViewBox">
		<header class="LC_Header">
			<h1>이메일로 로그인</h1>
		</header>
		
		<div class="LC_DescWrap">
			<p>ARTI 서비스 이용을 위해 로그인해주세요.</p>
		</div>
		
		<form class="LC_Form" action="/welcome/login" method="post">
			<div class="LC_IdPwContainer">
				<header class="LC_TitleWrap">
					<h1 class="LC_Title">아이디</h1>
				</header>
				<div class="LC_IdPwContent">
					<div>
						<div class="LC_InputWrap">
							<input autocomplete="off" type="text" name="email" placeholder="이메일 주소 입력" class="LC_Input" value="" style="padding-right: 16px;">
						</div>
					</div>				
				</div>
			</div>
			<div class="LC_IdPwContainer" style="margin-top: 24px;">
				<header class="LC_TitleWrap">
					<h1 class="LC_Title">비밀번호</h1>
				</header>
				<div class="LC_IdPwContent">
					<div>
						<div class="LC_InputWrap">
							<input autocomplete="off" type="password" name="password" placeholder="비밀번호 입력" class="LC_Input" value="" style="padding-right: 40px;">
							<button type="button" class="LC_CheckIcon"><img alt="check" src="/img/pwcheck2.png"></button>
						</div>
					</div>				
				</div>
			</div>
			<button class="LC_SubmitBtn" style="margin-top:28px;" type="submit" disabled>
				<span class="LC_Text">로그인</span>
			</button>
		</form>	
		<div class="LC_BtnWrap">
			<button type="button">비밀번호 재설정</button>
			<div></div>
			<button type="button">이메일로 가입하기</button>
		</div>
	</div>
</section>
<%@ include file="Footer.jsp" %>


<script>
document.addEventListener('DOMContentLoaded', function() {
    const rightIcons = document.querySelectorAll('.LC_CheckIcon');
    const emailInput = document.querySelector('input[name="email"]');
    const passwordInput = document.querySelector('input[name="password"]');
    const submitButton = document.querySelector('.LC_SubmitBtn');

    // 비밀번호 표시/숨김 기능 추가
    rightIcons.forEach(icon => {
        icon.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            
            // LC_InputWrap 내의 첫 번째 input 요소를 찾도록 설정
            const input = this.parentElement.querySelector('.LC_Input');
            if (input && input.type === 'password') {
                input.type = 'text';
            } else if (input) {
                input.type = 'password';
            }
            icon.classList.toggle('clicked');
        });
    });

    // 입력 필드 변경 시 버튼 활성화/비활성화 함수
    function validateForm() {
        if (emailInput.value.trim() !== "" && passwordInput.value.trim() !== "") {
            submitButton.disabled = false; // 버튼 활성화
            submitButton.classList.add('AgreeBtn'); // 활성화 스타일 추가
        } else {
            submitButton.disabled = true; // 버튼 비활성화
            submitButton.classList.remove('AgreeBtn'); // 활성화 스타일 제거
        }
    }

    // 이메일과 비밀번호 입력 필드에 입력 이벤트 리스너 추가
    emailInput.addEventListener('input', validateForm);
    passwordInput.addEventListener('input', validateForm);
});
</script>
</body>
</html>