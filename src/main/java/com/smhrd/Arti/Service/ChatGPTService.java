package com.smhrd.Arti.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.Arti.Model.ChatGPTRequest;
import com.smhrd.Arti.Model.ChatGPTResponse;
import com.smhrd.Arti.Model.ChatMessage;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.StoryContent;

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

	private final ObjectMapper objectMapper = new ObjectMapper(); // 동화의 틀 설정

	
	
	public StoryBook makeBase(String prompt, HttpSession session) {
		
		
		// 세션 초기화
	    session.setAttribute("regenerateCount", 0); // 재생성 횟수 초기화
	    session.setAttribute("allRequests", new ArrayList<String>()); // 요청 리스트 초기화
	    session.setAttribute("allResponses", new ArrayList<String>()); // 응답 리스트 초기화
	    
		// 메시지 구성
		List<ChatMessage> messages = Arrays.asList(new ChatMessage("system", """
				     너는 동화를 전문으로 작성하는 AI야.
				   동화는 다음 조건을 따르며 작성해야 해:
				   - 초등학교 저학년 아이들을 위한 이야기
				   - 쉬운 단어 사용, 기승전결 구조 유지
				   - 응답 형식은 반드시 JSON 형식이어야 해. 절대로 다른 형식을 사용하지 마.
				   - JSON 키는 다음과 같아야 해:
				     {
				       "book_name": "책 제목",
				       "book_genre": "책 장르",
				       "book_background": "배경",
				       "book_subject": "주제",
				       "book_mc": "주인공 이름",
				       "book_summary": "요약 줄거리"
				     }
				   - JSON 구조를 엄수하고, 부가적인 설명은 하지 마.
				   - 책 제목 : 동화의 핵심을 표현할 수 있는 재미있어야해.
				   - 책 장르: 어떤 동화인지 동화 장르를 적어줘.
				- 배경 : 이야기가 전개되는 장소 또는 시대를 적어줘.
				- 요약 줄거리 : 결말은 제외하고 관심을 유도할 수 있는 500자 분량이여야 해.
				- 주제를 보낼테니 신중하게 모든 요소를 채워서 보내줘.
				     """), new ChatMessage("user", String.format("주제: %s", prompt)));

		// 요청 데이터 구성
		ChatGPTRequest request = new ChatGPTRequest(storylineModel, messages);
		HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(request);

		try {
			// API 호출
			ResponseEntity<ChatGPTResponse> response = restTemplate.exchange(url, HttpMethod.POST, entity,
					ChatGPTResponse.class);

			// GPT 응답 데이터 추출
			String content = response.getBody().getChoices().get(0).getMessage().getContent();

			// 포맷팅 문자 제거
			String cleanedContent = content.replaceAll("^```\\w+|```$", "").trim();

			// JSON 데이터를 Java 객체로 변환
			StoryBook storyBook = objectMapper.readValue(cleanedContent, StoryBook.class);

			// 세션 저장
			session.setAttribute("prompt", prompt);
			session.setAttribute("storybook", storyBook);

			return storyBook;
		} catch (JsonProcessingException e) {
			throw new RuntimeException("JSON 파싱 중 오류 발생: 응답 내용이 올바르지 않습니다.", e);
		} catch (Exception e) {
			throw new RuntimeException("서버에서 요청을 처리하는 중 문제가 발생했습니다.", e);
		}
	}

	
	public StoryBook remakeBase(String additionalPrompt, HttpSession session) {
	    // 세션에서 필요한 데이터 가져오기
	    String prompt = (String) session.getAttribute("prompt"); // 최초 요청
	    Integer regenerateCount = (Integer) session.getAttribute("regenerateCount"); // 현재 재생성 횟수
	    @SuppressWarnings("unchecked")
	    List<String> allRequests = (List<String>) session.getAttribute("allRequests");
	    @SuppressWarnings("unchecked")
	    List<String> allResponses = (List<String>) session.getAttribute("allResponses");

	    // 세션 초기화
	    if (regenerateCount == null) {
	        regenerateCount = 0;
	    }

	    // 첫 재생성 로직: `prompt`는 있지만 이전 응답이 없는 경우 처리
	    if (allResponses.isEmpty()) {
	        allRequests.add(prompt); // 최초 요청 추가
	        allResponses.add((String) session.getAttribute("storybookJson")); // 최초 응답 추가 (JSON 저장)
	    }

	    // 최대 재생성 횟수 초과 시 예외 발생
	    if (regenerateCount >= 3) {
	        throw new IllegalStateException("재생성은 최대 3번까지만 가능합니다.");
	    }

	    // 메시지 구성
	    List<ChatMessage> messages = new ArrayList<>();
	    messages.add(new ChatMessage("system", """
	        너는 동화를 전문으로 작성하는 AI야.
				   동화는 다음 조건을 따르며 작성해야 해:
				   - 초등학교 저학년 아이들을 위한 이야기
				   - 쉬운 단어 사용, 기승전결 구조 유지
				   - 응답 형식은 반드시 JSON 형식이어야 해. 절대로 다른 형식을 사용하지 마.
				   - JSON 키는 다음과 같아야 해:
				     {
				       "book_name": "책 제목",
				       "book_genre": "책 장르",
				       "book_background": "배경",
				       "book_subject": "주제",
				       "book_mc": "주인공 이름",
				       "book_summary": "요약 줄거리"
				     }
				   - JSON 구조를 엄수하고, 부가적인 설명은 하지 마.
				   - 책 제목 : 동화의 핵심을 표현할 수 있는 재미있어야해.
				   - 책 장르: 어떤 동화인지 동화 장르를 적어줘.
				- 배경 : 이야기가 전개되는 장소 또는 시대를 적어줘.
				- 요약 줄거리 : 결말은 제외하고 관심을 유도할 수 있는 500자 분량이여야 해.
				- 주제를 보낼테니 신중하게 모든 요소를 채워서 보내줘.
	        """));

	    // 이전 요청/응답 추가
	    for (int i = 0; i < allRequests.size(); i++) {
	        messages.add(new ChatMessage("user", "이전 요청: " + allRequests.get(i)));
	        messages.add(new ChatMessage("assistant", "이전 응답: " + allResponses.get(i)));
	    }

	    // 현재 추가 요청 추가
	    messages.add(new ChatMessage("user", String.format("추가 요구 사항: %s", additionalPrompt)));

	    // 요청 데이터 구성
	    ChatGPTRequest request = new ChatGPTRequest(storylineModel, messages);
	    HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(request);

	    // API 호출
	    ResponseEntity<ChatGPTResponse> response = restTemplate.exchange(url, HttpMethod.POST, entity, ChatGPTResponse.class);

	    // GPT 응답 데이터 추출
	    String content = response.getBody().getChoices().get(0).getMessage().getContent();

	    // 포맷팅 문자 제거
	    String cleanedContent = content.replaceAll("^```\\w+|```$", "").trim();

	    // JSON 데이터를 Java 객체로 변환
	    StoryBook storybook;
	    try {
	        storybook = objectMapper.readValue(cleanedContent, StoryBook.class);
	    } catch (JsonProcessingException e) {
	        throw new RuntimeException("JSON 파싱 중 오류 발생: 응답 내용이 올바르지 않습니다.", e);
	    }

	    // 세션에 데이터 저장
	    regenerateCount++;
	    allRequests.add(additionalPrompt);
	    allResponses.add(cleanedContent);

	    session.setAttribute("regenerateCount", regenerateCount);
	    session.setAttribute("allRequests", allRequests);
	    session.setAttribute("allResponses", allResponses);
	    session.setAttribute("storybook", storybook); // 최신 응답 저장

	    return storybook;
	}





	
	
	// 동화 11페이지 줄거리 생성 (StoryContent로 변환)
	public String makeStory(StoryBook story) {
	    // GPT 요청 메시지 작성
	    List<ChatMessage> messages = new ArrayList<>();
	    messages.add(new ChatMessage("system", """
	        너는 동화를 전문으로 작성하는 AI야.
	        동화는 다음 조건을 따르며 작성해야 해:
	        - 초등학교 저학년 아이들을 위한 이야기
	        - 쉬운 단어 사용, 기승전결 구조 유지
	        - 응답 형식은 반드시 JSON 형식이어야 해. 절대로 다른 형식을 사용하지 마.
	        - JSON 키는 다음과 같아야 해:
	          [
	            {"pageNum": 1, "content": "첫 번째 페이지 내용"},
	            {"pageNum": 2, "content": "두 번째 페이지 내용"},
	            ...
	            {"pageNum": 11, "content": "열한 번째 페이지 내용"}
	          ]
	        - 각 페이지당 글자 수는 약 200자로 작성해야 해.
	        - 반드시 11페이지를 작성해야 하며, 각 페이지는 독립된 내용을 가져야 해.
	        """));

	    String fullPrompt = String.format("""
	        동화의 제목은 '%s'이고, 장르는 '%s'입니다. 이야기는 '%s'라는 배경에서 전개되며, 주제는 '%s'입니다. 
	        주인공 이름은 '%s'입니다. 동화의 요약 줄거리는 다음과 같습니다: '%s'. 
	        이 내용을 기반으로 11페이지 분량의 줄거리를 JSON 형식으로 작성해줘.
	        """,
	        story.getBook_name(),
	        story.getBook_genre(),
	        story.getBook_background(),
	        story.getBook_subject(),
	        story.getBook_mc(),
	        story.getBook_summary());

	    messages.add(new ChatMessage("user", fullPrompt));

	    // GPT 요청 구성
	    ChatGPTRequest request = new ChatGPTRequest(storylineModel, messages);
	    HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(request);

	    // GPT API 호출
	    ResponseEntity<ChatGPTResponse> response = restTemplate.exchange(url, HttpMethod.POST, entity,
	            ChatGPTResponse.class);

	    // GPT 응답 데이터 추출
	    String storylineJson =  response.getBody().getChoices().get(0).getMessage().getContent();
	    
	    // 불필요한 백틱(```json`) 제거 및 클린업
	    String cleanedJson = storylineJson
	        .replaceAll("^```json|```$", "") // 백틱 제거
	        .trim(); // 공백 제거

	    // JSON 유효성 검증 로그 출력
	    System.out.println("클린업된 JSON 데이터: " + cleanedJson);

	    // 반환
	    return cleanedJson;

	}

}
