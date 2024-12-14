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
@font-face {
	font-family: 'STUNNING-Bd';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.content-wrapper {
	display: flex;
	flex-direction: column;
	width: 1140px;
	min-height: 760px;
	margin: 0 auto;
	padding: 50px 0;
	gap: 60px;
}

.headline-text {
	line-height: 42px;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	color: rgba(0, 0, 0, 0.8);
}

.subline-text {
	margin-top: 10px;
	line-height: 26px;
	font-size: 16px;
	text-align: center;
	color: rgba(0, 0, 0, 0.7);
}

/* 베스트 동화책 관련 CSS */
#best {
	display: flex;
	flex-direction: column;
	gap: 6px;
	width: 100%;
}

.p_bestBook {
	font-size: 18px;
	font-family: 'STUNNING-Bd';
	color: black;
	margin-top: 50px;
	padding-bottom: 10px;
}

#best .text-wrapper {
	display: flex;
	flex-direction: row;
	gap: 9px;
	align-items: center;
}

#best .text-wrapper img {
	height: 24px;
}

#best .text-wrapper div {
	line-height: 30px;
	font-size: 20px;
	font-weight: 500;
	letter-spacing: -0.12px;
	color: rgba(0, 0, 0, 0.8);
}

.book-wrapper.best {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* 각 행에 3개의 컬럼 */
	gap: 30px 21px; /* 각 동화책 사이의 간격 */
}

.book-wrapper.normal {
	display: grid;
	grid-template-columns: repeat(4, 1fr); /* 각 행에 4개의 컬럼 */
	gap: 20px; /* 각 동화책 사이의 간격 */
	margin: 40px 0;
}

.book_info.best1 {
	padding: 0 15px;
	aspect-ratio: 1/1.227;
	border-radius: 20px;
	position: relative;
	box-sizing: border-box;
	background-image:
		url('https://storage.googleapis.com/smhrd_arti/796f281f-3590-4f77-a2b5-7bba8b4dfdea.png');
	background-size: cover; /* 이미지가 컨테이너 크기에 맞게 조절 */
	background-position: center; /* 이미지 중심 배치 */
}

.book_info.best2 {
	padding: 0 15px;
	aspect-ratio: 1/1.227;
	border-radius: 20px;
	position: relative;
	box-sizing: border-box;
	background-image:
		url('https://storage.googleapis.com/smhrd_arti/3479ba51-8b8b-4acb-87bc-a1d20552313c.png');
	background-size: cover; /* 이미지가 컨테이너 크기에 맞게 조절 */
	background-position: center; /* 이미지 중심 배치 */
}

.book_info.best3 {
	padding: 0 15px;
	aspect-ratio: 1/1.227;
	border-radius: 20px;
	position: relative;
	box-sizing: border-box;
	background-image:
		url('https://storage.googleapis.com/smhrd_arti/1a8f0e51-00ac-4492-8dc7-41fd4a40ea66.png');
	background-size: cover; /* 이미지가 컨테이너 크기에 맞게 조절 */
	background-position: center; /* 이미지 중심 배치 */
}

img {
	vertical-align: middle;
	border-style: none;
}

.book_info.normal {
	display: flex;
	flex-direction: column; /* 위아래로 정렬 */
	border-radius: 20px;
	box-sizing: border-box;
	position: relative;
	overflow: hidden;
	height: 300px;
	box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.15);
	margin: 30px 0; /* 위아래 간격 추가 */
}

.book_top.best {
	background-image:
		url('https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-1.webp');
	background-size: cover; /* 이미지가 컨테이너 크기에 맞게 조절 */
	background-position: center; /* 이미지 중심 배치 */
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

.book_top.normal {
	flex: 3; /* 3:1 비율에서 위쪽 영역 */
	background-image:
		url('https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-1.webp');
	background-size: cover; /* 이미지가 컨테이너 크기에 맞게 조절 */
	background-position: center; /* 이미지 중심 배치 */
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

.book_bottom.best {
	text-align: left;
	padding: 10px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
}

.book_bottom.normal {
	flex: 0.5; /* 3:1 비율에서 아래쪽 영역 */
	background-color: white;
	text-align: left;
	padding: 10px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
}

.book_item {
	width: 100%;
	height: auto;
	aspect-ratio: 325/398;
	border-radius: 5.775% 1.8% 5.775% 4.975%;
	background-size: cover;
	background-position: center;
	margin: 17px auto 6px;
	position: relative;
	box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.15);
	overflow: hidden; /* 자식 요소가 넘치는 경우 숨기기 */
	text-align: left;
}

.coverimg-top-empty {
	width: 100%;
	height: auto;
	aspect-ratio: 270/43;
}

.booktitle-top-empty {
	width: 100%;
	height: auto;
	aspect-ratio: 270/15;
}

.book_bottom.best p {
	margin-top: 380px;
	padding: 0;
	font-size: 16px;
	color: white;
	font-family: 'STUNNING-Bd';
}

.book_bottom.normal p {
	margin: 0;
	padding: 0;
	font-size: 16px;
	color: black;
	font-family: 'STUNNING-Bd';
}

@media ( max-width : 1024px) {
	.book-wrapper.best {
		grid-template-columns: repeat(2, 1fr);
	}
	.book-wrapper.normal {
		grid-template-columns: repeat(3, 1fr); /* 화면이 작아지면 한 줄에 3개 */
	}
}

@media ( max-width : 768px) {
	.book-wrapper.best, .book-wrapper.normal {
		grid-template-columns: 1fr; /* 모바일에서는 한 줄에 1개 */
	}
}

/* page-wrapper 관련 CSS */
#page-wrapper {
	display: flex;
	flex-direction: row;
	justify-content: center;
	gap: 6px;
	height: 40px;
	margin-bottom: 128px;
}

.page-item {
	width: 40px;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	font-weight: 500;
	text-align: center;
	color: rgba(0, 0, 0, 0.5);
	cursor: pointer;
}

.page-item.active {
	color: blue;
	font-weight: 700;
	font-style: normal;
}

.page-item>img {
	vertical-align: middle;
	border-style: none;
}
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="SbHeader.jsp"%>

	<div class="content-wrapper">

		<div>
			<div class="headline-text">공개 갤러리</div>
			<div class="subline-text">다른 친구들이 만든 동화를 함께 봐요!</div>
		</div>

		<div id="best">

			<div class="text-wrapper">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/best_book/ic_best_sizeup.png">
				<div>베스트 동화책</div>
			</div>

			<!-- Best 동화책: 한 줄에 3개씩 표시 -->
			<div class="book-wrapper best">
				<!-- sample1 동화책 -->
				<div class="book_info best1"
					onclick="location.href='/arti/book/storybook?book_idx=67'">
					<div class="book_top best"></div>
					<div class="book_bottom best">
						<p>
							소피아와 마법의 바다<br>김예원
						</p>
					</div>
				</div>

				<!-- sample2 동화책 -->
				<div class="book_info best2" onclick="location.href='/arti/book/storybook?book_idx=134'">
					<div class="book_top best"></div>
					<div class="book_bottom best">
						<p>
							소피아와 마법의 바다<br>김예원
						</p>
					</div>
				</div>

				<!-- sample3 동화책 -->
				<div class="book_info best3" onclick="location.href='/arti/book/storybook?book_idx=72'">
					<div class="book_top best"></div>
					<div class="book_bottom best">
						<p>
							소피아와 마법의 바다<br>김예원
						</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Normal 동화책: 한 줄에 4개씩 표시, 위아래 3:1 비율로 나누기 -->
		<div class="book-wrapper normal">
			<c:forEach var="storybook" items="${storyBooks}" varStatus="status">
				<!-- 최대 12개의 항목만 보여줌 -->
				<c:if test="${status.index < 12}">
					<div class="book_info normal"
						onclick="location.href='/arti/book/storybook?book_idx=${storybook.book_idx}'">
						<div class="book_top normal"
							style="background-image: url('${storybook.book_thumbnail}');"></div>
						<div class="book_bottom normal">
							<p>${storybook.book_name}<br>${storybook.author}</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div id="page-wrapper">
			<div id="first" class="page-item" style="height: 20px;"
				onclick="location.href='gallery?page=1'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_first.png">
			</div>
			<div id="prev" class="page-item" style="height: 20px;"
				onclick="location.href='gallery?page=${currentPage > 1 ? currentPage - 1 : 1}'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_prev.png">
			</div>

			<!-- 페이지 번호 반복 -->
			<c:forEach begin="1" end="${totalPages}" var="page">
				<c:choose>
					<c:when test="${page eq currentPage}">
						<div id="" class="page-item active">${page}</div>
					</c:when>
					<c:otherwise>
						<div id="" class="page-item"
							onclick="location.href='gallery?page=${page}'">${page}</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<div id="next" class="page-item" style="height: 20px;"
				onclick="location.href='gallery?page=${currentPage < totalPages ? currentPage + 1 : totalPages}'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_next.png">
			</div>
			<div id="last" class="page-item" style="height: 20px;"
				onclick="location.href='gallery?page=${totalPages}'">
				<img
					src="https://storage.googleapis.com/smhrd_arti/ArtisBook/Gallery/page_wrap/ic_last.png">
			</div>
		</div>
	</div>


	<!-- Footer -->
	<%@ include file="SbFooter.jsp"%>
</body>
</html>
