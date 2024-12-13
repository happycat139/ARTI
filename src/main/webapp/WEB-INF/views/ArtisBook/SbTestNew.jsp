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
<%@ include file="SbHeader.jsp"%>

<main>
    <div class="container">
        <div class="left-panel">
            <!-- 사용자 업로드 이미지 -->
            <img src="https://storage.googleapis.com/smhrd_arti/HTP/Upload/5b64d100-3a08-42eb-8935-19d37d6660fd_SubContainer2.png" alt="사용자 업로드 이미지">
        </div>
        <div class="right-panel">
        
        	<div class="top-label">
            	<h1>ARTI HTP 검사</h1>
            	<h2>사용자 이름: 홍길동</h2>
			</div>
            
            <div class="score-section">
    <div class="score-top-label"> 
        <h3>사용자 분석 점수</h3>
        <p><strong>종합 점수:</strong> 85</p>
    </div>
    <canvas id="scoreChart"></canvas>

    <!-- 상세 해설 추가 -->
    <div class="score-details">
        <h3>상세 해설</h3>
        <div>
            <p><strong>1. 우울 (10점)</strong></p>
            <p>그림에서 느껴지는 고립된 환경(집을 둘러싼 울타리)과, 나무의 세부적 표현에서 자기표현 부족이 보일 수 있습니다. 이는 내적 갈등과 감정 억제 경향을 시사하며, 김예원 씨가 심리적 우울감을 경험하고 있을 가능성을 나타냅니다.</p>
        </div>
        <div>
            <p><strong>2. 사회불안 (19점)</strong></p>
            <p>사회불안 점수가 높게 나온 것은 집 주변에 울타리가 그려진 점에서 고립된 환경을 표현하고, 외부와의 소통을 방어하려는 경향이 드러난 것으로 해석됩니다. 이는 대인관계에서의 긴장감과 두려움을 나타낼 수 있습니다.</p>
        </div>
        <div>
            <p><strong>3. 공격성 (4점)</strong></p>
            <p>공격성 점수가 낮은 것은 긍정적인 신호로 보입니다. 이는 외부 환경에 대해 강한 적대적 태도는 없으나, 사회적 불안을 느끼는 상황에서 수동적 태도를 취할 가능성을 암시할 수 있습니다.</p>
        </div>
        <div>
            <p><strong>4. 정서불안 (3점)</strong></p>
            <p>정서불안 점수는 비교적 낮으나, 우울 점수와 함께 볼 때 감정을 억제하려는 성향이 높을 수 있습니다. 이는 외부로 드러나는 불안보다는 내적으로 누르고 있는 감정 상태를 나타냅니다.</p>
        </div>
        <div>
            <p><strong>5. 열등감 (2점)</strong></p>
            <p>열등감 점수는 낮아 자신에 대한 부정적 평가가 심하지는 않은 상태로 보입니다. 이는 어느 정도 자기 효능감을 가지고 있음을 시사할 수 있습니다.</p>
        </div>
        <div>
            <p><strong>6. 대인회피 (8점)</strong></p>
            <p>대인회피 점수가 중간 정도로 나타났는데, 이는 사회불안과 연결되어 타인과의 관계에서 회피적 행동을 보일 가능성을 의미합니다.</p>
        </div>
        <div>
            <p><strong>7. 애정결핍 (1점)</strong></p>
            <p>애정결핍 점수가 낮아 주변 사람들에게 충분한 정서적 지지를 받고 있는 것으로 보입니다.</p>
        </div>
    </div>
</div>
        </div>
    </div>
</main>

<script>
    // Chart.js 데이터와 설정
    const ctx = document.getElementById('scoreChart').getContext('2d');
    const scoreChart = new Chart(ctx, {
        type: 'bar', // 막대 차트
        data: {
            labels: ['사회불안', '공격성', '우울', '애정결핍', '정서불안', '열등감', '자존감	'], // 항목 이름
            datasets: [{
                label: '해당 점수',
                data: [20, 15, 27, 32, 15, 3, 16], // 항목별 점수
                backgroundColor: [
                    'rgba(255, 99, 132, 1)', // 빨강
                    'rgba(54, 162, 235, 1)', // 파랑
                    'rgba(255, 206, 86, 1)', // 노랑
                    'rgba(75, 192, 192, 1)', // 청록
                    'rgba(153, 102, 255, 1)', // 보라
                    'rgba(255, 159, 64, 1)', // 주황
                    'rgba(199, 199, 199, 1)'  // 회색
                ],
                borderColor: [
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
