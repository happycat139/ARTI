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
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.UserRepository;

import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PaymentService {

	 private final PaymentProperties paymentProperties;
	    private final UserRepository userRepository;
	    private final RestTemplate restTemplate = new RestTemplate();

	 // 결제 요청
	    public Map<String, String> requestPayment(String orderId, int amount) {
	        String url = paymentProperties.getBaseUrl();
	        HttpHeaders headers = new HttpHeaders();
	        headers.setBasicAuth(paymentProperties.getSecretKey(), ""); // Secret Key 설정
	        headers.setContentType(MediaType.APPLICATION_JSON);

	        // 요청 본문
	        Map<String, Object> body = new HashMap<>();
	        body.put("amount", amount);
	        body.put("orderId", orderId);
	        body.put("orderName", "코인 충전");
	        body.put("successUrl", paymentProperties.getSuccessUrl());
	        body.put("failUrl", paymentProperties.getFailUrl());

	        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);

	        try {
	            ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);
	            Map<String, Object> responseBody = response.getBody();

	            System.out.println("Toss Payments 요청 응답: " + responseBody);

	            // 결제 URL 반환
	            Map<String, String> paymentResponse = new HashMap<>();
	            paymentResponse.put("paymentUrl", (String) ((Map<String, Object>) responseBody.get("checkout")).get("url"));
	            paymentResponse.put("orderId", orderId);
	            return paymentResponse;
	        } catch (HttpServerErrorException e) {
	            throw new RuntimeException("Toss Payments 요청 실패: " + e.getResponseBodyAsString());
	        }
	    }

	    // 결제 성공 처리
	    public void handlePaymentSuccess(String paymentKey, User user, int amount) {
	        String verifyUrl = paymentProperties.getBaseUrl() + "/" + paymentKey;
	        HttpHeaders headers = new HttpHeaders();
	        headers.setBasicAuth(paymentProperties.getSecretKey(), "");

	        int retryCount = 3; // 최대 3번 재시도
	        for (int i = 0; i < retryCount; i++) {
	            try {
	                // 일정 시간 대기 (예: 1초)
	                Thread.sleep(1000);

	                HttpEntity<Void> request = new HttpEntity<>(headers);
	                ResponseEntity<Map> response = restTemplate.exchange(verifyUrl, HttpMethod.GET, request, Map.class);

	                Map<String, Object> responseBody = response.getBody();
	                System.out.println("Toss Payments 검증 응답: " + responseBody);

	                if ("DONE".equals(responseBody.get("status"))) {
	                    // 결제 성공 처리
	                    int coinsToAdd = amount / 1000;
	                    user.setCoin(user.getCoin() + coinsToAdd);
	                    userRepository.save(user);
	                    return; // 성공하면 메서드 종료
	                }
	            } catch (InterruptedException e) {
	                throw new RuntimeException("결제 검증 대기 중 오류 발생", e);
	            }
	        }

	        throw new RuntimeException("결제 검증 실패: 결제가 완료되지 않았습니다.");
	    }



}
