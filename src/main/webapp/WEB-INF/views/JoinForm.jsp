<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/JoinForm.css" />
</head>
<body>
<div id="root">
    <div id="content">
        <%@ include file="Header.jsp" %>

        <section class="Login-Container">
            <div class="View-Box">
                <header class="Header">
                    <h1>회원정보 입력</h1>
                </header>

                <div class="DescWrap">
                    <p><b>ARTI 이용을 위해 아래 정보를 입력해주세요.</b></p>
                </div>
				<form action="/welcome/join" method="post">
                <div class="FormContainer">
					<div class="info">
						<header class="TitleWrap">
							<h1 class="tag">아이디</h1>
						</header>
						<div class="Content">
							<div>
								<div class="InputWrap">
									<input autocomplete="off" type="text" name="email" placeholder="이메일 주소 입력" class="InputInfo" value="" id="email">
								</div>
							</div>
						</div>
					</div>
					
					<div class="info" style="margin-top: 24px">
						<header class="TitleWrap">
							<h1 class="tag">닉네임</h1>
						</header>
						<div class="Content">
							<div>
								<div class="InputWrap">
									<input autocomplete="off" type="text" name="nickname" placeholder="닉네임 입력" class="InputInfo" value="" id="nickname">
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="info" style="margin-top: 24px">
						<header class="TitleWrap">
							<h1 class="tag">비밀번호</h1>
						</header>
						<div class="Content">
							<div>
								<div class="InputWrap">
									<input autocomplete="off" type="password" name="password" placeholder="8자리 이상 영문,숫자,특수문자 포함" class="InputInfo2" value="" id="password">
									<button class="RightIcon" type="button"><img alt="check" src="/img/pwcheck2.png"></button>
								</div>
							</div>
						</div>
						<p class="error-message" id="password-validation-error" style="display: none;">비밀번호는 문자,숫자,특수문자를 포함하여 8~20자 이내로 입력하세요.</p>
					</div>
					
					<div class="info" style="margin-top: 8px">
						<div class="Content">
							<div>
								<div class="InputWrap">
									<input autocomplete="off" type="password" name="passwordConfirm" placeholder="비밀번호 확인" class="InputInfo2" value="" id="passwordConfirm">
									<button class="RightIcon" type="button"><img alt="check" src="/img/pwcheck2.png"></button>
								</div>
							</div>
						</div>
						 <p class="error-message" id="password-error" style="display: none;">입력한 비밀번호가 서로 일치하지 않습니다.</p>
						 <p class="error-message" id="password-empty-error" style="display: none;">비밀번호 확인을 입력해주세요.</p>						
					</div>
					
                </div>
		
                <div class="BtnWrap">
                    <button class="AgreeBtn" id="agreeBtn" type="submit" disabled>
                        <span class="join">회원가입 완료</span>
                    </button>
                </div>
            </form>
            </div>
            	
        </section>
        <%@ include file="Footer.jsp" %>
    </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const rightIcons = document.querySelectorAll('.RightIcon');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const passwordConfirmInput = document.getElementById('passwordConfirm');
    const passwordError = document.getElementById('password-error');
    const passwordEmptyError = document.getElementById('password-empty-error');
    const passwordValidationError = document.getElementById('password-validation-error');
    const agreeBtn = document.getElementById('agreeBtn');

    rightIcons.forEach(icon => {
        icon.addEventListener('click', function() {
        	 const input = this.previousElementSibling;
             if (input.type === 'password') {
                 input.type = 'text';
             } else {
                 input.type = 'password';
             }
            icon.classList.toggle('clicked');
        });
    });
    
    function validateForm() {
        const passwordValue = passwordInput.value;
        const confirmPasswordValue = passwordConfirmInput.value;
        const emailValue = emailInput.value;

        const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-={};:'",.<>?])[A-Za-z\d!@#$%^&*()_+\-={};:'",.<>?]{8,20}$/;

        let isValid = true;

        if (passwordValue !== "" && !passwordRegex.test(passwordValue)) {
            passwordValidationError.style.display = 'block';
            isValid = false;
        } else {
            passwordValidationError.style.display = 'none';
        }

        if (passwordValue !== "") {
            if (confirmPasswordValue === "") {
                passwordEmptyError.style.display = 'block';
                passwordError.style.display = 'none';
                isValid = false;
            } else if (passwordValue !== confirmPasswordValue) {
                passwordError.style.display = 'block';
                passwordEmptyError.style.display = 'none';
                isValid = false;
            } else {
                passwordError.style.display = 'none';
                passwordEmptyError.style.display = 'none';
            }
        } else {
            passwordEmptyError.style.display = 'none';
            passwordError.style.display = 'none';
        }

        if (emailValue.trim() === "") {
            isValid = false;
        }

        agreeBtn.disabled = !isValid;
    }

    passwordInput.addEventListener('input', validateForm);
    passwordConfirmInput.addEventListener('input', validateForm);
    emailInput.addEventListener('input', validateForm);
});
</script>
</body>
</html>
