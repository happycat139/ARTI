package com.smhrd.Arti.Service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class YoloService {

    public String analyzeImage(String imageUrl) {
        // FastAPI 서버 주소
        String fastApiUrl = "http://localhost:8000/analyze";

        // 요청 데이터 설정
        Map<String, String> requestData = new HashMap<>();
        requestData.put("image_url", imageUrl);

        // REST 요청
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(fastApiUrl, requestData, String.class);

        return response.getBody(); // YOLOv5 분석 결과
    }
}