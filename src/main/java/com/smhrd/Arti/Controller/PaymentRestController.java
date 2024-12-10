package com.smhrd.Arti.Controller;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Model.PublishRequest;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.PaymentService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/arti/payments")
public class PaymentRestController {

	private final PaymentService paymentService;

	// 결제 요청
	@PostMapping("/request")
	public ResponseEntity<Map<String, String>> requestPayment(@RequestBody Map<String, Object> requestBody) {
		int amount = (int) requestBody.get("amount"); // amount는 Integer로 처리
		String orderId = (String) requestBody.get("orderId"); // orderId를 String으로 처리

		// 서비스에서 결제 요청 처리
		Map<String, String> paymentResponse = paymentService.requestPayment(orderId, amount);

		// orderId를 포함한 응답 반환
		paymentResponse.put("orderId", orderId);
		return ResponseEntity.ok(paymentResponse);
	}


	@PostMapping("/request/pub")
	public ResponseEntity<Map<String, String>> requestPayment(
	        @RequestBody PublishRequest publishRequest, // JSON 데이터를 PublishRequest로 매핑
	        HttpSession session
	) {
	    // 1. PublishRequest 객체를 세션에 저장
	    session.setAttribute("publishRequest", publishRequest);
	    // 2. 결제 요청 처리
	    Map<String, String> paymentResponse = paymentService.requestPayment(publishRequest.getOrderId() , publishRequest.getTotalPrice());

	    // 3. 응답 반환
	    paymentResponse.put("pub_idx", publishRequest.getPub_idx().toString()); // pub_idx 반환
	    return ResponseEntity.ok(paymentResponse);
	}



	// 결제 실패 처리
	@GetMapping("/fail")
	public String paymentFail() {
		return "결제가 실패했습니다.";
	}

}
