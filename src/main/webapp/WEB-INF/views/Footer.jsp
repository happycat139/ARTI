<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실전프로젝트 Footer</title>
<link rel="stylesheet" href="/css/Footer.css">
</head>
<body>
<footer class="footer">
	<div>
		
		<div class="TopWrap_footer">
			<nav class="TermsWrap_footer">
				<ul class="List_footer">
					<li><a href="#" target="_blank" rel="noopener noreferrer" class="TermLink">혜성팀 소개</a></li>
					<li><a href="#" target="_blank" rel="noopener noreferrer" class="TermLink">이용약관</a></li>
					<li><a href="#" target="_blank" rel="noopener noreferrer" class="TermLink2">개인정보처리방침</a></li>
					<li><a href="#" target="_blank" rel="noopener noreferrer" class="TermLink">HTP검사 소개</a></li>
				</ul>
			</nav>
			<form class="SearchForm_footer">
				<label>
					<p class="SearchText_footer">무엇이 궁금하신가요?</p>
					<input type="text" class="SearchInput_footer" value>
				</label>
				<button class="SearchBtn_footer"><img src="/img/search.png" alt="검색로고"></button>
			</form>
			<button class="GoTop"><img width="11" height="7" viewBox="0 0 11 7" src="/img/goTop.png" alt="검색로고"><p>Top</p></button>
		</div>
		
		<div class="Content_footer">
			<div class="InfoWrap_footer">
				<ul class="Info_footer">
					<li>(사)스마트인재개발원</li>
					<li>팀장 : 이혜성</li>
					<li>팀원 : 김원섭, 김예원, 권오빈</li>
					<li>주소 : 서울 서초구 동작대로 132 9층 스마트인재개발원 서초점</li>
					<li></li>
					<li>연락처 : 000-1234-5678 | 평일 09:00 ~ 17:30, 점심시간 : 13:00 ~ 14:00 (토·일요일, 공휴일 휴무)</li>
					<li>팩스 : 000-1234-5678     협업문의 : itsmeenaya@naver.com     배너/협약 광고문의 : itsmeenaya@naver.com</li>
				</ul>
				<div class="BtnWrap_footer">
					<a href="#" target="_blank" rel="noopener noreferrer">협력기관 문의</a>
					<a href="#" target="_blank" rel="noopener noreferrer">자주묻는 질문</a>
					<a href="#" target="_blank" rel="noopener noreferrer">1:1문의</a>
					<button class="Btn">배너광고문의</button>				
				</div>
				<p class="CopyRight">HyeSung, team. All rights reserved.</p>
			</div>
			<div class="RightWrap_footer">
				<div class="SocialWrap_footer">
					<a href="#" target="_blank" rel="noopener noreferrer" class="social1"></a>
					<a href="#" target="_blank" rel="noopener noreferrer" class="social1"></a>
					<a href="#" target="_blank" rel="noopener noreferrer" class="social1"></a>
					<a href="#" target="_blank" rel="noopener noreferrer" class="social1"></a>
					<a href="#" target="_blank" rel="noopener noreferrer" class="social1"></a>
				</div>
			</div>
		</div>
	</div>
</footer>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const goTopButton = document.querySelector('.GoTop');
    
    // GoTop 버튼 클릭 시 페이지 맨 위로 스크롤 이동
    goTopButton.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
        });
    });
});
</script>
</body>
</html>