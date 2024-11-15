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
    private final String storylineModel = "gpt-4o";
    private final String url = "https://api.openai.com/v1/chat/completions";

    @Autowired
    public ChatGPTService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String generateStoryline(String prompt) {
    	
    	// 동화 형식으로 요청하는 메시지를 작성
        String storyPrompt = prompt + "라는 주제를 바탕으로 초등학교 저학년 수준의 동화를 11페이지로 만들어줘. 만들 때 최대한 한국 유아 동화 스타일을 참고해줘. \n"
        		+ "제목, 장르, 배경, 주제, 주인공도 같이 적어줘 \n"
        		+ "\n"
        		+ "단 다음 조건을 무조건 지켜야해. 무슨 일이 있어도 조건을 엄수해야 해.\n"
        		+ "조건 1: 모든 요소들(제목,장르,배경,주제,주인공,동화줄거리1페이지,동화줄거리2페이지,...)을 ###으로 나눠서 보내줘야 해.\n"
        		+ "예를 들어 고양이의모험###고전동화###조선시대###고양이가 긴 모험을 떠나며 도전정신을 갖게 되는 이야기###나비###한 마을에 호기심 많은 작은 고양이, 이름은 나비가 살고 있었습니다. 나비는 항상 창문 밖 세상에 호기심이 많았지만, 위험하고 두려운 외부 세계를 넘어서기에는 용기가 부족했습니다. 그러나 어느 날, 나비는 우연히 숲 속에서 반짝이는 보석처럼 빛나는 낯선 물건을 발견하게 됩니다. 그것은 마치 나비를 부르는 것 같았습니다. 그 순간, 나비의 가슴 속에 도전정신이 불타오르기 시작했습니다.###나비는 마음을 단단히 먹고 그 빛나는 물건을 찾기 위해 모험을 떠나기로 결심했습니다. 이런식으로 써줘\n"
        		+ "조건 2: 너가 보내주는 텍스트에 제목,장르,배경,주인공,줄거리 이런 단어를 모두 제거해\n 조건 3: 맨 앞에 ### 붙이지 마.\n 조건 4: 줄거리가 꼭 11페이지여야해.";
    	
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
