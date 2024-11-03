package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	UserService service;

	
	/* 화면 호출 관련 */
	
	/* 회원가입, 로그인 메인 화면 */
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
	
	/* 프로필 화면 */
	@GetMapping("/profile")
	public String ProfilePage() {
		return "Profile";
	}
	
	
	/* 메소드 관련 */
	
	/* 회원가입 메소드 */ 
	@PostMapping("/welcome/join") 
	public String register(User user, HttpSession session) {
			
		service.register(user);
		
		session.setAttribute("user", user);
			
		return "redirect:/";
	}
	
	/* 회원가입 메소드 */ 
	@PostMapping("/welcome/login") 
	public String login(User user, HttpSession session) {
			
		User loginUser = service.login(user);
		
		if(loginUser != null) {
			session.setAttribute("user", loginUser);
		}
			
		return "redirect:/";
	}
	
	/* 로그아웃 메소드 */
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			session.invalidate();
		}
		
		return "redirect:/";
	}
	
	
}
