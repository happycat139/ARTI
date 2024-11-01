package com.smhrd.Arti.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	/* 회원가입 / 로그인 메인 화면 */
	@GetMapping("/welcome")
	public String LoginPage() {
		return "Login";
	}
	
	/* 약관 동의 */
	@GetMapping("/welcome/join")
	public String JoinPage() {
		return "Join";
	}
	
	/* 회원가입 화면 */
	@GetMapping("/welcome/join/form")
	public String JoinFormPage() {
		return "JoinForm";
	}
	
	/* 회원가입 화면 */
	@GetMapping("/welcome/login")
	public String LoginFormPage() {
		return "LoginForm";
	}
	
	
}
