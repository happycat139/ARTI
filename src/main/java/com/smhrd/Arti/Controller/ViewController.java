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
	
}
