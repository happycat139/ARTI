<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/Profile.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="Header.jsp" %>
<section class="Login-Container">
    <div class="View-Box">
        <header class="Header">
            <h1>프로필</h1>
        </header>
        
        <%
            User user1 = (User) session.getAttribute("user");
        %>
        
        <div class="Profile-Container">
            <div class="Profile-Details">
                <div class="DescWrap">
                    <p><b>이메일</b></p>
                    <p class="Pf_EmailContent"><%= user1 != null ? user1.getEmail() : "" %></p>
                </div>
                
                <div class="DescWrap" style="margin-top: 30px;">
                    <p>
                        <b>이름</b>
                        <a class="Pr_fix_btn" onclick="editNickname(event)">수정</a>
                    </p>
                    <input class="Pf_NicknameContent" id="nicknameInput" placeholder="<%= user1 != null ? user1.getNickname() : "" %>" type="text">
                </div>
                
                <div class="DescWrap" style="margin-top: 30px;">
                    <p>비밀번호</p>
                    <button class="Pr_Pw_btn"><p>비밀번호 변경</p></button>
                </div>
            </div>
            
            <!-- 프로필 이미지 컨테이너 -->
            <div class="Profile-img-Container">
                <img src="<%= user1 != null && user1.getProfileImageUrl() != null ? user1.getProfileImageUrl() : "/img/profile_img.png" %>" alt="프로필 사진" class="profile-image" id="profileImage">
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
                    <button class="Pr_exit_btn" onclick="location.href='/user/delete?uid=<%= user1 != null ? user1.getUid() : "" %>'"><p>회원탈퇴</p></button>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="Footer.jsp" %>
<script>

/* 닉네임 수정 */
function editNickname(event) {
    event.preventDefault(); // 기본 동작 방지
    const inputField = document.getElementById('nicknameInput');
    const newNickname = inputField.value;

    if (newNickname.trim() === "") {
        alert("닉네임을 입력해주세요.");
        return;
    }

    // 닉네임을 서버로 전송하기 위해 AJAX 요청
    fetch('/profile/update/nickname', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ newNickname: newNickname })
    })
    .then(response => response.json())
    .then(data => {
        if (data && data.success) {
            alert('닉네임이 성공적으로 변경되었습니다.');
            location.reload();
        } else {
            alert('닉네임 변경에 실패했습니다. 다시 시도해주세요.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('오류가 발생했습니다. 다시 시도해주세요.');
    });
}


/* 프로필 사진 업로드 트리거 */
function triggerFileUpload() {
    const fileInput = document.getElementById('profileImageInput');
    fileInput.click(); // 파일 선택 창을 띄움
}

/* 프로필 사진 업로드 */
function uploadProfileImage() {
    const fileInput = document.getElementById('profileImageInput');
    const selectedFile = fileInput.files[0];

    if (!selectedFile) {
        alert("이미지를 선택해주세요.");
        return;
    }

    const formData = new FormData();
    formData.append('profileImageFile', selectedFile);
    formData.append('uid', '<%= user1 != null ? user1.getUid() : "" %>'); // 사용자 ID 추가

    // 서버로 이미지 파일 전송
    $.ajax({
        url: '/profile/update/image',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(data) {
            if (data.success) {
                alert('프로필 사진이 성공적으로 변경되었습니다.');
                $('#profileImage').attr('src', data.imageUrl); // 변경된 이미지를 페이지에 반영
            } else {
                alert(data.message || '프로필 사진 변경에 실패했습니다. 다시 시도해주세요.');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('오류가 발생했습니다. 다시 시도해주세요.');
        }
    });
}

</script>
</body>
</html>