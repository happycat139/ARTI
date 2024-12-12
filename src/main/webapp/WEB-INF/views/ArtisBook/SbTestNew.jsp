<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        background-color: #f8f8f8;
        border-bottom: 1px solid #ddd;
    }

    header .logo {
        font-size: 24px;
        font-weight: bold;
        color: #333;
    }

    header nav ul {
        list-style: none;
        display: flex;
        gap: 15px;
        margin: 0;
        padding: 0;
    }

    header nav ul li {
        display: inline;
    }

    header nav ul li a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }

    main {
        display: flex;
        margin: 20px;
    }

    .container {
        display: flex;
        width: 100%;
        gap: 20px;
    }

    .left-panel {
        flex: 1;
        text-align: center;
    }

    .left-panel img {
        width: 100%;
        max-width: 400px;
        border: 1px solid #ddd;
        border-radius: 8px;
    }

    .right-panel {
        flex: 2;
    }

    .right-panel h1 {
        font-size: 28px;
        color: #333;
    }

    .right-panel h2 {
        font-size: 20px;
        margin-top: 10px;
        color: #555;
    }

    .right-panel .score-section h3 {
        font-size: 22px;
        color: #444;
        margin-top: 20px;
    }

    .right-panel .score-section ul {
        list-style: none;
        padding: 0;
    }

    .right-panel .score-section ul li {
        margin: 5px 0;
    }

    .right-panel .score-section p {
        margin-top: 10px;
        color: #666;
    }
</style>
</head>
<body>
<%@ include file="SbHeader.jsp"%>

<main>
    <div class="container">
        <div class="left-panel">
            <!-- 사용자 업로드 이미지 -->
            <h3>사용자 업로드 이미지</h3>
            <img src="https://via.placeholder.com/400" alt="사용자 업로드 이미지">
        </div>
        <div class="right-panel">
            <!-- 결과 분석 -->
            <h1>ARTI HTP 검사</h1>
            <h2>사용자 이름: 홍길동</h2>
            <div class="score-section">
                <h3>사용자 분석 점수</h3>
                <p><strong>종합 점수:</strong> 85</p>
                <ul>
                    <li><strong>사회불안:</strong> 20점</li>
                    <li><strong>정서불안:</strong> 15점</li>
                    <li><strong>공격성:</strong> 25점</li>
                    <li><strong>우울:</strong> 25점</li>
                </ul>
                <p>홍길동님의 종합 진단 점수는 85점입니다. 세부 항목을 참고하세요.</p>
            </div>
        </div>
    </div>
</main>

<script>
    // 필요한 스크립트를 여기에 작성
</script>
</body>
</html>
