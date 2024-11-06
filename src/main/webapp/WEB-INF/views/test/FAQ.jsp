<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@font-face {
	font-family: 'STUNNING-Bd';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.TI_Header>h1 {
	color: rgb(34, 34, 34);
	font-size: 20px;
	line-height: 40px;
	letter-spacing: -0.5px;
	font-family: 'STUNNING-Bd';
}

.TI_SubContent {
	color: gray;
	margin-top: 5px;
	font-family: 'STUNNING-Bd';
}

.TI-Content-Container {
	width: 1010px;
	height: 480px;
	margin-top: 20px;
	padding: 15px 10px 10px 20px;
	border: 1px solid #ddd; /* 테두리 설정 */
	border-radius: 15px; /* 둥근 모서리 설정 */
	background-color: #ffffff; /* 배경색 설정 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 살짝 그림자 효과 */
	overflow-y: auto; /* 스크롤 활성화 */
}

.TI-Content-Container>p {
	color: rgb(34, 34, 34);
	font-size: 17px;
	line-height: 40px;
	letter-spacing: 0px;
	font-family: 'STUNNING-Bd';
}

.TI2 {
	padding-top: 5px;
}

.TI-FAQs {
	padding: 30px;
}

.TI-FAQ {
	border: 1px solid #ddd; /* 부드러운 테두리 */
	padding: 15px; /* 넉넉한 여백 */
	width: 100%;
	margin-bottom: 15px;
	border-radius: 10px; /* 둥근 모서리 */
	background-color: #f9f9f9; /* 연한 배경색 */
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1); /* 은은한 그림자 효과 */
	font-family: 'STUNNING-Bd'; /* 글꼴 적용 */
	font-size: 16px; /* 텍스트 크기 조정 */
	color: #222; /* 텍스트 색상 조정 */
	line-height: 1.5; /* 행간 조정 */
}

.TI-FAQ:hover {
	background-color: #eef5f9; /* 마우스 오버 시 배경색 변화 */
	border-color: #ccc; /* 마우스 오버 시 테두리 색상 변화 */
	cursor: pointer; /* 포인터 커서 추가 */
	transform: scale(1.02); /* 살짝 확대 효과 */
	transition: background-color 0.3s, transform 0.3s; /* 부드러운 전환 효과 */
}

/* 모달 스타일 */
.modal {
	display: none; /* 처음엔 숨김 */
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
}

.modal-content h2 {
	margin: 0; /* 기본 여백 제거 */
	font-size: 24px; /* 제목 크기 조정 */
	color: #333; /* 제목 색상 */
}

.modal-content p {
	margin-top: 10px; /* 본문과 제목 사이 여백 */
	font-size: 18px; /* 본문 크기 조정 */
	color: #555; /* 본문 색상 */
	line-height: 1.8; /* 행간 조정 */
	flex-grow: 1; /* 본문이 남은 공간을 차지하도록 설정 */
}

.modal-text {
	margin-top: 20px;
	border: 1px solid #ddd; /* 테두리 */
	border-radius: 10px; /* 둥근 모서리 */
	padding: 20px; /* 여백 */
	background-color: #f9f9f9; /* 배경색 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	height: 470px; /* 높이를 자동으로 설정 */
}

/* 어두운 배경과 흐림 효과 추가 */
.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 어두운 배경 효과 */
	backdrop-filter: blur(5px); /* 흐림 효과 */
	display: none; /* 초기에는 숨김 */
	z-index: 999; /* 모달 창 뒤쪽에 배치 */
}

.modal-content {
    background-color: #fff;
    margin: 8% auto;
    padding: 40px;
    border-radius: 10px;
    max-width: 900px; /* 최대 너비 제한 */
    min-height: 600px; /* 최소 높이 설정 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    font-family: 'STUNNING-Bd';
    color: #333;
    text-align: left;
    position: relative; /* 추가된 부분 */
}

.close {
    color: #aaa;
    position: absolute; /* 추가된 부분 */
    top: 20px; /* 상단 여백 */
    right: 20px; /* 오른쪽 여백 */
    font-size: 33px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover, .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
<body>
<body>

	<!-- 어두운 배경을 위한 오버레이 -->
	<div class="modal-overlay" id="modal-overlay"></div>

	<section class="TestInfo-Container">
		<div class="TI-View-Box">
			<header class="TI_Header">
				<h1>자주 묻는 질문</h1>
				<p class="TI_SubContent">궁금한게 있으신가요?</p>
			</header>
			<div class="TI-Container">
				<div class="TI-Content-Container">
					<div class="TI-FAQs">
						<div class="TI-FAQ" onclick="openModal('modal1')">
							<p>1. 검사는 어떤 도구를 사용해야 하나요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal2')">
							<p>2. 검사 과정은 어떻게 되나요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal3')">
							<p>3. 검사 비용은 얼마인가요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal4')">
							<p>4. 어떤 그림을 그려야 하나요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal5')">
							<p>5. 그림을 그리는 데 소요되는 시간은 얼마나 되나요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal6')">
							<p>6. 그림을 그린 후 결과는 어떻게 받을 수 있나요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal7')">
							<p>7. 검사 결과는 어떻게 활용되나요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal8')">
							<p>8. 어떤 연령대의 아이들이 이 검사를 받을 수 있나요?</p>
						</div>
						<div class="TI-FAQ" onclick="openModal('modal9')">
							<p>9. 그림을 여러 번 그려도 되나요?</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 모달 1 -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal1')">&times;</span>
			<h2>Q. 검사는 어떤 도구를 사용해야 하나요?</h2>
			<div class="modal-text">
				<p>A. 본 심리검사는 연필과 종이를 사용하여 진행됩니다. 그림을 그리는 도구는 연필, 색연필, 또는 수채화 물감 등 자유롭게 선택하실 수 있습니다. 단, 흑백 그림을 권장합니다.</p>
			</div>
		</div>
	</div>

	<!-- 모달 2 -->
	<div id="modal2" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal2')">&times;</span>
			<h2>Q. 검사 과정은 어떻게 되나요?</h2>
			<div class="modal-text">
				<p>A. 검사를 원하시는 경우, 저희 웹사이트에 접속하여 주어진 주제에 따라 그림을 그린 후, 해당 이미지를 업로드해 주시면 됩니다. 그림이 제출되면, AI 시스템이 이를 분석하여 결과를 제공하게 됩니다.
				</p>
			</div>
		</div>
	</div>

	<!-- 모달 3 -->
	<div id="modal3" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal3')">&times;</span>
			<h2>Q. 검사 비용은 얼마인가요?</h2>
			<div class="modal-text">
				<p>A. 본 서비스는 무료로 제공됩니다. 이용자는 그림을 제출하고, 그에 대한 심리 분석 결과를 무료로 받을 수 있습니다.</p>
			</div>
		</div>
	</div>

	<!-- 모달 4 -->
	<div id="modal4" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal4')">&times;</span>
			<h2>Q. 어떤 그림을 그려야 하나요?</h2>
			<div class="modal-text">
				<p>A. 아이는 집, 사람, 나무 등의 그림을 그릴 수 있습니다. 각각의 그림은 아이의 심리적 상태를 반영하며, 더욱 깊이 있는 분석을 위해 다양한 감정을 표현하는 것이 좋습니다.</p>
			</div>
		</div>
	</div>

	<!-- 모달 5 -->
	<div id="modal5" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal5')">&times;</span>
			<h2>Q. 그림을 그리는 데 소요되는 시간은 얼마나 되나요?</h2>
			<div class="modal-text">
				<p>A. 그림의 복잡성에 따라 다르지만, 일반적으로 30분에서 1시간 정도 소요됩니다. 아이가 편안하게 그릴 수 있도록 여유 시간을 두는 것이 좋습니다.</p>
			</div>
		</div>
	</div>

	<!-- 모달 6 -->
	<div id="modal6" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal6')">&times;</span>
			<h2>Q. 그림을 그린 후 결과는 어떻게 받을 수 있나요?</h2>
			<div class="modal-text">
				<p>A. 그림을 제출하신 후, 약 1~2일 이내에 분석 결과를 이메일 또는 웹사이트 내 메시지로 전달해 드립니다. 결과는 상세한 심리 분석 리포트 형태로 제공됩니다.</p>
			</div>
		</div>
	</div>

	<!-- 모달 7 -->
	<div id="modal7" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal7')">&times;</span>
			<h2>Q. 검사 결과는 어떻게 활용되나요?</h2>
			<div class="modal-text">
				<p>A. 검사를 통해 얻은 결과는 아이의 감정 및 심리적 상태를 이해하는 데 도움을 줄 수 있습니다. 결과를 바탕으로 필요한 지원이나 상담이 필요할 경우, 전문적인 도움을 요청할 수 있습니다.</p>
			</div>
		</div>
	</div>

	<!-- 모달 8 -->
	<div id="modal8" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal8')">&times;</span>
			<h2>Q. 어떤 연령대의 아이들이 이 검사를 받을 수 있나요?</h2>
			<div class="modal-text">
				<p>A. 이 심리검사는 4세 이상의 어린이들이 받을 수 있습니다. 어린아이가 스스로 그림을 그릴 수 있는 나이라면, 모든 연령대의 아이들이 참여할 수 있습니다. 각 연령대에 맞춰 해석이 달라질 수 있으니, 결과는 전문가의 도움을 통해 이해하는 것이 좋습니다.</p>
			</div>
		</div>
	</div>

	<!-- 모달 9 -->
	<div id="modal9" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('modal9')">&times;</span>
			<h2>Q. 그림을 여러 번 그려도 되나요?</h2>
			<div class="modal-text">
				<p>A. 네, 아이가 그림을 여러 번 그려 제출하는 것은 가능합니다. 각 그림은 서로 다른 감정을 반영할 수 있으며, 이를 통해 더 다양한 분석 결과를 얻을 수 있습니다. 하지만 최종적으로 제출할 그림을 선택할 때는 아이와 함께 고민해 보는 것이 좋습니다.</p>
			</div>
		</div>
	</div>

	<script>
//모달 열기 함수
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    const overlay = document.getElementById('modal-overlay'); // 오버레이 요소
    if (modal) {
        modal.style.display = "block";
        overlay.style.display = "block"; // 오버레이 보이기
    }
}

// 모달 닫기 함수
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    const overlay = document.getElementById('modal-overlay'); // 오버레이 요소
    if (modal) {
        modal.style.display = "none";
        overlay.style.display = "none"; // 오버레이 숨기기
    }
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    const modals = document.querySelectorAll('.modal');
    const overlay = document.getElementById('modal-overlay'); // 오버레이 요소
    modals.forEach(modal => {
        if (event.target == modal || event.target == overlay) {
            modal.style.display = "none";
            overlay.style.display = "none";
        }
    });
};

</script>


</body>


</html>