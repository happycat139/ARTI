package com.smhrd.Arti.Service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.api.client.http.HttpHeaders;
import com.google.api.client.util.Value;
import com.smhrd.Arti.Model.ChatGPTRequest;
import com.smhrd.Arti.Model.ChatGPTResponse;
import com.smhrd.Arti.Model.ChatMessage;

@Service
public class ChatGPTService {

	private final RestTemplate restTemplate;

    // 줄거리 생성용 모델 설정
    private final String storylineModel = "gpt-4";
    private final String url = "https://api.openai.com/v1/chat/completions";

    @Autowired
    public ChatGPTService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String generateStoryline(String prompt) {
    	
    	// 동화 형식으로 요청하는 메시지를 작성
        String storyPrompt = prompt + "라는 주제를 바탕으로 초등학교 저학년 수준의 동화를 11페이지 분량으로 만들어줘. 만들 때 최대한 한국 유아 동화 스타일을 참고해주고 \n"
        		+ "각 페이지는 '###'로 구분해줘\n"
        		+ "동화책에 들어갈 내용만 담아. 예시 : 동화줄거리1###동화줄거리2###동화줄거리3###동화줄거리4###"
        		+ "동화줄거리5###동화줄거리6###동화줄거리7###동화줄거리8###동화줄거리9###동화줄거리10###동화줄거리11\n 이 예시의 형식을 꼭 따라서 보내줘. 페이지 사이에만 ### 붙여주면 돼"
        		+ "동화줄거리1: 이런거 절대 포함시키면 안 돼. ";
    	
        // messages 파라미터 구성 (ChatMessage 객체로)
        List<ChatMessage> messages = Arrays.asList(
                new ChatMessage("system", "You are a helpful assistant."),
                new ChatMessage("user", storyPrompt)
        );

        // 요청 데이터 구성
        ChatGPTRequest request = new ChatGPTRequest(storylineModel, messages);

        // HttpEntity 생성 (헤더 설정 불필요)
        HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(request);

        // API 호출
        ResponseEntity<ChatGPTResponse> response = restTemplate.exchange(url, HttpMethod.POST, entity, ChatGPTResponse.class);

        // 응답에서 첫 번째 메시지의 내용 반환
        return response.getBody().getChoices().get(0).getMessage().getContent();
    }

}
