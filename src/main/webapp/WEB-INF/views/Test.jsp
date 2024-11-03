<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Info Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            padding-bottom: 20px;
        }
        .info-section {
            width: 70%;
            margin-right: 10px;
        }
        .profile-section {
            width: 30%;
            display: flex;
            justify-content: center;
        }
        .profile-img {
            width: 130px;
            height: 130px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .profile-img img {
            width: 100%;
            height: 100%;
            margin-bottom: 16px;
            border-radius: 50%;
            border: 1px solid #ccc;
            object-fit: cover;
        }
        .edit-button {
            width: 32px;
            height: 32px;
            position: absolute;
            bottom: 0;
            right: 0;
            border-radius: 50%;
            background-color: #ccc;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        .button {
            width: 128px;
            height: 40px;
            background-color: #F8FAFF;
            color: #5A8AF2;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #5A8AF2;
            color: white;
        }
        .input-field {
            width: 100%;
            padding: 8px;
            margin-top: 8px;
            margin-bottom: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="info-section">
            <span>이메일</span>
            <div class="pt-2 pb-6" style="color: gray;">user@example.com</div>
            <div class="flex w-full">
                <span>이름</span>
                <div style="flex: 1; text-align: right; color: gray; font-size: 14px;">
                    <span class="cursor-pointer" style="cursor: pointer;">수정</span>
                </div>
            </div>
            <input type="text" class="input-field" placeholder="이름" value="홍길동" disabled>
            <span>비밀번호</span>
            <div class="py-2">
                <button class="button">비밀번호 변경</button>
            </div>
        </div>
        <div class="profile-section">
            <div class="profile-img">
                <img src="https://via.placeholder.com/130" alt="프로필">
                <div class="edit-button">
                    <i class="fas fa-pencil-alt" style="color: white;"></i>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
