package com.smhrd.Arti.Controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/api/predict")
public class PredictionController {

	private static final String FASTAPI_URL = "http://fastapi-server-url/predict/";

    @PostMapping("/image-url")
    public ResponseEntity<String> sendImageUrl(@RequestParam("imageUrl") String imageUrl) {
        RestTemplate restTemplate = new RestTemplate();

        // FastAPI로 요청 보낼 URL을 구성합니다.
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(FASTAPI_URL)
                .queryParam("imageUrl", imageUrl);

        // FastAPI 서버로 이미지 URL을 전달하고 결과 받기
        ResponseEntity<String> response = restTemplate.exchange(
                builder.toUriString(), HttpMethod.GET, HttpEntity.EMPTY, String.class);

        // FastAPI에서 예측 결과 반환
        return response;
    }
}
	
