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
        
        System.out.println("imageUrl 1 :" + imageUrl);

        // 요청 생성
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        //body.add("file", new FileSystemResource(imageUrl)); // 로컬 이미지 경로 또는 파일
        body.add("file", imageUrl); // 로컬 이미지 경로 또는 파일
        
        System.out.println("body :" + body);

        
        System.out.println("imageUrl 2 :" + imageUrl);
        //HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(body, headers);
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("file", imageUrl);

        System.out.println("***************************************");
        System.out.println("imageUrl:" + imageUrl);
        //System.out.println("request : " + request);
        
        
        // FastAPI 호출
        //ResponseEntity<String> response = restTemplate.postForEntity(yoloApiUrl, request, String.class);
        ResponseEntity<String> response = restTemplate.postForEntity(yoloApiUrl, parameters, String.class);
        
        System.out.println("555555555555555555555555555555555");
        System.out.println("response:" + response);
        
        return response.getBody();
    }
}