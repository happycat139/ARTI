<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="stylesheet" href="/css/StoryBook/SbOutLine.css">
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
    <%@ include file="SbCreateHeader.jsp" %>
	<div class="SO_Page">
		<div>
			<div>
				<div class="SO_Title outline">혜성 작가님이 적은 내용으로 줄거리를 만들었어요.</div>
				<div class="SO_SubTitle outline">AI와 함께 줄거리를 수정하면서 원하는 내용으로 바꿔 보아요.</div>
			</div>
			
			<div class="SO_Container">
				<div class="SO_ElementBox">
					<div class="SO_ElementCon">
						<div class="SO_label small">제목</div>
						<div class="SO_element">숲속의 용사, 동물 친구들</div>
					</div>
					<div class="SO_ElementCon">
						<div class="SO_label small">장르</div>
						<div class="SO_element">어린이 모험 이야기</div>
					</div>
					<div class="SO_ElementCon">
						<div class="SO_label small">배경</div>
						<div class="SO_element">현대의 한적한 숲속 마을</div>
					</div>
					<div class="SO_ElementCon">
						<div class="SO_label small">주제</div>
						<div class="SO_element">서로 다른 존재들과의 소통과 협력의 중요성</div>
					</div>
					<div class="SO_ElementCon">
						<div class="SO_label small">주인공</div>
						<div class="SO_element">용감한 소년 민준</div>
					</div>
				</div>
				<div class="SO_OutlineBox">
					<div class="SO_label medium">줄거리1</div>
					<div class="SO_Content">
						숲속 마을에 사는 소년 민준이는 어느 날 우연히 숲속에서 길을 잃은 작은 여우를 발견한다.
						민준이는 여우를 도와주며 숲속의 동물들과 친구가 된다. 동물들은 민준이에게 자신들의 언어를 가르쳐 주고, 
						민준이는 동물들과 함께 마을을 위협하는 큰 위기에 맞서 싸우게 된다. 
						과연 민준이는 동물 친구들과 함께 마을을 구할 수 있을까?
					</div>
				</div>
			</div>
		</div>
		<div class="SO_button-container">
			<button class="SO_modifyBtn">
				<img src="/img/ic_make.png" class="SO_modifyIcon">
				줄거리 수정
			</button>
			<div class="SO_pagination">
				<img alt="이전버튼">
				<div class="SO_PageLabel"></div>
				<img alt="다음버튼">
			</div>
			<button class="SO_submitBtn outline">
				선택한 줄거리로 플롯 생성
				<img alt="다음버튼?" class="SO_nextIcon">
			</button>
		</div>
	</div>
    
</body>
</html>
