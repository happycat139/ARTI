package com.smhrd.Arti.Service;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;


@Service
public class YoloService {

    private final RestTemplate restTemplate = new RestTemplate();

    public String analyzeImage(String imageUrl) {
        String yoloApiUrl = "http://127.0.0.1:8000/predict/";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        // 요청 생성
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("file", new FileSystemResource(imageUrl)); // 로컬 이미지 경로 또는 파일
        HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(body, headers);

        // FastAPI 호출
        ResponseEntity<String> response = restTemplate.postForEntity(yoloApiUrl, request, String.class);
        return response.getBody();
    }
}