<%@page import="com.smhrd.Arti.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainContainer</title>
<style>

@font-face {
font-family: 'UhBeeSe_hyun';
src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
font-weight: normal;
font-style: normal;
}

.MainContainer {
    width: 100%;
    -webkit-box-flex: 1;
    flex-grow: 1;
    background-color: rgb(67, 77, 104);
    overflow: hidden;
    background-image: url('/img/MainPage.png'); /* 배경 이미지 설정 */
    background-size: cover; /* 이미지가 div 전체를 덮도록 설정 */
    background-position: center; /* 이미지의 위치를 중앙으로 설정 */
    background-repeat: no-repeat; /* 이미지 반복 방지 */
    position: relative; /* 자식 요소의 절대 위치 설정을 위해 상대 위치 지정 */
    height: 100vh; /* 전체 화면 높이로 설정 */
}

.MainContainer > div {
    width: 1200px;
    height: 100%;
    position: relative;
}

.MainContainer_header {
    position: absolute; /* 배경 위에 텍스트 배치 */
    top: 20%; /* 텍스트의 세로 위치 (적절히 조정 가능) */
    left: 10%; /* 텍스트의 가로 위치 (적절히 조정 가능) */
    display: flex;
    flex-direction: column; /* 텍스트를 세로로 배치 */
    align-items: flex-start; /* 텍스트를 왼쪽 정렬 */
    color: black; /* 텍스트 색상 */
    background: rgba(255, 255, 255, 0.7); /* 가독성을 위해 반투명한 흰색 배경 추가 */
    padding: 20px;
    border-radius: 10px;
}

.MainContainer_header > p {
    padding-left: 40px;
    line-height: 80px;
    font-size: 40px;
    margin: 0;
    font-family: 'UhBeeSe_hyun';
    color: #00129A ;
}

#chat-icon {
  position: fixed;
  bottom: 30px;
  right: 30px;
  width: 50px;          /* 전체 아이콘의 크기 조정 */
  height: 50px;
  padding: 10px;        /* 아이콘 안의 이미지와 바깥쪽 경계 사이의 여백 설정 */
  background-color: white;
  border-radius: 40%;   /* 전체 모양을 둥글게 설정 */
  box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2); /* 공중에 떠있는 느낌을 위한 그림자 */
  cursor: pointer;
  z-index: 1000;
  display: flex;
  align-items: center;  /* 이미지가 부모 요소의 가운데에 위치하도록 */
  justify-content: center;
  box-sizing: border-box; /* 패딩을 포함하도록 설정 */
}

.chatImg {
	width:30px; 
	height:30px; 
	margin-top:5px;
}

#chat-icon:hover {
  box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2); /* 마우스를 올렸을 때 그림자 더 진하게 */
}

.hidden {
  display: none;
}

#chat-popup {
  position: fixed;
  bottom: 100px;
  right: 20px;
  width: 330px;
  height: 530px;
  background: #f0f0f0;
  border-radius: 20px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  z-index: 1001;
}

.chat-header {
  display: flex;
  align-items: center;
  padding: 20px;
  background-color: #f0f0f0;
  border-radius: 20px 20px 0 0;
}

.chat-header img {
  width: 40px;  /* 프로필 이미지 크기 */
  height: 40px;
  border-radius: 50%;
  margin-right: 10px;  /* 이미지와 텍스트 간 간격 */
}

.chat-header-text h3 {
  margin: 0;
  font-size: 18px;
}

.operating-hours {
	font-size: 10px;
	margin-top:5px;
	color: #888888;  /* 운영시간 텍스트 색상 */
}

.operating-hours:hover {
	cursor: pointer;
}

.chat-content {
  padding: 15px;
  width: 310px;
  border-radius: 10px;
  background-color: white;
  margin-left: 10px;
}

.chat-button {
  margin-top: 10px;
  padding: 10px;
  background-color: #5c9ded;
  color: #fff;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  width: 280px;
}

.message {
	font-size: 12px;
}

/* 팝업 하단바 */
.popup-bottom-navbar {
    position: absolute;  /* 팝업창 내부에 상대적 위치 고정 */
    bottom: 0;  /* 팝업창의 하단에 배치 */
    left: 0;
    width: 100%;
    height: 60px;
    background-color: #f0f0f0;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: space-around;
    align-items: center;
    color: #555555;
}

.chat-popup {
    position: fixed;
    bottom: 100px;
    right: 20px;
    width: 330px;
    height: 530px;  /* 하단바가 들어갈 공간을 포함한 높이 */
    background: #f0f0f0;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    z-index: 1001;
    overflow: hidden;  /* 하단바가 잘리지 않도록 설정 */
}

.chat-content {
    padding: 15px;
    width: calc(100% - 20px);
    border-radius: 10px;
    background-color: white;
    margin-left: 10px;
    margin-bottom: 70px;  /* 하단바와의 간격 확보 */
}

.navbar-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    font-size: 12px;
}

.navbar-icon {
    width: 20px;
    height: 20px;
    margin-bottom: 5px;
}

/* 마우스를 올렸을 때 색상 변경 */
#home-btn:hover .navbar-icon,
#chat-btn:hover .navbar-icon,
#settings-btn:hover .navbar-icon {
    filter: brightness(0.5); /* 마우스를 올렸을 때 색상 진하게 변경 (CSS 필터 이용) */
}


/* 부드러운 전환 효과 */
.popup-content {
    opacity: 0;
    transition: opacity 0.2s ease-in-out;
}

.popup-content.active-content {
    opacity: 1;
}

/* 채팅 섹션 */

#chat-content {
	background-color: white;
}

#settings-content {
	background-color: white;
}

</style>
</head>
<body>

<%
    User user1 = (User) session.getAttribute("user");
    boolean isLoggedIn = (user1 != null);
%>

<script>
    var isLoggedIn = <%= isLoggedIn %>;
    console.log("isLoggedIn 값:", isLoggedIn); // 로그인 상태 값 확인용 로그
</script>

<div class="MainContainer">
    <div>
        <div class="MainContainer_header">
            <p>내 아이의</p>
            <p>마음 스케치북</p>
            <a><img src="/img/ArtiLogo.png"></a>
           
            <p>아래로 스크롤하세요 !</p>
        </div>
    </div>
</div>


<!-- 채팅 아이콘 -->
<div id="chat-icon">
  	<img id="chat-icon-img" class="chatImg" src="/img/chat.png" alt="Chat Icon"/>
</div>
	
<!-- 채팅 팝업 -->
<div id="chat-popup" class="chat-popup hidden">

	<!-- 로그인 요청 메시지 -->
    <div id="login-message" class="hidden">
        로그인하세요!
    </div>

    <!-- 홈 콘텐츠 -->
    <div id="home-content" class="popup-content active-content">
        <div class="chat-header">
            <img src="/img/default-profile.png" alt="프로필 사진" class="profile-image" id="profileImage">
            <div class="chat-header-text">
                <h3>ARTI</h3>
                <p class="operating-hours">운영시간 보기 &gt;</p>
            </div>
        </div>
        <div class="chat-content">
            <div class="message">
                <b>ARTI 운영진</b> <br>
                <p>방문해주셔서 감사합니다! 어떻게 도와드릴까요?</p>
            </div>
            <button class="chat-button">문의하기</button>
        </div>
    </div>

    <!-- 대화 콘텐츠 -->
    <div id="chat-content" class="popup-content hidden">
        <div class="chat-content">
            <p>여기서 대화를 시작해보세요!</p>
        </div>
    </div>

    <!-- 설정 콘텐츠 -->
    <div id="settings-content" class="popup-content hidden">
        <div class="chat-content">
            <p>설정</p>
        </div>
    </div>

    <!-- 팝업 하단바 -->
    <div class="popup-bottom-navbar">
        <div class="navbar-item" id="home-btn">
            <img id="home-icon" src="/img/chat_popup/home-activate.svg" alt="홈 아이콘" class="navbar-icon">
            <p>홈</p>
        </div>
        <div class="navbar-item" id="chat-btn">
            <img id="chat-icon1" src="/img/chat_popup/chat-deactivate.svg" alt="대화 아이콘" class="navbar-icon">
            <p>대화</p>
        </div>
        <div class="navbar-item" id="settings-btn">
            <img id="settings-icon" src="/img/chat_popup/setting-deactivate.svg" alt="설정 아이콘" class="navbar-icon">
            <p>설정</p>
        </div>
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 초기 아이콘 이미지 설정
    document.getElementById("home-icon").src = "/img/chat_popup/home-activate.svg";  // 기본 홈 아이콘 경로
    document.getElementById("chat-icon1").src = "/img/chat_popup/chat-deactivate.svg";  // 기본 대화 아이콘 경로
    document.getElementById("settings-icon").src = "/img/chat_popup/setting-deactivate.svg";  // 기본 설정 아이콘 경로

    // 채팅 아이콘 클릭 시 팝업 토글
    document.getElementById("chat-icon").addEventListener("click", function() {
        const chatPopup = document.getElementById("chat-popup");
        chatPopup.classList.toggle("hidden");

        const chatIconImg = document.getElementById("chat-icon-img");
        if (chatPopup.classList.contains("hidden")) {
            chatIconImg.src = "/img/chat.png";  // 기본 채팅 아이콘 이미지 경로
        } else {
            chatIconImg.src = "/img/close-icon.svg";  // X 닫기 아이콘 이미지 경로
        }

        // 로그인 상태 확인 및 표시할 콘텐츠 조정
        const loginMessage = document.getElementById("login-message");
        const homeContent = document.getElementById("home-content");
        const popupBottomNavbar = document.querySelector(".popup-bottom-navbar"); // 하단바 요소

        console.log("isLoggedIn 값:", isLoggedIn); // 로그인 상태 값 확인용 로그

        if (!isLoggedIn) {
            // 로그인이 안된 상태
            loginMessage.classList.remove("hidden");
            homeContent.classList.add("hidden");

            // 로그인 요청 메시지가 보일 때 배경색 하얀색으로 설정
            chatPopup.style.background = "#ffffff";

            // 로그인되지 않았을 때 하단바 숨기기
            popupBottomNavbar.style.display = "none";  // 하단바 숨기기
            console.log("로그인되지 않은 상태 - 하단바 숨김");
        } else {
            // 로그인된 상태
            loginMessage.classList.add("hidden");
            homeContent.classList.remove("hidden");

            // 로그인된 상태일 때 배경색 기본 색상으로 설정
            chatPopup.style.background = "#f0f0f0";

            // 로그인된 상태일 때 하단바 보이기
            popupBottomNavbar.style.display = "flex";  // 하단바 보이기 (원래 flex 레이아웃 사용)
            console.log("로그인된 상태 - 하단바 보임");
        }
    });

    // 선택 아이콘 변경
    document.getElementById("home-btn").addEventListener("click", function() {
        showContent("home-content");
        changeActiveIcon("home-icon");
    });

    document.getElementById("chat-btn").addEventListener("click", function() {
        showContent("chat-content");
        changeActiveIcon("chat-icon1");
    });

    document.getElementById("settings-btn").addEventListener("click", function() {
        showContent("settings-content");
        changeActiveIcon("settings-icon");
    });
});

/* 팝업 화면 변경 */
function showContent(contentId) {
    const chatPopup = document.getElementById("chat-popup");

    // 모든 콘텐츠 숨기기
    const contents = document.querySelectorAll(".popup-content");
    contents.forEach(content => {
        content.classList.remove("active-content");
        content.classList.add("hidden");
    });

    // 선택한 콘텐츠 보이기 (부드럽게 전환)
    document.getElementById(contentId).classList.remove("hidden");
    document.getElementById(contentId).classList.add("active-content");

    // 배경색 변경 로직
    if (contentId === "chat-content" || contentId === "settings-content") {
        chatPopup.style.background = "#ffffff";  // 채팅 또는 설정일 때 배경색 하얀색
    } else {
        chatPopup.style.background = "#f0f0f0";  // 기본 홈일 때 원래 배경색
    }
}

/* 아이콘 변경 */
function changeActiveIcon(activeIconId) {
    console.log(`Attempting to activate icon with ID: ${activeIconId}`);
    const element = document.getElementById(activeIconId);
    if (!element) {
        console.error(`Element with ID ${activeIconId} not found.`);
        return;
    }

    // 모든 아이콘을 기본 이미지로 변경
    document.getElementById("home-icon").src = "/img/chat_popup/home-deactivate.svg";  // 기본 홈 아이콘 경로
    document.getElementById("chat-icon1").src = "/img/chat_popup/chat-deactivate.svg";  // 기본 대화 아이콘 경로
    document.getElementById("settings-icon").src = "/img/chat_popup/setting-deactivate.svg";  // 기본 설정 아이콘 경로

    // 활성화된 아이콘 이미지를 변경
    if (activeIconId === "home-icon") {
        document.getElementById(activeIconId).src = "/img/chat_popup/home-activate.svg";  // 활성화된 홈 아이콘 경로
    } else if (activeIconId === "chat-icon1") {
        document.getElementById(activeIconId).src = "/img/chat_popup/chat-activate.svg";  // 활성화된 대화 아이콘 경로
    } else if (activeIconId === "settings-icon") {
        document.getElementById(activeIconId).src = "/img/chat_popup/setting-activate.svg";  // 활성화된 설정 아이콘 경로
    }
}

</script>
</body>
</html>