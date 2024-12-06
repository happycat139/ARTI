<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>YOLO 분석 결과</title>
</head>
<body>
<%@ include file="HtpHeader.jsp" %>
    <h1>YOLO 분석 결과</h1>
    <p>이미지 URL: <a href="${imageUrl}" target="_blank">${imageUrl}</a></p>
    <h2>분석 결과:</h2>
    <pre>${yoloResult}</pre>
    <a href="/">메인으로 돌아가기</a>
</body>
</html>
