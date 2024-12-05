<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
</head>
<style>
@font-face {
    font-family: 'STUNNING-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

/* 전체 갤러리 영역 스타일 */
#gallery {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(340px, 1fr)); /* 반응형 그리드 설정 */
    gap: 20px; /* 각 아이템 사이의 간격 설정 */
    margin: 50px auto;
    max-width: 1800px; /* 전체 컨테이너의 최대 너비 설정 */
    padding: 20px 50px ; /* 갤러리 내부 여백 */
}

/* 텍스트 부분 관련 CSS */
.gallery-item-text {
    width: 100%;
    height: 270px;
    border: none;
    cursor: initial;
    position: relative;
    grid-column: span 2; /* 텍스트 설명을 두 칸 차지하게 설정 */
    padding-top: 60px;
}

.headline-text {
    line-height: 42px;
    font-size: 30px;
    font-weight: 700;
    letter-spacing: -0.9px;
    color: #6133E2;
}

.supline-text {
    margin-top: 20px;
    line-height: 26px;
    font-size: 15px;
    font-weight: 400;
    letter-spacing: -0.3px;
}

.text-outline-btn {
    width: 165px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    border-color: transparent;
    background: linear-gradient(to right bottom, #6C26FF, #A430FF);
    height: 51px;
    line-height: 51px;
    margin-top: 25px;
    text-align: center;
    border-radius: 50px;
    border: 1px solid #fff;
    cursor: pointer;
}

/* 책 부분 관련 CSS */
.gallery-item {
    height: 432px;
    border-radius: 15px;
    border: 1px solid #E7E7F6;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover; /* 이미지가 셀 크기에 맞게 설정 */
    position: relative;
    cursor: pointer;
    transition: transform 0.3s ease; /* 마우스를 올렸을 때 확대되는 효과 */
}

.gallery-item:hover {
    transform: scale(1.05); /* 마우스 오버 시 확대 효과 */
}

.content {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-end;
    width: 100%;
    height: 100%;
    padding: 20px;
    color: #fff;
    border-radius: 15px;
    background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.3)); /* 그라데이션 배경 추가 */
}

.content-title {
    width: 100%;
    line-height: 30px;
    font-size: 20px;
    font-weight: 600;
    letter-spacing: -0.55px;
    line-height: 26px;
}

.content-author {
    width: 100%;
    font-size: 17px;
    letter-spacing: -0.42px;
    line-height: 20px;
}

.content-author > span {
    padding-right: 15px;
}
</style>
<body>
<div id="root">
<div id="content">
    <%@ include file="SbHeader.jsp" %>
    <div id="gallery" class="grid effect-4">
        
        <!-- 텍스트 설명 부분 -->
        <div class="gallery-item-text">
            <div class="headline-text">
                나만의 동화책을 직접 만드는 경험 
                <br> 
                AI시대 교육 트렌드
            </div>
            <div class="supline-text">
                AI 도움으로 나만의 (한글, 영어) 동화책을 만들어 가면서, 자연스럽게 최신 생성형 
                <br>
                AI 기술도 체험할 수 있고, AI 이해도와 성취감을 높여줄 수 있습니다.
            </div>
            <div class="text-outline-btn" onclick="location.href='/arti/book/mypage'">
                <img src="/img/ic_make.png" class="makeImg"> 동화책 만들기
            </div>
            <div class="notice"></div>
        </div>
        
        <!-- 동화책 아이템들 반복 출력 부분 -->
        <c:forEach var="storybook" items="${storyBooks}" varStatus="status">
            <c:if test="${status.index < 18}">
                <div class="gallery-item" style="background-image: url('${storybook.book_thumbnail}');" onclick="location.href='/arti/book/storybook?book_idx=${storybook.book_idx}'">
                    <div class="content">
                        <div class="content-title">${storybook.book_name}</div>
                        <div class="content-author">
                            <span>${storybook.author}</span>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
        
    </div>  
    <%@ include file="SbFooter.jsp" %>
</div>
</div>
</body>
</html>
