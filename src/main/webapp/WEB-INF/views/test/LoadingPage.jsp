<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>

<style>
@font-face {
	font-family: 'UhBeeSe_hyun';
	src:
		url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* 로딩 화면 스타일 */
#loading-screen {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.loading-content {
	text-align: center;
	color: white;
}

.loading-content img.loading-image {
	width: 40%;
	max-width: 400px;
}

.loading-text {
	margin-top: 20px;
	font-size: 1.5rem;
	font-weight: bold;
}

.loading-text-cute {
	font-family: 'UhBeeSe_hyun';
	margin-top: 20px;
	font-size: 1.7rem;
}

/* 캔버스 스타일 */
#drawing-canvas {
	border: 1px solid black;
	background-color: white;
	width: 80%;
	height: auto;
	max-width: 1200px;
}

/* 브러쉬 및 버튼 스타일 */
.brush-controls input {
	margin: 10px;
}

.brush-e-button button {
	width: 90px;
	height: 30px;
	margin: 5px;
	font-size: 0.9rem;
	cursor: pointer;
}

.brush-color-button {
	width: 25px;
	height: 25px;
	border: solid 1px;
}

/* 반응형 스타일 */
@media ( max-width : 1200px) {
	.loading-content img.loading-image {
		width: 40%;
	}
	.loading-text, .loading-text-cute {
		font-size: 1.5rem;
	}
	#drawing-canvas {
		max-width: 900px;
	}
	.brush-controls button {
		width: 60px;
		height: 25px;
		font-size: 0.8rem;
	}
}

@media ( max-width : 768px) {
	.loading-content img.loading-image {
		width: 50%;
		max-width: 300px;
	}
	.loading-text, .loading-text-cute {
		font-size: 1.2rem;
	}
	#drawing-canvas {
		max-width: 600px;
	}
	.brush-controls button {
		width: 50px;
		height: 20px;
		font-size: 0.7rem;
	}
}
</style>

</head>
<body>

	<!-- 로딩 화면 -->
	<div id="loading-screen" style="display: none;">
		<div class="loading-content">
			<img src="/img/ARTI_Loading.gif" alt="로딩 중" class="loading-image" />
			<p class="loading-text">아이의 마음을 읽는 중입니다</p>
			<div class="brush-controls">
				브러쉬 크기 <input id="input" type="number" min="0" max="100" value="1">
				<button onclick="colorChange('black')" class="brush-color-button"
					style="background-color: black;"></button>
				<button onclick="colorChange('blue')" class="brush-color-button"
					style="background-color: blue;"></button>
				<button onclick="colorChange('red')" class="brush-color-button"
					style="background-color: red;"></button>
				<button onclick="colorChange('green')" class="brush-color-button"
					style="background-color: green;"></button>
				<button onclick="colorChange('pink')" class="brush-color-button"
					style="background-color: pink;"></button>
				<button onclick="colorChange('yellow')" class="brush-color-button"
					style="background-color: yellow;"></button>
				<button onclick="colorChange('skyblue')" class="brush-color-button"
					style="background-color: skyblue;"></button>
				<button onclick="colorChange('violet')" class="brush-color-button"
					style="background-color: violet;"></button>
				<button onclick="colorChange('lime')" class="brush-color-button"
					style="background-color: lime;"></button>
				<button onclick="colorChange('white')" class="brush-e-button">지우개</button>
				<button onclick="clearAll()" class="brush-e-button">전체지우기</button>
			</div>
			<canvas id="drawing-canvas" width="1600" height="900"></canvas>
			<p class="loading-text-cute">기다리면서 새로운 상상력을 펼쳐보세요!</p>
		</div>
	</div>








	<script>
		var pos = {
			drawable : false,
			x : -1,
			y : -1,
		};
		var canvas = document.getElementById('drawing-canvas');
		var ctx = canvas.getContext('2d');
		var rect = canvas.getBoundingClientRect(); // 터치 스크린

		//전체 지우기
		function clearAll() {
			ctx.clearRect(0, 0, canvas.width, canvas.height);
		}

		//스타일 추가
		input.oninput = function() {
			ctx.lineWidth = input.value;
		}
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';

		function colorChange(color) {
			ctx.strokeStyle = color;
		}

		canvas.addEventListener("mousedown", listener);
		canvas.addEventListener("mousemove", listener);
		canvas.addEventListener("mouseup", listener);
		canvas.addEventListener("mouseout", listener);

		/// 터치 스크린
		canvas.addEventListener("touchstart", listener);
		canvas.addEventListener("touchmove", listener);
		canvas.addEventListener("touchend", listener);

		function listener(e) {
			switch (e.type) {
			case "mousedown":
				drawStart(e);
				break;
			case "mousemove":
				if (pos.drawable) {
					draw(e);
				}
				break;
			case "mouseout":
			case "mouseup":
				drawEnd();
				break;
			case "touchstart":
				touchStart(e);
				break;
			case "touchmove":
				if (pos.drawable)
					touch(e);
				break;
			case "touchend":
				drawEnd();
				break;
			default:
			}
		}

		function drawStart(e) {
			pos.drawable = true;
			ctx.beginPath();

			const rect = canvas.getBoundingClientRect(); // 캔버스 위치 계산
			pos.x = (e.clientX - rect.left) * (canvas.width / rect.width);
			pos.y = (e.clientY - rect.top) * (canvas.height / rect.height);

			ctx.moveTo(pos.x, pos.y);
		}

		function draw(e) {
			if (!pos.drawable)
				return;

			const rect = canvas.getBoundingClientRect();
			pos.x = (e.clientX - rect.left) * (canvas.width / rect.width);
			pos.y = (e.clientY - rect.top) * (canvas.height / rect.height);

			ctx.lineTo(pos.x, pos.y);
			ctx.stroke();
		}

		function touchStart(e) {
			e.preventDefault(); // 기본 터치 이벤트 방지
			pos.drawable = true;
			ctx.beginPath();

			const rect = canvas.getBoundingClientRect();
			pos.x = (e.touches[0].clientX - rect.left)
					* (canvas.width / rect.width);
			pos.y = (e.touches[0].clientY - rect.top)
					* (canvas.height / rect.height);

			ctx.moveTo(pos.x, pos.y);
		}

		function touch(e) {
			if (!pos.drawable)
				return;
			e.preventDefault();

			const rect = canvas.getBoundingClientRect();
			pos.x = (e.touches[0].clientX - rect.left)
					* (canvas.width / rect.width);
			pos.y = (e.touches[0].clientY - rect.top)
					* (canvas.height / rect.height);

			ctx.lineTo(pos.x, pos.y);
			ctx.stroke();
		}

		function drawEnd() {
			pos.drawable = false;
			pos.x = -1;
			pos.y = -1;
		}
	</script>



</body>
</html>