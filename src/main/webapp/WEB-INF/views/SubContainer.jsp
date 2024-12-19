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

body {
   margin: 0;
   padding: 0;
   font-family: 'UhBeeSe_hyun', Arial, sans-serif;
   background-color: #F5F5F5;
}

.SubContainer {
    width: 94%;
    margin: 0 auto;
    max-width: 1400px;
    display: flex;
}

.notice {
   width:50%;
    margin-top: 22%;          /* 아래로 50px 이동 */
    
    opacity: 0;               /* 초기 상태: 투명 */
    transform: translateY(100px); /* 초기 상태: 아래 위치 */
    transition: opacity 0.4s ease-out, transform 2s ease-out; /* 애니메이션 */
}

.notice.visible {
    opacity: 1;               /* 보이도록 */
    transform: translateY(0); /* 원래 위치로 이동 */
}

.notice .title {
    font-family: 'UhBeeSe_hyun';
    font-size: 40px;
    margin-top: 3%;
    margin-bottom: 1%;
    font-weight: bold;
}

.notice .subtit {
   font-family: 'UhBeeSe_hyun';
   font-size: 20px;
   color: #666;
   margin-top: 5%;
   
}

.img {
   margin-top:5%;
   margin-bottom:5%;
   width:100%;
}

.img .image {
    width: 80%;
    display: flex;
    margin-left: 25%;
}

.img .image2 {
   width: 80%;
   display: flex;
   margin-left: 25%;
   margin-top: 20px;
}

.img .image li, .img .image2 li {
    height: 385px;
    width: 75%;
    background-size: cover;                            /* 기본 크기 유지 */
    border-radius: 20px;
    list-style: none;                                  /* 리스트 스타일 제거 */
}

.img .image li {
    background: url(img/subcontainerimg.png) no-repeat;
}

.img .image2 li {
   background: url(img/subcontainerimg2.png) no-repeat;
}

.img .image li:hover, .img .image2 li:hover {
    transform: scale(1.05); /* 컨테이너 자체 확대 */
}

.img .image li, .img .image2 li {
    transition: transform 0.8s ease, opacity 1s ease; /* 부드러운 애니메이션 */
    opacity: 0;                               /* 초기 상태 숨김 */
    transform: translateY(20px);                   /* 초기 상태 아래로 이동 */
}

.img .image li.visible, .img .image2 li.visible {
    opacity: 1;             /* 보이도록 */
    transform: translateY(0);    /* 원래 위치로 이동 */
}
</style>
</head>
<body>

<div class="SubContainer">
    <div class="notice">
        <span class="title">심리검사</span><br>
        <span class="subtit">
        심리검사를 통한 우리 아이 심리 확인
        </span>
    </div>
    
    <div class="img"> 
       <div class="image">   
          <ul class="list"></ul>
          <li></li>
       </div>
       <div class="image2">   
          <ul class="list"></ul>
          <li></li>
       </div>
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    // notice와 img 요소들을 모두 선택
    const targets = document.querySelectorAll(".notice, .img .image li, .img .image2 li");

    // IntersectionObserver 생성
    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible"); // 요소가 뷰포트에 들어오면 visible 클래스 추가
                }
            });
        },
        {
            root: null, // 뷰포트를 기준으로
            threshold: 0.1, // 10% 이상 보일 때 트리거
        }
    );

    // 모든 타겟 요소를 관찰
    targets.forEach((target) => observer.observe(target));
});
</script>

</body>
</html>