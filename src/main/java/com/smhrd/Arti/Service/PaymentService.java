package com.smhrd.Arti.Service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;

import com.smhrd.Arti.Configuration.PaymentProperties;
import com.smhrd.Arti.Repo.UserRepository;

import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PaymentService {

	private final PaymentProperties paymentProperties; // 설정 주입
	private final UserRepository repo;
	private final RestTemplate restTemplate = new RestTemplate();

	// 1. 결제 요청
	public ResponseEntity<Map> requestPayment(String orderId, int amount) {
	    try {
	    	
	    	System.out.println("Base URL: " + paymentProperties.getBaseUrl());
	    	System.out.println("Secret Key: " + paymentProperties.getSecretKey());

	    	
	        String url = paymentProperties.getBaseUrl();

	        // 헤더 설정
	        HttpHeaders headers = new HttpHeaders();
	        headers.setBasicAuth(paymentProperties.getSecretKey(), ""); // Secret Key 가져오기
	        headers.setContentType(MediaType.APPLICATION_JSON); // 반드시 JSON 타입으로 설정

	        // 요청 본문 (JSON 형식)
	        Map<String, Object> body = new HashMap<>();
	        body.put("amount", amount);
	        body.put("orderId", orderId);
	        body.put("orderName", "코인 충전");
	        body.put("successUrl", paymentProperties.getSuccessUrl());
	        body.put("failUrl", paymentProperties.getFailUrl());

	        // 요청 본문을 JSON으로 변환
	        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);

	        // Toss API 호출
	        return restTemplate.postForEntity(url, request, Map.class);

	    } catch (HttpServerErrorException e) {
	        System.out.println("Toss API Error: " + e.getResponseBodyAsString());
	        throw new RuntimeException("Toss API 요청 실패: " + e.getMessage());
	    }
	}


	// 2. 결제 확인
	public ResponseEntity<Map> confirmPayment(String paymentKey) {
		String url = paymentProperties.getBaseUrl() + "/" + paymentKey;

		// 헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setBasicAuth(paymentProperties.getSecretKey(), ""); // Secret Key 가져오기

		// API 호출
		HttpEntity<Void> request = new HttpEntity<>(headers);
		return restTemplate.exchange(url, HttpMethod.GET, request, Map.class);
	}

	// 3. 데이터베이스 업데이트
	public void handlePaymentSuccess(String paymentKey, String email, int amount) {
		ResponseEntity<Map> response = confirmPayment(paymentKey);

		if ("DONE".equals(response.getBody().get("status"))) {
			int coinsToAdd = amount / 1000; // 예: 1000원당 1코인 충전
			repo.addCoins(email, coinsToAdd);
		} else {
			throw new RuntimeException("결제가 완료되지 않았습니다.");
		}
	}

}
