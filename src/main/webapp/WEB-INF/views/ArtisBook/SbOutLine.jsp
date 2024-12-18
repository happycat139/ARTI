<%@page import="com.smhrd.Arti.Model.StoryBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/StoryBook/SbOutLine.css">
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
    <%@ include file="SbCreateHeader.jsp"%>  
    <%@ include file="LoadingPage.jsp"%>
    
    
    <%
    StoryBook story = (StoryBook) session.getAttribute("storybook");
	%>
    
    
    
    
    <div class="SO_Page">
        <div>
            <div>
                <div class="SO_Title outline"><%= story.getAuthor() %> 작가님이 적은 내용으로 줄거리를 만들었어요.</div>
                <div class="SO_SubTitle outline">AI와 함께 줄거리를 수정하면서 원하는 내용으로 바꿔 보아요.</div>
            </div>
            
            

            <div class="SO_Container">
                <div class="SO_ElementBox">
                    <div class="SO_ElementCon">
                        <div class="SO_label small">제목</div>
                        <div class="SO_element"><%= story.getBook_name()%></div>
                    </div>
                    <div class="SO_ElementCon">
                        <div class="SO_label small">장르</div>
                        <div class="SO_element"><%= story.getBook_genre() %></div>
                    </div>
                    <div class="SO_ElementCon">
                        <div class="SO_label small">배경</div>
                        <div class="SO_element"><%= story.getBook_background() %></div>
                    </div>
                    <div class="SO_ElementCon">
                        <div class="SO_label small">주제</div>
                        <div class="SO_element"><%= story.getBook_subject() %></div>
                    </div>
                    <div class="SO_ElementCon">
                        <div class="SO_label small">주인공</div>
                        <div class="SO_element"><%= story.getBook_mc() %></div>
                    </div>
                </div>
                <div class="SO_OutlineBox">
                    <div class="SO_label medium">줄거리</div>
                    <div class="SO_Content"><%= story.getBook_summary() %></div>
                </div>
            </div>
        </div>
        <div class="SO_button-container">

            <form action="/gpt/generateStoryline" method="POST">
                <input type="hidden" name="prompt" value="${prompt}">
                <button class="SO_modifyBtn" type="button" id="openModalBtn">
                    <img src="/img/modify.svg" class="SO_modifyIcon"> 줄거리 수정
                </button>
            </form>

            <div class="SO_pagination">
                <img alt="이전버튼" src="/img/prev-grey.svg">
                <div class="SO_PageLabel">줄거리1</div>
                <img alt="다음버튼" src="/img/next-grey.svg">
            </div>
            <button class="SO_submitBtn outline" onclick="showLoadingAndRedirect('/arti/book/plot')">
                선택한 줄거리로 플롯 생성 <img src="/img/next-button-icon.svg" alt="다음버튼?" class="SO_nextIcon">
            </button>
        </div>
        <div class="SO_modal_background" id="modalBackground" style="display: none;">
            <div class="SO_modify_modal">
                <img src="/img/close-icon.svg" class="SO_modify_modal_closeBtn" id="SO_close_btn">
                <div class="SO_modify_modal_title">
                    바꾸고 싶은 내용을 적으면 AI가 줄거리를 수정합니다.
                </div>
                <form action="/arti/book/outline2" method="post">
                <input type="hidden" name="book_idx" value="<%= story.getBook_idx() %>">
                <textarea class="SO_modify_modal_inputArea" name="reprompt"
                          placeholder="예시) 주인공을 강아지로 수정해줘, 바닷속 보물을 찾아 떠나는 모험 이야기로 보고싶어" 
                          autofocus></textarea>
                <button class="SO_modify_modal_Btn">생성하기</button>
                <div class="SO_modify_ArtiCoin">잔여 아티코인 : ${user.coin}</div>
                </form>
            </div>
        </div>
    </div>
<script>
/* 모달창 열기 js */
document.getElementById('openModalBtn').onclick = function() {
    document.getElementById('modalBackground').style.display = 'block';
};

/* 모달창 닫기 js */
document.getElementById('SO_close_btn').onclick = function() {
    document.getElementById('modalBackground').style.display = 'none';
};

/* 모달창 배경 클릭 시 닫기 */
window.onclick = function(event) {
    var modal = document.getElementById('modalBackground');
    if (event.target == modal) {
        modal.style.display = 'none';
    }
};


//로딩 화면 표시 함수
function showLoadingScreen() {
	document.getElementById("loading-screen").style.display = "flex";
}

// 로딩 화면 숨김 함수 (필요 시 사용)
function hideLoadingScreen() {
	document.getElementById("loading-screen").style.display = "none";
}

// 폼 제출 이벤트와 로딩 화면 연결
// 모든 폼에 이벤트 연결
document.querySelectorAll("form").forEach(form => {
    form.addEventListener("submit", function(event) {
        showLoadingScreen();
    });
});
		
		
// 서버에서 전달된 재생성 횟수 가져오기
let regenerateCount = parseInt("${regenerateCount}");

// null 또는 NaN 확인 후 기본값 설정
if (isNaN(regenerateCount)) {
    regenerateCount = 0; // 기본값 0 설정
}

// 버튼 상태 업데이트
const createButton = document.querySelector(".SO_modifyBtn");
if (regenerateCount >= 3) {
    createButton.disabled = true; // 버튼 비활성화
    createButton.innerText = "재생성 제한 초과"; // 텍스트 변경
    createButton.classList.add("disabled"); // 비활성화 스타일 추가 (옵션)
}

function showLoadingAndRedirect(url) {
    showLoadingScreen(); // 로딩 화면 표시
    setTimeout(() => {
        location.href = url; // 페이지 이동
    }, 500); // 로딩 화면 표시를 위한 딜레이 추가 (필요 시 조정 가능)
}



</script>
</body>
</html>
