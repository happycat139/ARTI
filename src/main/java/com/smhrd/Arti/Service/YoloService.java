package com.smhrd.Arti.Service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class YoloService {

    private final RestTemplate restTemplate = new RestTemplate();
    private final String yoloApiUrl = "http://localhost:8000/predict"; // YOLO FastAPI URL

    public String sendUrlToYolo(String imageUrl) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // 요청 바디에 GCP URL 전달
        String requestBody = String.format("{\"image_url\": \"%s\"}", imageUrl);
        HttpEntity<String> request = new HttpEntity<>(requestBody, headers);

        return restTemplate.postForObject(yoloApiUrl, request, String.class);
    }
}
