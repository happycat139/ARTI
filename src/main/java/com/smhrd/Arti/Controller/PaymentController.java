package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.PaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/arti/payments")
public class PaymentController {
	
	
	@Autowired
	public PaymentService paymentService;
	
	
	
	@GetMapping("/success")
	public String paymentSuccess(
	    @RequestParam String paymentKey,
	    @RequestParam String orderId,
	    @RequestParam int amount,
	    HttpSession session,
	    Model model
	) {
	    // 사용자 세션에서 유저 정보 가져오기
	    User user = (User) session.getAttribute("user");

	    // 결제 성공 처리 (결제 검증)
	    paymentService.handlePaymentSuccess(paymentKey, user, amount);

	    // 성공한 정보 JSP로 전달
	    model.addAttribute("orderId", orderId);
	    model.addAttribute("amount", amount);
	    model.addAttribute("coinsAdded", amount / 1000);

	    // 성공 페이지로 이동
	    return "success"; // success.jsp를 반환
	}

	
	

}
