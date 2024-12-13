<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 캔버스 */
#game-canvas {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* 반투명 검정 */
	z-index: 1;
	will-change: transform;
	transform: translateZ(0);
}

/* 시작 화면 */
#start-screen, #game-over-screen {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	z-index: 9999;
	font-family: Arial, sans-serif;
	font-size: 2em;
	text-align: center;
}

/* 버튼 */
button {
	padding: 10px 20px;
	font-size: 1.5em;
	background: #4caf50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

button:hover {
	background: #45a049;
}

button:active {
	background: #3e8e41;
}

/* 타이머 */
#timer {
	position: fixed;
	top: 10px;
	left: 90%;
	transform: translateX(-50%);
	font-size: 1.5em;
	color: white;
	z-index: 9999;
	font-family: Arial, sans-serif;
}
/* 로딩 오버레이 */
.loading-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7); /* 반투명 검정 배경 */
    z-index: 9999; /* 최상단에 위치 */
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 로딩 콘텐츠 */
.loading-content {
    text-align: center;
}

.loading-content img {
    max-height: 500px; /* 이미지 크기 */
    margin-bottom: 10px;
}

#blinking-text {
    font-size: 25px;
    color: white;
    animation: blink 1.5s infinite; /* 깜박이는 애니메이션 */
    font-family: Arial, sans-serif;
}

/* 텍스트 깜박이는 효과 */
@keyframes blink {
    0% { opacity: 1; }
    50% { opacity: 0; }
    100% { opacity: 1; }
}

</style>
</head>
<body>
	
	<div class="loading-overlay">
    <div class="loading-content">
        <img src="/img/ARTI_Loading.gif" alt="로딩 중" />
        <p id="blinking-text">동화책 생성 중입니다</p>
    </div>
</div>
	
	<canvas id="game-canvas"></canvas>
	
	<div id="start-screen"
		style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.8); display: flex; justify-content: center; align-items: center; color: white; font-size: 2em; z-index: 9999;">
		<button id="start-button"
			style="padding: 10px 20px; font-size: 1.5em;">게임 시작</button>
	</div>
	<div id="game-over-screen"
		style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.8); display: none; justify-content: center; align-items: center; color: white; font-size: 2em; z-index: 9999;">
		<div>
			<p id="game-over-message">Game Over!</p>
			<p id="score-message" style="margin-top: 10px; font-size: 1.5em;"></p>
			<button id="restart-button"
				style="padding: 10px 20px; font-size: 1.5em;">다시 시작</button>
		</div>
	</div>
	<div id="timer"
		style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); color: white; font-size: 1.5em; z-index: 9999; display: none;">
		경과 시간: <span id="timer-value">0</span>초
	</div>

	<script>
    const canvas = document.getElementById('game-canvas');
    const ctx = canvas.getContext('2d');
    const startScreen = document.getElementById('start-screen');
    const startButton = document.getElementById('start-button');
    const gameOverScreen = document.getElementById('game-over-screen');
    const restartButton = document.getElementById('restart-button');
    const timerDisplay = document.getElementById('timer');
    const timerValue = document.getElementById('timer-value');
    const scoreMessage = document.getElementById('score-message');

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    let ball = { x: canvas.width / 2, y: canvas.height / 2, radius: 15, dx: 4, dy: -4 };
    let paddle = { width: 300, height: 20, x: (canvas.width - 100) / 2, y: canvas.height - 30, dx: 8 };
    let isGameOver = false;
    let timer = 0;
    let timerInterval;

    document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowRight' && paddle.x + paddle.width < canvas.width) {
            paddle.x += paddle.dx;
        } else if (event.key === 'ArrowLeft' && paddle.x > 0) {
            paddle.x -= paddle.dx;
        }
    });

    function drawBall() {
        ctx.beginPath();
        ctx.arc(ball.x, ball.y, ball.radius, 0, Math.PI * 2);
        ctx.fillStyle = 'white';
        ctx.fill();
        ctx.closePath();
    }

    function drawPaddle() {
        ctx.fillStyle = 'white';
        ctx.fillRect(paddle.x, paddle.y, paddle.width, paddle.height);
    }

    function draw() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // 공 그리기
        drawBall();
        // 패들 그리기
        drawPaddle();

        // 공 위치 업데이트
        ball.x += ball.dx;
        ball.y += ball.dy;

        // 벽에 부딪힐 때 방향 전환
        if (ball.x + ball.radius > canvas.width || ball.x - ball.radius < 0) {
            ball.dx = -ball.dx;
        }

        if (ball.y - ball.radius < 0) {
            ball.dy = -ball.dy;
        }

        // 패들과 충돌 감지
        if (
            ball.y + ball.radius > paddle.y &&
            ball.x > paddle.x &&
            ball.x < paddle.x + paddle.width
        ) {
            ball.dy = -ball.dy;
        }

        // 바닥에 떨어졌을 때 게임 종료
        if (ball.y + ball.radius > canvas.height) {
            if (!isGameOver) {
                isGameOver = true;
                endGame();
            }
        }

        if (!isGameOver) {
            requestAnimationFrame(draw);
        }
    }

    function startGame() {
        startScreen.style.display = 'none';
        timerDisplay.style.display = 'block';
        timer = 0;
        timerValue.textContent = timer;
        isGameOver = false;

        timerInterval = setInterval(() => {
            timer++;
            timerValue.textContent = timer;
        }, 1000);

        draw();
    }

    function endGame() {
        clearInterval(timerInterval);
        timerDisplay.style.display = 'none';
        gameOverScreen.style.display = 'flex';
        scoreMessage.textContent = '경과 시간:'+ timer+'초';
    }

    function resetGame() {
        ball.x = canvas.width / 2;
        ball.y = canvas.height / 2;
        ball.dx = 4;
        ball.dy = -4;
        paddle.x = (canvas.width - paddle.width) / 2;
        isGameOver = false;
        gameOverScreen.style.display = 'none';
        startGame();
    }

    startButton.addEventListener('click', startGame);
    restartButton.addEventListener('click', resetGame);
</script>


</body>
</html>