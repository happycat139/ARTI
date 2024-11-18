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
import com.smhrd.Arti.Model.Story;

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

    
    
    // 동화의 틀 설정
    public String makeBase(String prompt) {
    	
    	// 동화 형식으로 요청하는 메시지를 작성
        String storyPrompt = prompt + "라는 주제를 바탕으로 초등학교 저학년 수준의 동화의 요약 줄거리를 500자 정도로 만들어줘. "
        		+ "만들 때 최대한 한국 유아 동화 스타일을 참고해줘.\n"
        		+ "제목, 장르, 배경, 주제, 주인공도 같이 적어줘.\n"
        		+ "단 다음 조건을 무조건 지켜야해. 무슨 일이 있어도 조건을 엄수해야 해.\n"
        		+ "조건 1: 모든 요소들(제목,장르,배경,주제,주인공,요약줄거리)을 ###으로 나눠서 보내줘야 해.\n"
        		+ "예를 들어 고양이의 모험###고전동화###조선시대###고양이가 긴 모험을 떠나며 도전정신을 갖게 되는 이야기###나비"
        		+ "###한 마을에 호기심 많은 작은 고양이, 이름은 나비가 살고 있었습니다. 나비는 항상 창문 밖 세상에 호기심이 많았지만, 위험하고 두려운 외부 세계를 넘어서기에는 용기가 부족했습니다."
        		+ " 그러나 어느 날, 나비는 우연히 숲 속에서 반짝이는 보석처럼 빛나는 낯선 물건을 발견하게 됩니다. "
        		+ "그것은 마치 나비를 부르는 것 같았습니다. 그 순간, 나비의 가슴 속에 도전정신이 불타오르기 시작했습니다."
        		+ "나비는 마음을 단단히 먹고 그 빛나는 물건을 찾기 위해 모험을 떠나기로 결심했습니다... 이런식으로 써줘\n"
        		+ "조건 2: 너가 보내주는 텍스트에 제목,장르,배경,주인공,요약,줄거리 이런 단어를 모두 제거해\n"
        		+ " 조건 3: 맨 앞과 끝에 ### 붙이지 마.\n "
        		+ "조건 4: 전체 줄거리 중 서두 부분을 중심으로 요약 줄거리를 생성하도록 하고, 결말까지 나오는 것이 아니라 앞쪽의 주요 내용을 중심으로 흥미로운 이야기를 만들어줘";
    	
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
    
    
    
    // 동화 11 페이지 줄거리 생성
    public String makeStory(Story story) {
        // GPT 요청 메시지 작성
        String fullPrompt = story.getB_title() + "라는 제목을 가진 동화야. 이 동화의 장르는 " + story.getB_genre() + 
            "이며, 배경은 " + story.getB_background() + "야. 주제는 '" + story.getB_Theme() + 
            "'이며, 주인공은 " + story.getB_mc() + "야. 요약 줄거리는 다음과 같아: " + story.getB_summary() + 
            ". 이 내용을 기반으로 동화 줄거리를 11페이지로 만들어줘. "
            + "단 다음 조건을 무조건 지켜야해. 무슨 일이 있어도 조건을 엄수해야 해.\n"
    		+ "조건 1: 모든 페이지를 ###으로 나눠서 보내줘야 해.\n"
            + "조건 2: 각 페이지당 글자 수는 200자 정도로 만들어줘\n"
    		+ "조건 3: 맨 앞과 끝에 ### 붙이지 마."
            + "조건 4: 너가 보내주는 텍스트에 줄거리, 페이지 이런 단어를 제거해줘. 페이지를 나누는 숫자도 금지야.";

        // GPT 메시지 구성
        List<ChatMessage> messages = Arrays.asList(
            new ChatMessage("system", "You are a helpful assistant."),
            new ChatMessage("user", fullPrompt)
        );

        ChatGPTRequest request = new ChatGPTRequest(storylineModel, messages);
        HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(request);

        ResponseEntity<ChatGPTResponse> response = restTemplate.exchange(url, HttpMethod.POST, entity, ChatGPTResponse.class);

        return response.getBody().getChoices().get(0).getMessage().getContent();
    }
    
    
    
    

}
