<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
<style>
@font-face {
    font-family: 'STUNNING-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2') format('woff2');
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
    font-size: 20px;
    font-family: 'STUNNING-Bd';
    color: black;
    text-align: center;
}

.p_greeting {
    text-align: center;
    font-family: 'STUNNING-Bd';
    font-size: 16px;
    font-weight: 400;
    color: Zinc Gray;
    margin-top: 10px;
            
}

.book-wrapper {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 각 행에 3개의 컬럼 */
    gap: 30px 21px; /* 각 동화책 사이의 간격 */
    margin: 40px 0;
}

.book_info {
    padding: 0 15px;
    aspect-ratio: 1 / 1.227;
    border-radius: 20px;
    position: relative;
    box-sizing: border-box;
    background-image: url('https://storage.googleapis.com/smhrd_arti/STORY_SAMPLE_2-1.webp');
    background-size: cover; /* 이미지가 컨테이너 크기에 맞게 조절 */
    background-position: center; /* 이미지 중심 배치 */
}

img {
    vertical-align: middle;
    border-style: none;
}

.book_item {
    width: 100%;
    height: auto;
    aspect-ratio: 325 / 398;
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
            aspect-ratio: 270 / 43;
        }

        .booktitle-top-empty {
            width: 100%;
            height: auto;
            aspect-ratio: 270 / 15;
        }

        .book_item p {
            width: 100%;
            height: auto;
            aspect-ratio: 270 / 39;
            margin-top: 280px;
            padding: 0 5px;
            font-size: 20px;
            color: white;
            font-family: 'STUNNING-Bd';
        }

        .book_item-coverimg img {
            margin-left: 17px;
            margin-top: 15px;
            width: 250px;
            height: 240px;
        }

        @media (max-width: 1024px) {
            .book-wrapper {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .book-wrapper {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<%@ include file="SbHeader.jsp" %>

<div class="content-wrapper">
    <p class="p_pagetitle">공개 갤러리</p>
    <p class="p_greeting">다른 친구들이 만든 동화를 함께 봐요!</p>

    <div class="book-wrapper">
    
        <!-- sample2 동화책 -->
        <div class="book_info">
            <div class="book_item sample">
                <div class="coverimg-top-empty"></div>
                <div class="booktitle-top-empty"></div>
                <p>
                	소피아와 마법의 바다
                <br>
                	김예원
                </p>
            </div>
            <div class="book_date"></div>
            <div class="book_info-hover"></div>
        </div>
        
        <!-- sample2 동화책 -->
        <div class="book_info">
            <div class="book_item sample">
                <div class="coverimg-top-empty"></div>
                <div class="booktitle-top-empty"></div>
                <p>
                	소피아와 마법의 바다
                <br>
                	김예원
                </p>
            </div>
            <div class="book_date"></div>
            <div class="book_info-hover"></div>
        </div>
        
        <!-- sample2 동화책 -->
        <div class="book_info">
            <div class="book_item sample">
                <div class="coverimg-top-empty"></div>
                <div class="booktitle-top-empty"></div>
                <p>
                	소피아와 마법의 바다
                <br>
                	김예원
                </p>
            </div>
            <div class="book_date"></div>
            <div class="book_info-hover"></div>
        </div>

		
        
    </div>
</div>

<!-- Footer -->
<%@ include file="SbFooter.jsp" %>
</body>
</html>
