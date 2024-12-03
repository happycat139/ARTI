<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/turn.min.js"></script>
<style>

@font-face {
    font-family: 'BookkMyungjo-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/BookkMyungjo-Bd.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}


body {
    margin: 0px;
    padding: 0px;
    font-family: "Noto Sans KR", sans-serif;
    background-color: #f7f7fc;
    box-sizing: border-box;
}

#book {
    width: 700px;
    height: 700px;
    margin: 5% auto;
}

#book .page {
    background: #fff;
    border: 1px solid #ccc;
    text-align: center;
}

.SbEdit_pBtn, .SbEdit_nBtn {
    cursor: pointer;
    display: inline-block;
    padding: 10px 20px;
    background-color: #1151ab;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    text-align: center;
}

.SbEdit_pBtn {
    float: left;
    margin-left: 10%;
}

.SbEdit_nBtn {
    float: right;
    margin-right: 10%;
}

.SbEdit_PageLeft, .SbEdit_PageRight, .SbEdit_PageLeft1,
	.SbEdit_PageRight1 {
	flex: 1;
	background-color: #fff;
	position: relative; /* 텍스트 중앙 정렬을 위한 설정 */
	display: flex; /* Flexbox를 사용하여 내부 요소를 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: center; /* 수평 중앙 정렬 */
	height: 100%; /* 부모 요소의 높이에 맞추기 */
	border-right: 1px solid rgba(0, 0, 0, 0.1);
}

.right-section {
	flex: 4.95;
	background-color: #fff;
	border: 1px solid black;
	border-color: #bdbbbb;
	display: flex; /* 내부 요소들을 나누기 위해 Flexbox 사용 */
	flex-direction: column; /* 세로로 배치 */
	justify-content: space-between; /* 각 섹션 사이에 동일한 간격 */
}

.SbEdit_BookThumb {
	flex: 3; 
}

.bottom-right {
	flex: 1; /* 세 개의 섹션이 동일한 높이를 가짐 */
	padding: 10px; /* 내부 여백 설정 */
	border-bottom: 1px solid #ccc; /* 섹션 구분을 위한 경계선 추가 */
}

.bottom-right {
	border-bottom: none; /* 마지막 섹션은 경계선 제거 */
}

.SbEdit_BookThumb_icon {
	width: 700px;
	height: 516px;
}


.SbEdit_BookMainTitle {
	margin: 50px 0 0 0;
	text-align: center;
	font-size: 32px;
	font-family: 'BookkMyungjo-Bd';
}

.SbEdit_BookMainWriter {
	text-align: center;
	font-family: "Nanum Myeongjo";
}

.SbEdit_Info2 {
	display: flex;
	margin-top: 150px;
}

.SbEdit_BackImg2 {
	width: 200px;
	height: 180px;
	margin-top: 180px;
}

.SbEdit_PImg {
	width: 110px;
	height: 50px;
	margin-right: 10px;
}

.Story_LastPage {
	background-color: #fff;
	padding-top: 80px;
	padding-left: 250px;
	
}

#book #p1 {
    background: #FFEDED;
    border: 1px solid #ccc;
    text-align: center;
}

#book #p26 {
    background: #FFEDED;
    border: 1px solid #ccc;
    text-align: center;
}

/* 페이지 세부 CSS */

#book #p2 {
	padding-top:330px;
	font-size: 32px;
	font-family: 'BookkMyungjo-Bd';
}

#book #p4, #p6, #p8, #p10, #p12, #p14, #p16, #p18, #p20, #p22, #p24 {
	padding-top:230px;
}

.SbSample_Image {
	width: 700px;
	height: 700px;
}

.SbSample_Content {
	font-family: "Nanum Myeongjo", serif;
    transform: rotate(0.04deg);
    font-size: 19px;
    font-style: normal;
    font-weight: 400;
    line-height: 31px;
    letter-spacing: 0.032px;
    padding: 50px;
}

</style>
</head>
<body>
<%@ include file="SbHeader.jsp" %>

    <!-- 이전 버튼 div -->
    <button class="SbEdit_pBtn">이전</button>
    
    <!-- 책 구조 -->
    <div id="book">
		<div class="right-section">
            <div class="SbEdit_BookThumb">
                <img class="SbEdit_BookThumb_icon" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-1.webp">
            </div>
            
            <div class="bottom-right" id="0">
                <p class="SbEdit_BookMainTitle" id="SbEdit_BookMainTitle">말하는 나무와 친구가 된 날</p>
                <p class="SbEdit_BookMainWriter">김예원 지음</p>
            </div>
		</div>
        <div class="page testPage" id="p1"></div>
        <div class="page" class="SbEdit_BookMainWriter" id="p2">말하는 나무와 친구가 된 날</div>
        <div class="page" id="p3">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-2.webp">
        </div>
        <div class="page" id="p4">
			<p class="SbSample_Content">
				조용하고 한적한 마을, 그곳에 다니엘이라는 호기심 많은 소년이 살고 있었어요. 
				다니엘은 매일같이 마을 뒷산의 작은 숲을 탐험하는 것을 좋아했답니다. 
				숲은 다니엘에게 마치 끝없는 놀이터 같았어요. 
				어느 날, 다니엘은 숲의 더 깊은 곳으로 들어가보기로 했어요.
			</p>
		</div>
        <div class="page" id="p5">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-3.webp">
        </div>
        <div class="page" id="p6">
        	<p class="SbSample_Content">
				다니엘은 숲속을 걷다가 거대한 나무를 발견했어요. 그 나무는 다른 나무들과 달리 매우 굵고 높았죠. 
				나무의 모습을 보고 놀라 멈춘 다니엘은 조심스럽게 다가갔어요. 그때 나무에서 낯선 목소리가 들렸어요. “안녕, 다니엘.”
			</p>
        </div>
        <div class="page" id="p7">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-4.webp">
        </div>
        <div class="page" id="p8">
        	<p class="SbSample_Content">
				다니엘은 깜짝 놀라며 주위를 둘러봤지만, 아무도 없었어요. 나무가 말하는 것 같다고 생각한 다니엘은 순간적으로 두려웠지만, 
				곧 용기를 내어 물었어요. “정말 네가 말하는 거야?” 나무는 부드럽게 웃으며 “그래, 난 말하는 나무야.”라고 대답했어요.
			</p>
        </div>
        <div class="page" id="p9">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-5.webp">
        </div>
        <div class="page" id="p10">
        	<p class="SbSample_Content">
				나무는 자신이 오랫동안 숲의 비밀을 지켜온 존재라고 다니엘에게 설명했어요. 그리고 외로움을 달래줄 친구가 필요하다고 했답니다. 
				다니엘은 나무의 이야기에 깊은 관심을 가졌어요. 나무가 들려주는 이야기는 마치 마법과도 같았죠.
			</p>
        </div>
        <div class="page" id="p11">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-6.webp">
        </div>
        <div class="page" id="p12">
        	<p class="SbSample_Content">
				다니엘은 나무와 친구가 되기로 마음먹고 매일 숲을 찾아갔어요. 하루는 나무에게 자신이 학교에서 있었던 재미있는 일을 이야기했어요. 
				나무는 다니엘에게 숲속에서 일어나는 신비한 일들도 들려주었답니다. 둘은 점차 가까워졌어요.
			</p>
        </div>
        <div class="page" id="p13">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-7.webp">
        </div>
        <div class="page" id="p14">
        	<p class="SbSample_Content">
				어느 날, 다니엘은 나무에게 친구가 많아지면 더 행복할 거라고 말했어요. 나무는 웃으며 대답했죠. 
				“진정한 친구는 많지 않아도 돼. 중요한 건 서로의 마음을 이해해주는 거야.” 다니엘은 이 말을 듣고 깊이 생각하게 되었어요.
			</p>
        </div>
        <div class="page" id="p15">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-8.webp">
        </div>
        <div class="page" id="p16">
        	<p class="SbSample_Content">
				이제 다니엘은 나무에게서 배운 것을 마을 친구들과 나누기 시작했어요. 친구들은 다니엘이 들려주는 숲의 이야기들에 귀를 기울였어요. 
				다니엘은 나무와의 대화 덕분에 자연과 더 가깝게 느껴졌고, 친구들에게도 더 다정해졌어요.
			</p>
        </div>
        <div class="page" id="p17">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-9.webp">
        </div>
        <div class="page" id="p18">
        	<p class="SbSample_Content">
				날이 갈수록 다니엘은 나무에게 더 많은 것을 배웠어요. 나무는 계절에 따라 숲이 어떻게 변하는지 이야기해주고, 
				동물들의 비밀스러운 생활도 알려주었죠. 다니엘은 이런 이야기를 통해 자연의 아름다움을 발견하게 되었어요.
			</p>
        </div>
        <div class="page" id="p19">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-10.webp">
        </div>
        <div class="page" id="p20">
        	<p class="SbSample_Content">
				하지만 시간이 지나면서 다니엘은 더 이상 나무를 찾아가지 않았어요. 다른 일들로 바빠졌기 때문이었죠. 
				어느 날, 다니엘은 문득 나무가 보고 싶어졌어요. 다시 나무를 찾아가면서 다니엘은 나무와의 추억을 떠올렸어요.
			</p>
        </div>
        <div class="page" id="p21">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-11.webp">
        </div>
        <div class="page" id="p22">
        	<p class="SbSample_Content">
				다니엘이 오랜만에 나무를 찾아가자, 나무는 반갑게 맞이했어요. 다니엘은 오랜만에 말을 걸며 미안한 마음을 표현했어요. 
				나무는 웃으며 “친구라면 언제든지 다시 돌아올 수 있는 거야.”라고 말하며 다니엘을 안심시켰어요.
			</p>
        </div>
        <div class="page" id="p23">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-12.webp">
        </div>
        <div class="page" id="p24">
        	<p class="SbSample_Content">
				다니엘은 나무와의 우정을 다시 한 번 소중하게 느꼈어요. 나무는 다니엘에게 끝없는 사랑과 우정의 중요성을 가르쳐주었어요. 
				다니엘은 나무와의 추억을 언제나 간직할 것이며, 언제까지나 나무와의 우정을 이어나가기로 결심했답니다.
			</p>
        </div>
        <div class="page" id="p25">
        	<div class="SbEdit_PageLeft">
				<div class="SbEdit_info">
					<img class="SbEdit_BackImg2" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-1.webp"> <br>
					<p>말하는 나무와 친구가 된 날</p><br> 
					<b>발행일</b> 2024년 12월 2일<br> 
					<b>지은이</b> 김예원<br> 
					<b>제 작</b> ARTI <br>

					<div class="SbEdit_Info2">
						<img class="SbEdit_PImg" src="/img/ArtiLogo.png">
						<div>
							서울특별시 서초구 동작대로 132 9층 스마트인재개발원 <br> www.arti.com | ARTI
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="page" id="p26"></div>
        
        <div class="Story_LastPage" id="last">
            <img class="SbEdit_BackImg2" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-1.webp">
		</div>
    </div>

    <!-- 다음 버튼 div -->
    <button class="SbEdit_nBtn">다음</button>

    <script>
    $(document).ready(function () {
        $("#book").turn({
            width: 1400, // 책의 너비
            height: 700, // 책의 높이
            autoCenter: true, // 책 중앙 정렬
            gradient: true, // 페이지 말아지는 그림자 활성화
            corners: "tl, tr, bl, br", // 모든 모서리에서 넘기기 가능
        });

        // 이전 버튼
        $(".SbEdit_pBtn").click(function () {
            $("#book").turn("previous");
        });

        // 다음 버튼
        $(".SbEdit_nBtn").click(function () {
            $("#book").turn("next");
        });
    });

    </script>
</body>
</html>
s