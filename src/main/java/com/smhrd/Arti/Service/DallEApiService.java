package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Service
public class DallEApiService {

    private static final String API_URL = "https://api.openai.com/v1/images/generations";
    private static final String MODEL_NAME = "dall-e-3"; // 명시적으로 DALL-E 3 모델 설정
    private final RestTemplate dalleRestTemplate;

    @Autowired
    public DallEApiService(@Qualifier("dalleRestTemplate") RestTemplate restTemplate) {
        this.dalleRestTemplate = restTemplate;
    }

    public String generateImage(String prompt) {
        System.out.println("DALL-E 서비스 진입");

        try {
            // JSON 객체 생성
            ObjectMapper objectMapper = new ObjectMapper();
            ObjectNode requestBody = objectMapper.createObjectNode();
            requestBody.put("model", MODEL_NAME); // 모델 명시
            requestBody.put("prompt", prompt.replace("\n", " ").replace("\r", " ").replace("\"", "\\\"").replace("\t", " "));
            requestBody.put("n", 1);
            requestBody.put("size", "1024x1024");

            // HttpEntity 생성
            HttpHeaders headers = new HttpHeaders();
            headers.set("Content-Type", "application/json");
            HttpEntity<String> entity = new HttpEntity<>(requestBody.toString(), headers);

            // API 호출
            ResponseEntity<String> response = dalleRestTemplate.postForEntity(API_URL, entity, String.class);

            System.out.println("DALL-E API 응답: " + response.getBody());

            // JSON 파싱 및 URL 추출
            JsonNode root = objectMapper.readTree(response.getBody());
            return root.path("data").get(0).path("url").asText(); // 생성된 이미지 URL 반환
        } catch (Exception e) {
            throw new RuntimeException("DALL-E API 요청 또는 응답 처리 중 오류 발생", e);
        }
    }
}
