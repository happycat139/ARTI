package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class DallEApiService {

	private static final String API_URL = "https://api.openai.com/v1/images/generations";

	private final RestTemplate dalleRestTemplate;

	@Autowired
	public DallEApiService(@Qualifier("dalleRestTemplate") RestTemplate dallRestTemplate) {
		this.dalleRestTemplate = dallRestTemplate;
	}

	public String generateImage(String Iprompt) {

		System.out.println("dalle 서비스 진입");

		// 특수문자와 줄바꿈 처리
		String sanitizedPrompt = Iprompt.replace("\n", " ") // 줄바꿈을 공백으로 변환
				.replace("\r", " ") // 캐리지 리턴 제거
				.replace("\"", "\\\"") // 따옴표 이스케이프 처리
				.replace("\t", " "); // 탭 문자를 공백으로 변환

		// 요청 본문 생성
		String requestBody = String.format(
				"{ \"model\": \"dall-e-2\", \"prompt\": \"%s\", \"n\": 1, \"size\": \"1024x1024\" }", sanitizedPrompt);

		try {
			// API 호출
			String jsonResponse = dalleRestTemplate.postForObject(API_URL, requestBody, String.class);

			System.out.println("DALL-E API 응답: " + jsonResponse);

			// JSON 파싱 및 URL 추출
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode root = objectMapper.readTree(jsonResponse);
			return root.path("data").get(0).path("url").asText(); // URL 직접 반환

		} catch (Exception e) {
			throw new RuntimeException("DALL-E API 요청 또는 응답 처리 중 오류 발생", e);
		}
	}
}
