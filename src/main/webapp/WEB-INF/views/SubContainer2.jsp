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

.SubContainer2 {
   align-items: center;
   padding: 20px 0;
   background-color: #f9fafb;
   }

.SubContainer2_header {
   text-align: center;
   margin-top: 10%;
   background-color: #f9fafb;
   }

#textname{
   font-family: 'UhBeeSe_hyun';
   font-size: x-large;
   text-align: center;   
}

.image-marquee {
   display: flex;
   overflow: hidden;
   }

.image-marquee .image-list {
   display: flex;          /* 이미지들을 가로로 정렬 */
    justify-content: center; /* 가운데 정렬 */
    padding: 0;
    margin: 0;
    gap: 20px;              /* 이미지 사이 공백을 동일하게 설정 */
    list-style: none;       /* 기본 리스트 스타일 제거 */
   }

.image-marquee .image-list li {
   max-width: 250px;      /* 이미지 컨테이너 너비 확대 */
    width: 250px;          /* 이미지 컨테이너 고정 크기 */
    margin: 0 48px;        /* 좌우 간격을 조정 */
    padding: 30px;         /* 아래 간격 조정 */
    display: flex;
    align-items: center;
    justify-content: center; /* 이미지가 가운데에 위치 */
    flex-shrink: 0;    
   }

.image-marquee .image-list li img {
   width: 170%;       /* 이미지의 너비를 고정 */
   height: 100%;      /* 이미지의 높이를 고정 */
   object-fit: cover;  /* 이미지 비율을 유지하며 크기에 맞게 잘라냄 */
   box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25); /* 그림자 효과 */
   }

.rolling-list.original {
   animation: rollingleft1 50s linear infinite;
   }
.rolling-list.clone {
   animation: rollingleft2 50s linear infinite;
   }

@keyframes rollingleft1 {
   0% { transform: translateX(0); }
   50% { transform: translateX(-100%); }
   50.01% { transform: translateX(100%); }
   100% { transform: translateX(0); }
}

@keyframes rollingleft2 {
   0% { transition: translateX(0); }
   100% { transform: translateX(-200%); }
}
</style>
</head>
<body>
   <div class="SubContainer2">
           <div class="SubContainer2_header">
               <h1 id="textname">스케치북</h1>
               <h1 id="textname">내 아이와 동화만들기</h1>
               <div class="image-marquee">
                    <div class="rolling-list">
                      <ul class="image-list">
                          <li><img src="https://storage.googleapis.com/smhrd_arti/MainPage/Sub1.png" alt="Image 1"></li>
                          <li><img src="https://storage.googleapis.com/smhrd_arti/MainPage/Sub2.png" alt="Image 2"></li>
                          <li><img src="https://storage.googleapis.com/smhrd_arti/MainPage/Sub3.jpg" alt="Image 3"></li>                
                          <li><img src="https://storage.googleapis.com/smhrd_arti/MainPage/Sub4.jpg" alt="Image 4"></li>                
                          <!-- 필요한 만큼 이미지 추가 -->
                      </ul>
                    </div>
              </div>
           </div>
   </div>
   <script type="text/javascript">
        //롤링 배너 복제본 생성
        let roller = document.querySelector('.rolling-list');
        roller.id = 'roller1';                                  //아이디부여

        let clone = roller.cloneNode(true)
        //cloneNode: 노드복제. 기본값은 false. 자식 노드까지 복제를 원하면 true 사용
        clone.id = 'roller2';
        document.querySelector('.image-marquee').appendChild(clone); //wrap 하위 자식으로 부착
        
        document.querySelector('#roller1').style.left = '0px';
        document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';
        // offsetWidth: 요소의 크기 확인(margin을 제외한 padding값, border값까지 계산한 값)

        roller.classList.add('original');
        clone.classList.add('clone');
    </script>
</body>
</html>