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
    private final String storylineModel = "gpt-3.5-turbo";
    private final String url = "https://api.openai.com/v1/chat/completions";

    @Autowired
    public ChatGPTService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String generateStoryline(String prompt) {
    	
    	// 동화 형식으로 요청하는 메시지를 작성
        String storyPrompt = prompt + " 이 주제로 동화 줄거리를 작성해 주세요. 대상은 초등학교 저학년입니다. 동화책에 들어갈 내용만 담아주세요.";
    	
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
