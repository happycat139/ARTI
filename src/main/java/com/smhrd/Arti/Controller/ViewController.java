package com.smhrd.Arti.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Service.StoryBookService;

@Controller
public class ViewController {
	
	@Autowired
	StoryBookService service;

	/* 헤더 호출 */
	@GetMapping("/SbHeader")
	public String Header() {
		return "SbHeader";
	}
	
	/* 메인 호출 */
	@GetMapping("/")
	public String MainPage() {
		return "Main";
	}
	
	/* 테스터 호출 */
	@GetMapping("/test")
	public String TestPage() {
		return "Test";
	}
	
	/* 테스터 호출 */
	@GetMapping("/new")
	public String NewFile() {
		return "NewFile";
	}
	
	/* 심리검사 관련 페이지 */
	
	/* 심리검사 페이지 호출 */
	@GetMapping("/arti/test")
	public String ArtiTestPage() {
		return "test/TestMain";
	}
	
	/* 심리검사 정보 페이지 호출 */
	@GetMapping("/arti/test/info")
	public String ArtiTestInfoPage() {
		return "test/TestInfo";
	}
	
	/* 심리검사 방법 페이지 호출 */
	@GetMapping("/arti/test/method")
	public String ArtiTestMethodPage() {
		return "test/TestMethod";
	}
	
	/* HTP검사 페이지 호출 */
	@GetMapping("/arti/test/htpqwet")
	public String HtpTestPage() {
		return "test/HtpTest";
	}
	
	/* HTP검사 페이지 호출 */
	@GetMapping("/arti/test/faq")
	public String FaqPage() {
		return "test/FAQ";
	}
	
	/* HTP검사 페이지 호출 */
	@GetMapping("/arti/test/beta")
	public String Test1Page() {
		return "ArtiTest";
	}
	
	
	
	/* 스케치북 관련 페이지 */
	
	/* 스케치북 메인 페이지 호출 */
	@GetMapping("/arti/storybook/main")
	public String StMainPage(Model model) {
		
	    List<StoryBook> storyBooks = service.getStoryBooks(); // 모든 동화책 가져오기
	    
	    model.addAttribute("storyBooks", storyBooks);
	    
	    return "ArtisBook/ArtisBookMain"; // 데이터를 JSP로 전달
	}
	
	
	@GetMapping("/arti/error")
	public String errorPage() {
		return "errorPage";
	}
	
	// 아티코인 충전 페이지 호출
	@GetMapping("/arti/coin")
	public String ArtiCoinPage() {
		return "ArtiCoin";
	}
	
	
}
