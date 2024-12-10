<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>YOLO 분석 결과</title>
</head>
<body>
<%@ include file="HtpHeader.jsp" %>
<h1>YOLOv5 분석 결과</h1>

    <!-- 탐지된 객체 목록 -->
    <h2>탐지된 객체</h2>
    <table border="1">
        <thead>
            <tr>
                <th>객체 이름</th>
                <th>신뢰도</th>
                <th>좌표 (Xmin, Ymin, Xmax, Ymax)</th>
                <th>클래스</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="object" items="${detectedObjects}">
                <tr>
                    <td>${object.obj_name}</td>
                    <td>${object.obj_confidence}</td>
                    <td>(${object.x_min}, ${object.y_min}, ${object.x_max}, ${object.y_max})</td>
                    <td>${object.obj_class}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
