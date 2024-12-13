<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    padding-top: 25px;
}

.left-panel img {
    max-width: 100%;
    max-height: 400px; 
    width: auto;
    height: auto;
    object-fit: contain;
    border-radius: 8px;
}

.right-panel {
    flex: 1;
    padding: 0 30px;
    height: 600px; 
    overflow-y: auto; 
}

.right-panel h1 {
    font-size: 28px;
    color: #333;
}

.right-panel h2 {
    font-size: 20px;
    color: #555;
}

.right-panel canvas {
    margin-top: 20px;
}

.top-label {
    display: flex;
    flex-direction: row; 
    align-items: center; 
    justify-content: space-between; 
    gap: 10px;
    padding: 0 20px;
    border: 1px solid #ccc; 
}

.score-top-label {
    display: flex;
    flex-direction: column; 
    align-items: center; 
    margin-bottom: 10px;
    padding-top: 60px;
}

.score-top-label h3 {
    font-size: 24px;
    font-weight: bold;
    margin: 0;
    text-align: center; 
}

.score-top-label p {
    align-self: flex-end; 
    margin: 5px 0 0; 
    font-size: 18px;
    font-weight: bold;
}

.score-details {
    margin-top: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f9f9f9;
}

.score-details h3 {
    margin-bottom: 15px;
    color: #444;
}

.score-details div {
    margin-bottom: 10px;
}

.score-details p {
    margin: 5px 0;
    line-height: 1.5;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%@ include file="../Header.jsp"%>

<main>
    <div class="container">
    
    	<!-- 왼쪽 패널 -->
        <div class="left-panel">
            <!-- 사용자 업로드 이미지 -->
            <img src="${uploadedImage}" alt="사용자 업로드 이미지">
        </div>
        
        <!-- 오른쪽 패널 -->
        <div class="right-panel">
        
        	<div class="top-label">
        		<h1>ARTI HTP 검사</h1>
        		<h2>검사자 : ${result.userName}</h2>
			</div>
            
            <div class="score-section">
    			<div class="score-top-label"> 
        			<h3>${result.userName}님 분석 점수</h3>
        			<p><strong>종합 점수:</strong> ${result.totalScore}</p>
    			</div>
    			<canvas id="scoreChart"></canvas>

    			<!-- 상세 해설 추가 -->
    			<div class="score-details">
        			<h3>상세 해설</h3>
        				<c:forEach var="entry" items="${result.symptomScores}">
            				<div>
                				<p><strong>${entry.key} (${entry.value}점)</strong></p>
        						<p>${result.symptomExplanations[entry.key]}</p>
           	 				</div>
        				</c:forEach>
    			</div>
			</div>
        </div>
    </div>
</main>
<script>
const labels = ${labelsJson};
const data = ${dataJson};

// 차트 생성
const ctx = document.getElementById('scoreChart').getContext('2d');
const scoreChart = new Chart(ctx, {
    type: 'bar', // 막대 차트
    data: {
        labels: labels, // 항목 이름
        datasets: [{
            label: '해당 점수',
            data: data, // 항목별 점수
            backgroundColor: [
                'rgba(255, 99, 132, 1)', // 빨강
                'rgba(54, 162, 235, 1)', // 파랑
                'rgba(255, 206, 86, 1)', // 노랑
                'rgba(75, 192, 192, 1)', // 청록
                'rgba(153, 102, 255, 1)', // 보라
                'rgba(255, 159, 64, 1)', // 주황
                'rgba(199, 199, 199, 1)'  // 회색
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true, // 반응형
        scales: {
            y: {
                beginAtZero: true // Y축 0부터 시작
            }
        },
        plugins: {
            legend: {
                display: true,
                position: 'top'
            }
        }
    }
});

</script>

</body>
</html>
