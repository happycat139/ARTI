<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI - 내 아이의 마음 스케치북</title>
<style>

@font-face {
   font-family: 'UhBeeSe_hyun';
   src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
   font-weight: normal;
   font-style: normal;
}

body, html {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    scroll-behavior: smooth;
    font-family: 'UhBeeSe_hyun', Arial, sans-serif;
    overflow-x: hidden;
}

.SubContainer {
    background-color: white;
    background-image: url('img/Moonapple.jpg');               /* 배경 이미지 설정 */
    background-size: 40%;                                     /* div의 50% 크기로 이미지 크기 조절 */
    background-position: 75% 50%;                             /* 이미지의 위치를 설정 */
    background-repeat: no-repeat;                             /* 이미지 반복 방지 */
    height: 100vh;                                            /* 전체 화면 높이로 설정 */
    display: flex;                                            /* Flexbox 활성화 */
    justify-content: left;
   
    transform: translateY(100px);
    transition: opacity 1s ease-out, transform 1s ease-out;
}

#notice {
   margin-top: 22%;
   margin-left: 11%   ;
   
   opacity: 0;
    transform: translateY(100px);
    transition: opacity 1s ease-out, transform 1s ease-out;
   
}

.fade-in-visible {
    animation: fadeInUp 1s ease-out forwards;
}

.css1 {
    font-size: 200%;                         /* 추가 스타일을 넣을 수 있음 */
    font-family: 'UhBeeSe_hyun';
}

.css2 {
    font-size: 160%;
    color: rgba(0, 0, 0, 0.7);
    font-family: 'UhBeeSe_hyun';
}


@keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translateY(100px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

</style>
</head>
<body>

<div class="SubContainer" id="target">
    <div id="notice">
        <h1 class="css1">심리검사</h1>
        <h1 class="css2">심리검사를 통한 우리 아이 심리 확인</h1>
    </div>
</div>

<script>
//Intersection Observer를 사용하여 요소가 화면에 보일 때 애니메이션을 추가합니다.
document.addEventListener("DOMContentLoaded", function() {
    const observerOptions = {
        root: null,           // 전체 뷰포트를 기준으로
        rootMargin: "0px",    // 뷰포트의 여백을 설정
        threshold: 0.1        // 요소의 10%가 보이면 콜백 실행
    };

    const fadeInObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in-visible');
                observer.unobserve(entry.target); // 애니메이션 후에 더 이상 관찰하지 않음
            }
        });
    }, observerOptions);

    // #notice 요소를 관찰
    const noticeElement = document.querySelector('#notice');
    fadeInObserver.observe(noticeElement);

    // .SubContainer 요소도 관찰
    const subContainerElement = document.querySelector('#target');
    fadeInObserver.observe(subContainerElement);
});
</script>

</body>
</html>