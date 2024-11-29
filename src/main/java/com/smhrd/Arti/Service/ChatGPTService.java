package com.smhrd.Arti.Service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.smhrd.Arti.Model.ChatGPTRequest;
import com.smhrd.Arti.Model.ChatGPTResponse;
import com.smhrd.Arti.Model.ChatMessage;
import com.smhrd.Arti.Model.StoryBook;

import jakarta.servlet.http.HttpSession;

@Service
public class ChatGPTService {

	private final RestTemplate restTemplate;

    // 줄거리 생성용 모델 설정
    private final String storylineModel = "gpt-4o";
    private final String url = "https://api.openai.com/v1/chat/completions";

    @Autowired
    public ChatGPTService(@Qualifier("template") RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    
    
    // 동화의 틀 설정
    public String makeBase(String prompt, HttpSession session) {
    	
    	// 동화 형식으로 요청하는 메시지를 작성
        String storyPrompt = "너는 초등학교 저학년 아이들을 위한 동화를 만들거야. 동화는 흥미롭고, 상상력을 자극하면서도 개연성 있는 이야기일 거야.\n"
        		+ "아이들은 너의 동화를 읽고 재미와 교훈을 얻을 수 있을거야.\n"
        		+ "\n"
        		+ "동화를 쓸 때 아래의 가이드라인을 지켜줘.\n"
        		+ "- 쉬운 단어를 사용한다.\n"
        		+ "- 이야기에는 기승전결이 있다.\n"
        		+ "- 친절하고 따뜻한 말투를 사용한다."
        		+ "\n"
        		+ "다음은 내가 받고자 하는 정보야.\n"
        		+ "책 제목, 장르, 배경, 주제, 주인공 이름, 요약 줄거리\n"
        		+ "\n"
        		+ "받고자하는 정보에서 몇 개는 가이드 라인을 정해줄게.\n"
        		+ "- 책 제목 : 동화의 핵심을 표현할 수 있는 재미있어야해.\n"
        		+ "- 장르 : 동화 중 어떤 장르에 해당하는 지 적어줘.\n"
        		+ "- 배경 : 이야기가 전개되는 장소와 시대를 적어줘.\n"
        		+ "- 요약 줄거리 : 결말은 제외하고 관심을 유도할 수 있는 550자 정도의 분량이여야 해.\n"
        		+ "\n"
        		+ "가장 중요한 것은 책 제목, 장르, 배경, 주제, 주인공 이름, 요약 줄거리를 구분기호(#)로 나눠서 보내줘야해. 다음 예시와 똑같은 형식으로 보내줘야해"
        		+ "책 제목, 장르, 배경, 주제, 주인공 이름, 요약 줄거리라는 단어는 절대로 포함하지마.\n"
        		+ "예시: 책 제목#배경#주제#주인공 이름#요약줄거리\n"
        		+ "\n"
        		+ "다음 주제로 만들어줘\n"
        		+ "주제 : " + prompt;
    	
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
        String storyline = response.getBody().getChoices().get(0).getMessage().getContent();
        
     // 세션에 초기 요청/응답 저장
        session.setAttribute("prompt", prompt);
        session.setAttribute("storyline", storyline);

        return storyline;
    }
    
    // 동화 기본정보 재생성
    public String remakeBase(String reprompt, HttpSession session) {
        // 세션에서 이전 요청과 응답 가져오기
        String prompt = (String) session.getAttribute("prompt");
        String storyline = (String) session.getAttribute("storyline");
               
        if (prompt == null || storyline == null) {
            throw new IllegalArgumentException("이전에 생성된 데이터가 없어 재생성을 진행할 수 없습니다.");
        }

        // 재생성 요청 메시지 작성
        String storyPrompt = """
            이전 요청: %s
            이전 응답: %s
            추가 조건: %s
            이전 요청과 응답을 보고 추가 조건 반영해 수정해서 이전 요청을 재작성해줘.
            단 다음 조건을 무조건 지켜야해. 무슨 일이 있어도 조건을 엄수해야 해.
        	조건 1: 모든 요소들(제목,장르,배경,주제,주인공,요약줄거리)을 ###으로 나눠서 보내줘야 해.
        	예를 들어 고양이의 모험###고전동화###조선시대###고양이가 긴 모험을 떠나며 도전정신을 갖게 되는 이야기###나비
        	###한 마을에 호기심 많은 작은 고양이, 이름은 나비가 살고 있었습니다. 나비는 항상 창문 밖 세상에 호기심이 많았지만, 위험하고 두려운 외부 세계를 넘어서기에는 용기가 부족했습니다.
        	그러나 어느 날, 나비는 우연히 숲 속에서 반짝이는 보석처럼 빛나는 낯선 물건을 발견하게 됩니다
        	그것은 마치 나비를 부르는 것 같았습니다. 그 순간, 나비의 가슴 속에 도전정신이 불타오르기 시작했습니다
        	나비는 마음을 단단히 먹고 그 빛나는 물건을 찾기 위해 모험을 떠나기로 결심했습니다... 이런식으로 써줘
        	조건 2: 너가 보내주는 텍스트에 제목,장르,배경,주인공,요약,줄거리 이런 단어를 모두 제거해
        	조건 3: 맨 앞과 끝에 ### 붙이지 마.
            """.formatted(prompt, storyline, reprompt);

        // messages 구성
        List<ChatMessage> messages = Arrays.asList(
            new ChatMessage("system", "You are a helpful assistant."),
            new ChatMessage("user", storyPrompt)
        );

        // 요청 데이터 구성
        ChatGPTRequest request = new ChatGPTRequest(storylineModel, messages);
        HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(request);

        // API 호출
        ResponseEntity<ChatGPTResponse> response = restTemplate.exchange(url, HttpMethod.POST, entity, ChatGPTResponse.class);
        storyline = response.getBody().getChoices().get(0).getMessage().getContent();

     // 세션에 요청/응답 저장
        session.setAttribute("prompt", prompt);
        session.setAttribute("storyline", storyline);

        return storyline;
    }
    
    
    
    
    
    
    
    
    // 동화 11 페이지 줄거리 생성
    public String makeStory(StoryBook story) {
        // GPT 요청 메시지 작성
        String fullPrompt = story.getBook_name() + "라는 제목을 가진 동화야. 이 동화의 장르는 " + story.getBook_genre() + 
            "이며, 배경은 " + story.getBook_background() + "야. 주제는 '" + story.getBook_subject() + 
            "'이며, 주인공은 " + story.getBook_mc() + "야. 요약 줄거리는 다음과 같아: " + story.getBook_summary() + 
            ". 이 내용을 기반으로 동화 줄거리를 11페이지로 만들어줘. "
            + "단 다음 조건을 무조건 지켜야해. 무슨 일이 있어도 조건을 엄수해야 해.\n"
    		+ "조건 1: 모든 페이지를 ###으로 나눠서 보내줘야 해.\n"
            + "조건 2: 각 페이지당 글자 수는 200자 정도로 만들어줘\n"
    		+ "조건 3: 맨 앞과 끝에 ### 붙이지 마."
            + "조건 4: 너가 보내주는 텍스트에 줄거리, 페이지 이런 단어를 제거해줘. 페이지를 나누는 숫자도 금지야."
    		+ "조건 5: 꼭 11페이지로 만들어줘야 해."
        	+ "조건 6: 다음 예시를 따라서 보내줘. 예시 : 줄거리1###줄거리2###줄거리3###...###줄거리10###줄거리11";

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
