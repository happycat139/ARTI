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

.ex1 {
	display: flex;
	vertical-align: middle;
	align-items: center;
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
    background-color: white;
    color: black;
    border: none;
    border-radius: 50%;
    font-size: 16px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    max-width: 100%; /* 이미지가 버튼 크기를 넘지 않도록 설정 */
    max-height: 100%;
    object-fit: contain; /* 이미지 크기를 버튼 안에 맞게 조정 */ 
}

.SbEdit_pBtn {
    float: left;
    margin-left: 10%;
    width: 60px;
    height: 60px;
}

.SbEdit_nBtn {
    float: right;
    margin-right: 10%;
    width: 60px;
    height: 60px;
}

.SbEdit_PageLeft {
	flex: 1;
	background-color: #fff;
	position: relative;
	display: flex; 
	align-items: center; 
	justify-content: left; 
	height: 100%;
	border-right: 1px solid rgba(0, 0, 0, 0.1);
}

.SbEdit_PageRight, .SbEdit_PageLeft1,
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
	margin: 20px 0 0 0;
	text-align: center;
	font-size: 32px;
	font-family: 'BookkMyungjo-Bd';
}

.SbEdit_BookMainWriter {
	text-align: center;
	font-family: "Nanum Myeongjo";
}

.SbEdit_info {
	text-align: left;
	margin-left: 30px;
}

.SbEdit_Info2 {
	display: flex;
	margin-top: 70px;
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

#book #cover, #last {
    align-items: center;
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

<div class="ex1">

    <!-- 이전 버튼 div -->
    <button class="SbEdit_pBtn">
    	<img src="/img/prev-grey.svg">
    </button>
    
    <!-- 책 구조 -->
    <div id="book">
		<div class="right-section">
            <div class="SbEdit_BookThumb">
                <img class="SbEdit_BookThumb_icon" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-1.webp">
            </div>
            
            <div class="bottom-right" id="cover">
                <p class="SbEdit_BookMainTitle" id="SbEdit_BookMainTitle">소피아와 마법의 바다</p>
                <p class="SbEdit_BookMainWriter">이혜성 지음</p>
            </div>
		</div>
        <div class="page testPage" id="p1"></div>
        <div class="page" class="SbEdit_BookMainWriter" id="p2">소피아와 마법의 바다</div>
        <div class="page" id="p3">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-2.webp">
        </div>
        <div class="page" id="p4">
			<p class="SbSample_Content">
				우리는 현대의 작은 마을에 사는 소피아라는 호기심 많은 소녀와 만나게 됩니다. 
				어느 날 소피아는 할머니에게서 마법의 숲에 관한 이야기를 듣게 됩니다. 
				그 숲은 아름답고 신비로운 생물로 가득하다는데, 전설처럼 들렸어요.
			</p>
		</div>
        <div class="page" id="p5">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-3.webp">
        </div>
        <div class="page" id="p6">
        	<p class="SbSample_Content">
				이야기에 매료된 소피아는 숲을 직접 탐험하고 싶어졌습니다. 그래서 작은 배낭에 간식과 필요한 것들을 챙기고 집을 나섭니다. 설레는 마음으로 길을 나선 소피아는 마침내 숲에 도착합니다. 그녀의 모험이 시작된 것입니다.

			</p>
        </div>
        <div class="page" id="p7">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-4.webp">
        </div>
        <div class="page" id="p8">
        	<p class="SbSample_Content">
				숲에 들어서자 소피아는 반짝이는 나비들과 말을 하는 다람쥐를 만나게 됩니다. 처음에는 놀랐지만, 이내 흥미진진한 대화에 빠지게 됩니다. 그곳의 모든 것이 너무나도 신비롭고 매력적이었습니다.
			</p>
        </div>
        <div class="page" id="p9">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-5.webp">
        </div>
        <div class="page" id="p10">
        	<p class="SbSample_Content">
				그러던 중 소피아는 숲 깊은 곳에 사악한 마법사가 마법의 나무를 위협하고 있다는 사실을 알게 됩니다. 이 소식을 들은 소피아는 두려움보다는 나무를 지켜야겠다는 용기가 생겼습니다.
			</p>
        </div>
        <div class="page" id="p11">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-6.webp">
        </div>
        <div class="page" id="p12">
        	<p class="SbSample_Content">
				소피아는 자신의 새로운 친구인 다람쥐와 토끼에게 도움을 청하게 됩니다. 함께라면 사악한 마법사에 맞설 수 있다는 믿음이 있었기 때문입니다. 그들은 곧바로 계획을 세우기 시작합니다.
			</p>
        </div>
        <div class="page" id="p13">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-7.webp">
        </div>
        <div class="page" id="p14">
        	<p class="SbSample_Content">
				소피아와 친구들은 마법사를 상대하기 위해 필요한 물건들을 찾기로 합니다. 숲을 탐험하며 그들은 협동의 중요성을 배우고, 서로의 특별한 능력을 발견하게 됩니다.
			</p>
        </div>
        <div class="page" id="p15">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-8.webp">
        </div>
        <div class="page" id="p16">
        	<p class="SbSample_Content">
				탐험 도중, 그들은 친절한 마녀를 만나 도움을 받게 됩니다. 마녀는 필요한 마법 아이템을 마련해주며, 그들이 직면한 위협에 맞설 수 있도록 도와줍니다. 소피아와 친구들은 희망을 품고 떠납니다.

			</p>
        </div>
        <div class="page" id="p17">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-9.webp">
        </div>
        <div class="page" id="p18">
        	<p class="SbSample_Content">
				여정 중 소피아와 동료들은 여러 가지 난관에 부딪히지만, 서로 의지하며 문제를 해결합니다. 그 과정에서 소피아는 점점 더 용기를 얻게 되고, 친구들과의 유대감을 깊이 느낍니다.
			</p>
        </div>
        <div class="page" id="p19">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-10.webp">
        </div>
        <div class="page" id="p20">
        	<p class="SbSample_Content">
				마침내 마법사가 있는 곳에 도착한 소피아와 친구들은 지혜와 용기로 힘을 합쳐 마법사를 물리칩니다. 사악한 마법사의 계략을 막았으니 마법의 나무는 무사할 것입니다.
			</p>
        </div>
        <div class="page" id="p21">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-11.webp">
        </div>
        <div class="page" id="p22">
        	<p class="SbSample_Content">
				숲은 다시 평화로워졌고, 소피아와 친구들의 모험은 성공적으로 끝이 납니다. 소피아는 큰 성과와 함께 집으로 돌아갑니다. 이번 여정을 통해 그녀는 진정한 용기와 협동의 가치를 깨달았습니다.
			</p>
        </div>
        <div class="page" id="p23">
        	<img class="SbSample_Image" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-12.webp">
        </div>
        <div class="page" id="p24">
        	<p class="SbSample_Content">
				집으로 돌아온 소피아는 자신의 모험을 가족과 친구들에게 이야기합니다. 그 이야기를 들은 사람들은 모두 기뻐하며, 소피아의 용기와 지혜를 칭찬합니다. 이렇게 그녀의 이야기는 오랜 기억으로 남게 됩니다.
			</p>
        </div>
        <div class="page" id="p25">
        	<div class="SbEdit_PageLeft">
				<div class="SbEdit_info">
					<img class="SbEdit_BackImg2" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-1.webp"> <br>
					<p>소피아와 마법의 바다</p><br> 
					<b>발행일</b> 2024년 12월 3일<br> 
					<b>지은이</b> 이혜성<br> 
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
            <img class="SbEdit_BackImg2" src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-1.webp">
		</div>
    </div>

    <!-- 다음 버튼 div -->
    <button class="SbEdit_nBtn">
    	<img src="/img/next-grey.svg">
    </button>
</div>

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
