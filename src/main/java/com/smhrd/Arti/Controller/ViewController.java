package com.smhrd.Arti.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	/* 헤더 호출 */
	@GetMapping("/header")
	public String Header() {
		return "Header";
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
	
	/* 심리검사 페이지 호출 */
	@GetMapping("/arti/test")
	public String ArtiTestPage() {
		return "ArtiTest";
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
	@GetMapping("/arti/test/htp")
	public String HtpTestPage() {
		return "test/HtpTest";
	}
	
}
