package com.smhrd.Arti.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaBoardController {

	/* 문의하기 페이지 호출 관련 */
	
	// 문의하기 메인 페이지 호출
	@GetMapping("arti/board/main")
	public String BoardMainPage() {
		return "QnaBoard/QnaBoardMain";
	}
	
	// 문의하기 작성 페이지 호출
	@GetMapping("arti/board/write")
	public String BoardWritePage() {
		return "QnaBoard/QnaBoardWrite";
	}
		
	// 문의하기 메인 페이지 호출
	@GetMapping("arti/board/detail")
	public String BoardDetailPage() {
		return "QnaBoard/QnaBoardDetail";
	}
	
}
