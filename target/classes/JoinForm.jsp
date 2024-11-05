<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>실전프로젝트</title>
    <style>
    
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
            padding: 100px 0px 126px;
        }

        .Login-Container > div {
            width: 476px;
            margin: 0px auto;
            border: 1px solid rgb(245, 245, 245);
        }

        .View-Box {
            transition: padding 250ms ease-in-out;
            padding: 68px;
        }

        .Header {
            padding-bottom: 28px;
            border-bottom: 1px solid rgb(245, 245, 245);
        }

        .Header > h1 {
            color: rgb(34, 34, 34);
            font-size: 30px;
            line-height: 48px;
            letter-spacing: -0.5px;
            font-weight: 700;
        }

        .DescWrap {
            padding-top: 28px;
        }

        .DescWrap > p {
            color: rgb(34, 34, 34);
            font-size: 14px;
            line-height: 24px;
            font-weight: 700;
        }
        
        .FormContainer {
    		padding-top: 48px;
		}
		
		.info{
    		flex: 0 0 auto;
    		width: auto;
		}
		
		.TitleWrap{
			display: flex;
    		-webkit-box-align: center;
    		align-items: center;
    		-webkit-box-pack: start;
    		justify-content: flex-start;
    		margin-bottom: 8px;
		}
		
		.tag {
			color: rgb(34, 34, 34);
    		font-size: 14px;
    		line-height: 24px;
    		font-weight: 700;
		}
		
		.Content {
			flex: 0 0 auto;
    		display: flex;
    		width: 100%;
		}
		
		.Content > div {
   		 	-webkit-box-flex: 1;
    		flex-grow: 1;
    		display: flex;
    		flex-flow: wrap;
    		-webkit-box-pack: start;
   		 	justify-content: flex-start;
		}
		
		.InputWrap {
			display: block;
    		width: 100%;
    		height: 44px;
    		position: relative;
		}

		.InputInfo {
		    width: 100%;
    		height: 100%;
    		color: rgb(34, 34, 34);
    		font-size: 14px;
    		line-height: 24px;
    		font-weight: 400;
    		padding: 0px 16px;
    		border: 1px solid rgb(237, 237, 237);
    		border-radius: 2px;
    		background-color: rgb(255, 255, 255);
    		transition: 150ms ease-out;
    		user-select: none;
    		box-sizing: border-box;
		}
		
		.InputInfo2 {
			width: 100%;
    		height: 100%;
   			color: rgb(34, 34, 34);
    		font-size: 14px;
    		line-height: 24px;
    		font-weight: 400;
    		padding: 0px 40px 0px 16px;
    		border: 1px solid rgb(237, 237, 237);
    		border-radius: 2px;
    		background-color: rgb(255, 255, 255);
    		transition: 150ms ease-out;
    		user-select: none;
		}
		
		.InputInfo:focus, .InputInfo2:focus {
            border-color: black;
        }
		
		.RightIcon {
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
		
		.RightIcon.clicked {
            background-image: url('/img/pwcheck.png'); 
        }
        
        .BtnWrap {
            margin-top: 36px;
        }

        .AgreeBtn {
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
            border-radius: 4px;
            transition: 150ms ease-out;
            cursor: default;
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

        button > span {
            position: relative;
        }

        .join {
            margin-left: 0px;
            margin-right: 0px;
        }

        .arrow-link {
            color: rgb(151, 151, 151);
            text-decoration: none;
            font-size: 20px;
            line-height: 20px;
        }
        
        .error-message {
            color: red;
            font-size: 10px;
            margin-top: 8px;
            line-height: 20px;
    		font-weight: 400;
        }
        
    </style>
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
                    <p><b>우리팀 서비스 이용을 위해 아래 정보를 입력해주세요.</b></p>
                </div>

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
							<h1 class="tag">비밀번호</h1>
						</header>
						<div class="Content">
							<div>
								<div class="InputWrap">
									<input autocomplete="off" type="password" name="password" placeholder="8자리 이상 영문,숫자,특수문자 포함" class="InputInfo2" value="" id="password">
									<button class="RightIcon"><img alt="check" src="/img/pwcheck2.png"></button>
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
									<button class="RightIcon"><img alt="check" src="/img/pwcheck2.png"></button>
								</div>
							</div>
						</div>
						 <p class="error-message" id="password-error" style="display: none;">입력한 비밀번호가 서로 일치하지 않습니다.</p>
						 <p class="error-message" id="password-empty-error" style="display: none;">비밀번호 확인을 입력해주세요.</p>						
					</div>
					
                </div>

                <div class="BtnWrap">
                    <button class="AgreeBtn" id="agreeBtn" disabled>
                        <span class="join">회원가입 완료</span>
                    </button>
                </div>

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
