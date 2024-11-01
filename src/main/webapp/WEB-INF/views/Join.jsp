<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>실전프로젝트</title>
    <link rel="stylesheet" href="/css/Join.css">
</head>
<body>
<div id="root">
    <div id="content">
        <%@ include file="Header.jsp" %>

        <section class="Login-Container">
            <div class="View-Box">
                <header class="Header">
                    <h1>약관 동의</h1>
                </header>

                <div class="DescWrap">
                    <p>환영합니다! 우리 서비스 이용약관에 동의해주세요.</p>
                </div>

                <div class="TermContainer">
                    <label class="Agree">
                        <input type="checkbox" class="check" id="all-agree">
                        <p class="TextContent">
                            <b>네, 모두 동의합니다.</b>
                        </p>
                    </label>
                    <ul class="List">
                        <li>
                            <label class="Agree">
                                <input type="checkbox" class="check required">
                                <p class="TextContent">[필수] 만 14세 이상입니다.</p>
                            </label>
                        </li>
                        <li>
                            <label class="Agree">
                                <input type="checkbox" class="check required">
                                <p class="TextContent">[필수] 실전프로젝트 이용약관 동의</p>
                            </label>
                            <a href="#" target="_blank" rel="noreferrer noopner" class="arrow-link">></a>
                        </li>
                        <li>
                            <label class="Agree">
                                <input type="checkbox" class="check required">
                                <p class="TextContent">[필수] 개인정보 수집 및 이용 동의</p>
                            </label>
                            <a href="#" target="_blank" rel="noreferrer noopner" class="arrow-link">></a>
                        </li>
                        <li>
                            <label class="Agree">
                                <input type="checkbox" class="check optional">
                                <p class="TextContent">[선택] 마케팅 정보 수신에 대한 동의</p>
                            </label>
                            <a href="#" target="_blank" rel="noreferrer noopner" class="arrow-link">></a>
                        </li>
                    </ul>
                    <p class="Desc">만 14세 이상 회원 가입 가능합니다.</p>
                    <p class="Desc">해당 내용은 <a class="polish" target="_blank" rel="noreferrer noopner">이용약관 및 정책</a>에서도 확인이 가능합니다.</p>
                </div>

                <div class="BtnWrap">
                    <button class="AgreeBtn" onclick="location.href='/welcome/join/form'"disabled>
                        <span class="join">동의하고 진행하기</span>
                    </button>
                </div>

            </div>
        </section>
        <%@ include file="Footer.jsp" %>
    </div>
</div>
<script>

/* 이용약관 관련 JS */
document.addEventListener('DOMContentLoaded', function() {
    const agreeBtn = document.querySelector('.AgreeBtn');
    const requiredCheckboxes = document.querySelectorAll('.check.required');
    const optionalCheckboxes = document.querySelectorAll('.check.optional');
    const allAgreeCheckbox = document.getElementById('all-agree');

    function updateButtonState() {
        const allRequiredChecked = Array.from(requiredCheckboxes).every(checkbox => checkbox.checked);
        agreeBtn.disabled = !allRequiredChecked;
        if (allRequiredChecked) {
            agreeBtn.classList.add('enabled');
        } else {
            agreeBtn.classList.remove('enabled');
        }
    }

    requiredCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', updateButtonState);
    });

    allAgreeCheckbox.addEventListener('change', function() {
        const isChecked = allAgreeCheckbox.checked;
        requiredCheckboxes.forEach(checkbox => checkbox.checked = isChecked);
        optionalCheckboxes.forEach(checkbox => checkbox.checked = isChecked);
        updateButtonState();
    });

    updateButtonState(); // 초기 버튼 상태 설정
});

</script>
</body>
</html>
