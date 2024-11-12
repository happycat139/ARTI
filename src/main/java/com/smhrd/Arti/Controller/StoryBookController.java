package com.smhrd.Arti.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/arti/book")
public class StoryBookController {

	/* 페이지 관련 뷰 컨트롤러 */
	
	// 나의 동화책 페이지 호출 
	@GetMapping("/mypage")
	public String SbMypage() {
		return "ArtisBook/SbMypage";
	}
	
	// 나의 동화책 작가 등록 페이지 호출 
	@GetMapping("/start")
	public String SbCreatepage() {
		return "ArtisBook/SbStartBook";
	}
	
	// 나의 동화책 선택 페이지 호출 
	@GetMapping("/select")
	public String SbSelectpage() {
		return "ArtisBook/SbSelect";
	}
	
	// 나의 동화책 선택 페이지 호출 
	@GetMapping("/topic")
	public String SbTopicpage() {
		return "ArtisBook/SbTopic";
	}
	
	// 나의 동화책 선택 페이지 호출 
	@GetMapping("/outline")
	public String SbOutLinepage() {
		return "ArtisBook/SbOutLine";
	}
	
	
}
