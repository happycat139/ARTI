<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainContainer</title>
<style>

   @font-face {
    font-family: 'UhBeeSe_hyun'
    src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
    font-weight: normal;
    font-style: normal;
   }

    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        font-family: 'UhBeeSe_hyun'
        background-color: white; /* 배경을 흰색으로 설정 */
        overflow-x: hidden;
    }

    #container-wrap {
        text-align: center; /* 텍스트 중앙 정렬 */
           
        
        background-image: url('https://storage.googleapis.com/smhrd_arti/MainPage/MainPage1.png');
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;  /* 이미지를 반복하지 않음 */
        
        opacity: 0; /* 처음에는 보이지 않도록 설정 */
        transform: translateY(30px); /* 아래쪽에서 올라오는 효과 */
        animation: fadeInUp 1.5s ease-out forwards; /* 애니메이션 효과 */
    }

    @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translateY(30px); /* 아래에서 시작 */
        }
        100% {
            opacity: 1;
            transform: translateY(0); /* 원래 위치로 이동 */
        }
    }

    .txt-box {
        color: #00129A;    /* 텍스트 색상 */
        padding-top: 14%;    /* 위쪽 여백을 조금 크게 설정 */
    }

    .txt-pkg .tit {
        font-size: 3rem; /* 제목 폰트 크기 */
        font-weight: bold;
        margin-bottom: 20px;
        font-family: 'UhBeeSe_hyun';
    }

    .txt-pkg .txt {
        font-size: 4rem; /* ARTI 강조 */
        color: #007AFF; /* 파란색 강조 */
        font-family: 'UhBeeSe_hyun';
    }

    /* 반응형 디자인을 위한 미디어 쿼리 */
    @media (max-width: 1024px) {
        #container-wrap {
            padding: 30px 15px; /* 패딩 줄이기 */
        }

        .txt-pkg .tit {
            font-size: 2.5rem; /* 큰 화면에서는 적절한 폰트 크기 */
        }

        .txt-pkg .txt {
            font-size: 3.5rem; /* 큰 화면에서 강조 텍스트 크기 */
        }
    }

    @media (max-width: 768px) {
        #container-wrap {
            padding: 20px 10px; /* 작은 화면에서는 패딩 줄이기 */
        }

        .txt-pkg .tit {
            font-size: 2rem; /* 작은 화면에서 제목 글자 크기 조정 */
        }

        .txt-pkg .txt {
            font-size: 3rem; /* 작은 화면에서 강조 텍스트 크기 조정 */
        }
    }

    @media (max-width: 480px) {
        #container-wrap {
            padding: 15px 5px; /* 모바일 화면에서 패딩 줄이기 */
        }

        .txt-pkg .tit {
            font-size: 1.8rem; /* 더 작은 화면에서 제목 크기 조정 */
        }

        .txt-pkg .txt {
            font-size: 2.5rem; /* 더 작은 화면에서 강조 텍스트 크기 조정 */
        }
    }
    
    .gif {
       width: 100px;
       height: 100px;
       margin-top: 150px;
    }
    
    .gif-button {
        background: none;
        border: none;
        cursor: pointer;
        padding: 0;
    }
</style>
</head>
<body>
    <div id="container-wrap">
        <div class="txt-box">
            <div class="txt-pkg">
                <span class="tit">내 아이의 마음 스케치북</span><br>
                <span class="txt">ARTI</span><br>
                <img botton class="gif" src="https://storage.googleapis.com/smhrd_arti/MainPage/MainScroll.gif" alt="Animated Image" onclick="scrollDownClick()" style="cursor: pointer;">
            </div>
        </div>
    </div>
    <script>
       function scrollDownClick() {
          //현재 스크롤 위치에서 한 화면만큼 더 스크롤
          window.scrollBy({
             top: window.innerHeight, //한 화면의 높이만큼 아래로 이동
             behavior: 'smooth'       //부드러운 스크롤 효과
          });
       }
    </script>
</body>
</html>