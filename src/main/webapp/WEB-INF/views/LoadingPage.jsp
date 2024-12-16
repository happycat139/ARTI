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
src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
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
	background: rgba(0, 0, 0, 0.7); /* 반투명 검정색 */
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.loading-content {
	text-align: center;
	color: white;
}

.loading-content img {
	width: 50%; /* 기본: 화면 너비의 50% */
	max-width: 600px; /* 최대 크기 제한 */
	height: auto;
}

.ment {
	margin-top: 20px;
	font-size: 2rem; /* 기본 크기 */
	font-weight: bold;
}

.cute_ment {
	font-family: 'UhBeeSe_hyun';
	margin-top: 20px;
	font-size: 2rem
}

</style>

</head>
<body>

	<!-- 로딩 화면 -->
	<div id="loading-screen">
		<!-- 처음엔 숨김 -->
		<div class="loading-content">
			<img src="/img/ARTI_Loading.gif" alt="로딩 중" />
			<p class="ment">동화책 생성 중입니다</p>
			<div>
				브러쉬 크기<input id="input" type="number" min="0" max="100" value="1"></input>
				<button onclick="colorChange('black')"
					style="background-color: black; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('blue')"
					style="background-color: blue; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('red')"
					style="background-color: red; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('green')"
					style="background-color: green; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('pink')"
					style="background-color: pink; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('yellow')"
					style="background-color: yellow; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('skyblue')"
					style="background-color: skyblue; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('violet')"
					style="background-color: violet; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('lime')"
					style="background-color: lime; width: 25px; height: 25px; border: solid 1px;"></button>
				<button onclick="colorChange('white')">지우개</button>
				<button onclick="clearAll()">전체지우기</button>
			</div>

			<canvas id='canvas' width='1200' height='700'
				style="border: 1px solid black; background-color: white;"></canvas>
			<p class="cute_ment">기다리면서 새로운 상상력을 펼쳐보세요!</p>

		</div>
	</div>








	<script>
		var pos = {
			drawable : false,
			x : -1,
			y : -1,
		};
		var canvas = document.getElementById('canvas');
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
			pos.x = e.offsetX;
			pos.y = e.offsetY;
			ctx.moveTo(pos.x, pos.y);
		}
		function touchStart(e) {
			pos.drawable = true;
			ctx.beginPath();
			pos.x = e.touches[0].pageX - rect.left
			pos.y = e.touches[0].pageY - rect.top
			ctx.moveTo(pos.x, pos.y);
		}
		function draw(e) {
			ctx.lineTo(e.offsetX, e.offsetY);
			pos.x = e.offsetX;
			pos.y = e.offsetY;
			ctx.stroke();
		}
		function touch(e) {
			ctx.lineTo(e.touches[0].pageX - rect.left, e.touches[0].pageY
					- rect.top);
			pos.x = e.touches[0].pageX - rect.left;
			pos.y = e.touches[0].pageY - rect.top;
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