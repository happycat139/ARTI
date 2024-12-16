<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
<style>

@font-face {
    font-family: 'UhBeeSe_hyun';
    src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
    font-weight: normal;
    font-style: normal;
   }

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
    height: 1200px;
}

.left-panel {
    flex: 1;
    text-align: center;
    padding-top: 10%;
}

.left-panel p {
    font-size: 50px;
	font-family: 'UhBeeSe_hyun';
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
    margin-top: 3%;
    padding: 0 30px;
    height: 90%; 
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
    align-items: center;
    text-align: center; 
    gap: 10px;
    padding: 0 20px;
}

.top-label h1 {
	font-size: 50px;
	font-family: 'UhBeeSe_hyun';
}

.score-top-label {
    display: flex;
    flex-direction: column; 
    align-items: center; 
    margin-bottom: 10px;
    padding-top: 60px;
    font-size: 30px;
    font-family: 'UhBeeSe_hyun';
}

.score-top-label h3 {
    font-size: 24px;
    font-weight: bold;
    margin: 0;
    text-align: center; 
}

.score-top-label p {
	padding-top: 50px;
    margin: 5px 0 0; 
    font-size: 18px;
    font-weight: bold;
    text-align: center;
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

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

.modal-header h2 {
    margin: 0;
    font-size: 1.5em;
    font-weight: bold;
}

.modal-header .close {
    font-size: 1.5em;
    cursor: pointer;
}


/* 모달 바디 */
.modal-body {
    display: flex;
    flex-direction: column;
    gap: 20px;
    position: relative;
    padding-bottom: 80px;
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
    border-radius: 10px;
}

/* 닫기 버튼 */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* 업로드란 */
.upload-area {
    border: 2px dashed #888;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    cursor: pointer;
    margin: 20px;
    height: 250px;
}

.upload-area:hover {
    background-color: #f9f9f9;
}

#fileName {
    display: block !important; /* 강제로 화면에 표시 */
    visibility: visible !important; /* 숨겨진 상태 해제 */
    color: #555;
    font-size: 1em;
    margin-top: 10px;
    white-space: nowrap;
}

#fileInput {
    opacity: 0;
    position: absolute;
    width: 0;
    height: 0;
}

/* 업로드 버튼 스타일 */
#uploadButton {
    position: absolute;
    bottom: 0px;
    right: 20px; 
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

#uploadButton:hover {
    background-color: #0056b3;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%@ include file="Header.jsp"%>

<main>
    <div class="container">
    
    	<!-- 왼쪽 패널 -->
        <div class="left-panel">
            <!-- 사용자 업로드 이미지 -->
            <p> 예시그림 </p>
            <img src="https://storage.googleapis.com/smhrd_arti/HTP/Upload/43758c28-3b4b-44c6-8afb-0975590fa913_%EC%A0%9C%EB%AA%A9%20%EC%97%86%EC%9D%8C.png" alt="사용자 업로드 이미지">
        </div>
        
        <!-- 오른쪽 패널 -->
        <div class="right-panel">
        
        	<div class="top-label">
        		<h1>ARTI HTP 검사</h1>
			</div>
            
            <div class="score-section">
    			<div class="score-top-label"> 
	    			설명서
	    			<p>
	    			
	    				1. 집, 나무 , 사람 (남자, 여자)가 들어간 그림을 자유롭게 그려주세요 !
	    			
	    				<br>
	    				
	    				( 예시 그림을 참고해주세요. )
	    			
	    			</p>
   		 			<p>
   		 			
   		 			2. 사진을 찍어 업로드 해주세요 !!
   		 			<br>
   					( 최대한 그림자가 지지 않게 찍어주세요 ! )
   		 			
   		 			</p>
    				<p></p>
    			</div>
			</div>
			
			<div class="modal-body">
            	<form id="uploadForm" action="/htp/upload" method="post" enctype="multipart/form-data">
                <div class="upload-area" id="uploadArea">
                    <input type="file" id="fileInput" name="file" accept="image/*" required>	
                    <p>이미지를 선택하거나 여기에 드래그하세요.</p>
                </div>
                <div id="fileNameContainer" style="text-align: center; margin-top: 20px;">
    				<span id="fileName" style="font-size: 1em; color: #555;">파일이 선택되지 않았습니다.</span>
				</div>
                <button type="submit" id="uploadButton">업로드</button>
            	</form>
        	</div>
        	
        	<div class="score-section">
    			<div class="score-top-label"> 
	    			주의사항
	    			<p>
	    				아직 베타 버전이기 때문에 결과는 비교적 정확하지 않을 수 있습니다 !
	    			</p>
   		 			<p>
   		 				컴퓨터나 태블릿의 그림판 기능을 사용하여 업로드해도 무관합니다 !!
   		 			</p>
    				<p></p>
    			</div>
			</div>
        </div>
    </div>
</main>
<%@ include file="Footer.jsp"%>
<script>

function openModal() {
    document.getElementById('myModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('myModal').style.display = 'none';
}

/* 파일 업로드 이벤트 처리 */
const uploadArea = document.getElementById('uploadArea');
const fileInput = document.getElementById('fileInput');
const fileNameSpan = document.getElementById('fileName');

/* 드래그 앤 드롭 및 파일 선택 핸들러 */
uploadArea.addEventListener('click', () => {
    console.log("uploadArea 클릭 이벤트 발생"); // 디버깅용
    fileInput.click(); // 클릭 시 파일 선택 창 열기
});

fileInput.addEventListener('change', (event) => {
    console.log("파일 선택 이벤트 발생"); // 디버깅용
    const file = event.target.files[0];
    if (file) {
        fileNameSpan.textContent = `선택된 파일: ${file.name}`;
        fileNameSpan.style.display = "block"; // 강제로 표시
        fileNameSpan.style.visibility = "visible"; // 숨겨진 상태 해제
        console.log("선택된 파일 이름:", file.name); // 디버깅용
    } else {
        fileNameSpan.textContent = '파일이 선택되지 않았습니다.';
        fileNameSpan.style.display = "block"; // 초기화 시에도 표시
        console.log("파일 선택 취소"); // 디버깅용
    }
});

uploadArea.addEventListener('dragover', (event) => {
    console.log("dragover 이벤트 발생"); // 디버깅용
    event.preventDefault(); // 기본 드래그 동작 방지
    uploadArea.style.backgroundColor = '#f0f0f0'; // 드래그 중 스타일 변경
});

uploadArea.addEventListener('dragleave', () => {
    console.log("dragleave 이벤트 발생"); // 디버깅용
    uploadArea.style.backgroundColor = ''; // 드래그 종료 시 스타일 초기화
});

uploadArea.addEventListener('drop', (event) => {
    console.log("drop 이벤트 발생"); // 디버깅용
    event.preventDefault(); // 기본 드롭 동작 방지
    uploadArea.style.backgroundColor = ''; // 드래그 종료 시 스타일 초기화

    const files = event.dataTransfer.files;
    console.log("드롭된 파일 개수:", files.length); // 디버깅용
    if (files.length > 0) {
        const file = files[0];
        fileNameSpan.textContent = `선택된 파일: ${file.name}`;
        console.log("드래그 앤 드롭 파일 이름:", file.name); // 디버깅용
    } else {
        fileNameSpan.textContent = '파일이 선택되지 않았습니다.';
        console.log("드래그 앤 드롭 실패 또는 파일 없음"); // 디버깅용
    }
});
</script>

</body>
</html>

