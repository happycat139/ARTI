<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>진단 결과</title>
</head>
<body>
<%@ include file="HtpHeader.jsp" %>
    <h1>진단 결과</h1>

    <p><strong>사용자 이름:</strong> ${result.userName}</p>
    <p><strong>총합 점수:</strong> ${result.totalScore}</p>
    <p><strong>총 해설:</strong> ${result.summary}</p>

    <h2>증상별 점수</h2>
    <table border="1">
        <thead>
            <tr>
                <th>증상</th>
                <th>점수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="entry" items="${result.symptomScores.entrySet()}">
                 <c:if test="${entry.value > 0}">
                	<tr>
                    	<td>${entry.key}</td>
                    	<td>${entry.value}</td>
                	</tr>
            	</c:if>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
