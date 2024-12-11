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
}

.p_pagetitle {
	font-size: 14px;
	color: rgba(0, 0, 0, 0.6);
}

.p_greeting {
	font-size: 22px;
	font-weight: bold;
	color: #283890;
}

.book-wrapper {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* 각 행에 3개의 컬럼 */
	gap: 30px 21px; /* 각 동화책 사이의 간격 */
	margin: 40px 0;
}

.book_info {
	padding: 0 15px;
	aspect-ratio: 1/1.227;
	border-radius: 20px;
	position: relative;
	box-sizing: border-box;
}

.create_book {
	width: 100%;
	height: auto;
	aspect-ratio: 1/1.234;
	margin: 17px auto 6px;
	padding: 10px;
	background: transparent;
	border: 2px dashed rgba(0, 0, 0, 0.15);
	border-radius: 26px;
	position: relative;
	cursor: pointer;
	display: flex;
	flex-direction: column;
}

.create_book-inner {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: auto;
	aspect-ratio: 1/1;
	margin: 0 auto;
	text-align: center;
	border-radius: 15px;
	background: #FBFBFB;
}

img {
	vertical-align: middle;
	border-style: none;
}

.create_book-inner>p {
	font-size: 14px;
	line-height: 16px;
	font-weight: 600;
	margin-top: 10px;
	height: 54px;
}

.create-warning {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	gap: 7px;
	width: 100%;
	height: auto;
	aspect-ratio: 296/75;
	font-size: 0;
}

.create_book-warn {
	float: left;
	display: inline-block;
	margin-top: 1px;
	vertical-align: top;
}

.create_book-info {
	display: flex;
	flex-direction: column;
	justify-content: center;
	line-height: 18.82px;
	font-size: 13px;
	font-weight: 500;
	text-align: center;
	color: rgba(0, 0, 0, 0.7);
}

.book_item {
	width: 100%;
	height: auto;
	aspect-ratio: 325/398;
	border-radius: 5.775% 1.8% 5.775% 4.975%;
	background: url(/img/book_item.png);
	background-size: cover;
	background-position: center;
	margin: 17px auto 6px;
	padding: 7.8125%;
	position: relative;
	box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.15);
	overflow: hidden; /* 자식 요소가 넘치는 경우 숨기기 */
}

.overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0); /* 기본 상태에서는 완전히 투명 */
	transition: background-color 0.3s ease;
	z-index: 5; /* 오버레이가 이미지 위에 있도록 설정 */
	border-radius: inherit; /* book_item의 모서리와 동일하게 적용 */
}

.book_item.sample:hover .overlay {
	background-color: rgba(255, 255, 255, 0.6);
	/* 마우스를 올리면 하얀색 반투명 필터 적용 */
}

.SbmPreview-button, .SbmCart-button {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	padding: 10px 20px;
	background-color: white;
	color: #7b4cff;
	border: none;
	cursor: pointer;
	font-family: 'STUNNING-Bd';
	opacity: 0;
	z-index: 10;
	transition: opacity 0.3s ease, top 0.3s ease;
	border-radius: 10%;
}

.book_item.sample:hover .SbmPreview-button, .book_item.sample:hover .SbmCart-button
	{
	opacity: 1; /* 호버 시 보이도록 */
}

.SbmPreview-button {
	top: 40%; /* 미리보기 버튼의 위치 */
}

.SbmCart-button {
	top: 60%; /* 장바구니 버튼의 위치 */
}

.tag_icon {
	position: absolute;
	top: 2px;
	left: 22px;
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

.book_item p {
	width: 100%;
	height: auto;
	aspect-ratio: 270/39;
	margin: 0 auto;
	padding: 0 5px;
	font-size: 14px;
	font-weight: 600;
	line-height: 16px;
}

.book_item-coverimg img {
	margin-left: 17px;
	margin-top: 15px;
	width: 250px;
	height: 240px;
}

@media ( max-width : 1024px) {
	.book-wrapper {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 768px) {
	.book-wrapper {
		grid-template-columns: 1fr;
	}
}

.fixed-cart-button {
    position: fixed;
    bottom: 80px;
    right: 80px;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background-color: #7b4cff;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    z-index: 1000;
    transition: background-color 0.3s ease;
}

.fixed-cart-button:hover {
    background-color: #5b33d1;
}

.cart-preview {
    position: absolute;
    bottom: 70px;
    right: 0;
    width: 200px;
    background-color: white;
    border: 1px solid #ddd;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    display: none;
    flex-direction: column;
    align-items: center;
    padding: 10px;
    border-radius: 8px;
    z-index: 1100;
}

.cart-preview img {
    width: 130px;
    height: 130px;
    margin-bottom: 5px;
}

.cart-preview p {
    font-size: 16px; /* 적절한 폰트 크기 */
    color: #000; /* 글자 색 검정으로 설정 */
    margin: 5px 0; /* 간격 추가 */
    text-align: center; /* 텍스트 중앙 정렬 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    overflow: hidden; /* 넘칠 경우 숨기기 */
    text-overflow: ellipsis; /* 텍스트가 넘칠 경우 "..." 표시 */
    font-family: 'STUNNING-Bd';
}



</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="SbHeader.jsp"%>

	<div class="content-wrapper">
		<p class="p_pagetitle">나의 동화책</p>

		<%
		// 세션에서 로그인 상태 확인
		User user2 = (User) session.getAttribute("user");
		if (user2 != null) {
		%>
		<p class="p_greeting">
			안녕하세요,
			<%=user2.getNickname()%>님
		</p>
		<%
		} else {
		%>
		<p class="p_greeting">로그인 후 이용해주세요.</p>
		<%
		}
		%>

		<div class="book-wrapper">

			<!-- 새로운 스토리 만들기 -->
			<div class="book_info">
				<div class="create_book">
					<div class="create_book-inner">
						<img src="/img/sb_create.png" style="width: 21px;" alt="추가버튼"
							onclick="location.href='/arti/book/start'">
						<p style="text-align: center;">
							새로운 스토리 <br> 만들기
						</p>
					</div>
					<div class="create-warning">
						<img src="/img/sb_warning.png" class="create_book-warn">
						<div class="create_book-info">
							보유한 크레딧으로 AI그림이나 <br> 스토리를 생성할 수 있습니다.
						</div>
					</div>
				</div>
			</div>

			<!-- sample1 동화책 -->
			<div class="book_info">
				<div class="book_item sample">
					<div class="tag_icon">
						<img src="/img/tag-sample.png" style="width: 64px;">
					</div>
					<div class="coverimg-top-empty"></div>
					<div class="book_item-coverimg">
						<img
							src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_1-1.webp">
					</div>
					<div class="booktitle-top-empty"></div>
					<p>말하는 나무와 친구가 된 날</p>
					<div class="overlay"></div>
					<!-- 하얀색 오버레이 추가 -->
					<button class="SbmPreview-button"
						onclick="location.href='/arti/book/sample1'">미리보기</button>
				</div>
				<div class="book_date"></div>
				<div class="book_info-hover"></div>
			</div>

			<!-- sample2 동화책 -->
			<div class="book_info">
				<div class="book_item sample">
					<div class="tag_icon">
						<img src="/img/tag-sample.png" style="width: 64px;">
					</div>
					<div class="coverimg-top-empty"></div>
					<div class="book_item-coverimg">
						<img
							src="https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-1.webp">
					</div>
					<div class="booktitle-top-empty"></div>
					<p>소피아와 마법의 바다</p>
					<div class="overlay"></div>
					<button class="SbmPreview-button"
						onclick="location.href='/arti/book/sample2'">미리보기</button>
				</div>
				<div class="book_date"></div>
				<div class="book_info-hover"></div>
			</div>

			<!-- 사용자 보유 동화책 -->
			<c:forEach var="storybook" items="${storyBooks}">
				<div class="book_info">
					<div class="book_item sample">
						<div class="coverimg-top-empty"></div>
						<div class="book_item-coverimg">
							<c:choose>
								<c:when test="${not empty storybook.book_thumbnail}">
									<img src="${storybook.book_thumbnail}"
										alt="${storybook.book_name}">
								</c:when>
								<c:otherwise>
									<img
										src="https://storage.googleapis.com/smhrd_arti/images/defaultMypage.png"
										alt="기본 썸네일">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="booktitle-top-empty"></div>
						<p>${storybook.book_name}</p>
						<div class="overlay"></div>
						<button class="SbmPreview-button"
							onclick="location.href='/arti/book/storybook?book_idx=${storybook.book_idx}'">미리보기</button>
						<button class="SbmCart-button"
							onclick="addToCart(${storybook.book_idx})">장바구니</button>
					</div>
					<div class="book_date"></div>
					<div class="book_info-hover"></div>
				</div>
			</c:forEach>

			<div class="fixed-cart-button" onclick="location.href='/arti/publish/cart'" onmouseover="showCartItems()" onmouseleave="hideCartItems()">
				🛒
			<div class="cart-preview" id="cart-preview"></div>	
			</div>


		</div>
	</div>

	<!-- Footer -->
	<%@ include file="SbFooter.jsp"%>
</body>

<script>

//장바구니에 추가
function addToCart(bookIdx) {
    fetch('/arti/publish/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ bookIdx: bookIdx }) // 책 식별자 전송
    })
    .then(response => {
        if (response.ok) {
            alert('장바구니에 담겼습니다.');
        } else {
            alert('장바구니 추가에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('장바구니 추가 오류:', error);
    });
}

// 장바구니 미리보기 표시
function showCartItems() {
    const previewDiv = document.getElementById('cart-preview');
    previewDiv.style.display = 'flex'; // 장바구니 미리보기 표시

    fetch('/arti/publish/items') // REST API 호출
        .then(response => {
            if (!response.ok) {
                throw new Error('장바구니 목록 가져오기 실패');
            }
            return response.json();
        })
        .then(items => {
            previewDiv.innerHTML = ''; // 기존 내용 비우기

            // 장바구니 내역 제목 추가
            const title = document.createElement('p');
            title.textContent = '장바구니 내역';
            title.style.marginBottom = '20px';
            title.style.fontWeight = 'bold';
            title.style.fontSize = '20px';
            previewDiv.appendChild(title);

            if (items.length > 0) {
                // 장바구니에 아이템이 있는 경우 표시
                items.forEach(item => {
                    const itemDiv = document.createElement('div'); // 아이템 컨테이너
                    itemDiv.style.textAlign = 'center';
                    itemDiv.style.marginBottom = '15px';

                    // 썸네일 이미지 추가
                    const img = document.createElement('img');
                    img.src = item.book_thumbnail || '/img/default-thumbnail.png';
                    img.alt = item.book_name || '동화책';
                    img.style.width = '80px'; // 적절한 크기 조정
                    img.style.height = '80px';

                    // 책 이름 추가
                    const bookName = document.createElement('p');
                    bookName.textContent = item.book_name || '이름 없음';
                    bookName.style.fontSize = '14px';
                    bookName.style.marginTop = '10px';

                    // 컨테이너에 추가
                    itemDiv.appendChild(img);
                    itemDiv.appendChild(bookName);
                    previewDiv.appendChild(itemDiv);
                });
            } else {
                // 장바구니가 비어 있는 경우
                const emptyMessage = document.createElement('p');
                emptyMessage.textContent = '장바구니가 비어 있습니다.';
                emptyMessage.style.color = '#888'; // 회색 텍스트
                emptyMessage.style.fontSize = '14px';
                previewDiv.appendChild(emptyMessage);
            }
        })
        .catch(error => {
            console.error('장바구니 목록 가져오기 오류:', error);
        });
}

// 장바구니 미리보기 숨기기
function hideCartItems() {
    const previewDiv = document.getElementById('cart-preview');
    previewDiv.style.display = 'none'; // 장바구니 미리보기 숨기기
}




</script>



</html>
