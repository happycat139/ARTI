package com.smhrd.Arti.Controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.PaymentService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/arti/payments")
public class PaymentRestController {

	private final PaymentService service;

	// 1. 결제 요청
	@PostMapping("/request")
	public ResponseEntity<Map> requestPayment(@RequestBody Map<String, Integer> requestBody, HttpSession session) {
	    int amount = requestBody.get("amount"); // JSON에서 amount 가져오기
	    User user = (User) session.getAttribute("user"); // 세션에서 이메일 가져오기
	    String email = user.getEmail();
	    
	    System.out.println("Amount: " + amount);
	    System.out.println("Email: " + email);
	    String orderId = "order_" + System.currentTimeMillis(); // 고유 주문 ID 생성
	    return service.requestPayment(orderId, amount);
	}


	// 2. 결제 성공
	@GetMapping("/success")
	public String paymentSuccess(@RequestParam String paymentKey, @RequestParam String orderId,
			@RequestParam int amount, HttpSession session) {
		User user = (User) session.getAttribute("user"); // 로그인된 사용자 ID
		String email = user.getEmail();
		
		System.out.println("Amount: " + amount);
	    System.out.println("Email: " + email);
	    System.out.println("paymentKey: " + paymentKey);

		// 결제 성공 처리
		service.handlePaymentSuccess(paymentKey, email, amount);

		return "결제가 성공적으로 완료되었습니다!";
	}

	// 3. 결제 실패
	@GetMapping("/fail")
	public String paymentFail() {
		return "결제가 실패했습니다.";
	}

}
