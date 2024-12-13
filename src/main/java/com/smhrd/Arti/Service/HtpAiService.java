package com.smhrd.Arti.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.Arti.Model.ChatGPTRequest;
import com.smhrd.Arti.Model.ChatGPTResponse;
import com.smhrd.Arti.Model.ChatMessage;

@Service
public class HtpAiService {

    private final RestTemplate restTemplate;

    // OpenAI API 설정
    private final String model = "gpt-4";
    private final String url = "https://api.openai.com/v1/chat/completions";

    @Autowired
    public HtpAiService(@Qualifier("template") RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    private final ObjectMapper objectMapper = new ObjectMapper();

    public Map<String, String> getExplanations(Map<String, Integer> symptomScores) {
        // OpenAI 요청 메시지 작성
        List<ChatMessage> messages = new ArrayList<>();
        messages.add(new ChatMessage("system", """
            너는 심리 상담사처럼 행동해야 해.
            클라이언트가 제공한 점수를 기반으로 간단하고 이해하기 쉬운 해설을 제공해줘.
            이 점수는 Htp 검사를 해서 나온 결과야. 대상자는 초등학생이고 보는 사람은 부모님이야.
            각 점수와 관련된 해설은 JSON 형식으로 작성해야 해.
            절대로 JSON 형식 외의 다른 형식으로 응답하지 마.
            형식은 다음과 같아야 해:
            {
                "점수 이름": "해설",
                ...
            }
        """));

        StringBuilder promptBuilder = new StringBuilder("점수와 이름은 다음과 같습니다:\n");
        symptomScores.forEach((key, value) -> promptBuilder.append(key).append(": ").append(value).append("점\n"));
        promptBuilder.append("이 점수를 기반으로 해설을 작성해주세요.");

        messages.add(new ChatMessage("user", promptBuilder.toString()));

        // 요청 데이터 구성
        ChatGPTRequest request = new ChatGPTRequest(model, messages);
        HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(request);

        try {
            // OpenAI API 호출
            ResponseEntity<ChatGPTResponse> response = restTemplate.exchange(url, HttpMethod.POST, entity, ChatGPTResponse.class);

            // GPT 응답 데이터 추출
            String content = response.getBody().getChoices().get(0).getMessage().getContent();

            // JSON 데이터 파싱
            return objectMapper.readValue(content, Map.class);

        } catch (JsonMappingException e) {
            throw new RuntimeException("JSON 매핑 중 오류 발생: " + e.getMessage(), e);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("JSON 처리 중 오류 발생: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException("OpenAI API 호출 중 오류 발생: " + e.getMessage(), e);
        }
    }
}
