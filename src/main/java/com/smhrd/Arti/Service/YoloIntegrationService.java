package com.smhrd.Arti.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.Arti.Model.DetectedObject;
import com.smhrd.Arti.Repo.ObjectRepository;


@Service
public class YoloIntegrationService {

	
	private final RestTemplate restTemplate;
	private final ObjectMapper objectMapper;
	private final ObjectRepository objectRepository;
	
	public YoloIntegrationService(
			@Qualifier("template") RestTemplate restTemplate,
			ObjectMapper objectMapper,
			ObjectRepository objectRepository
			) {
		this.restTemplate = restTemplate;
		this.objectMapper = objectMapper;
		this.objectRepository = objectRepository;
	}
	
	// 이미지 Url 모델 전달
	public String analyzeImage(String imageUrl) {
		String fastApiUrl = "http://localhost:8000/analyze";
		Map<String, String> request = new HashMap<>();
		request.put("image_url", imageUrl);
		
		return restTemplate.postForObject(fastApiUrl, request, String.class);
	}
	
	// 결과 저장하기
	   public List<DetectedObject> parseAndSaveResults(String yoloResultJson, Long fileIdx) {
	        try {
	        	
	        	// JSON 파싱
	            JsonNode rootNode = objectMapper.readTree(yoloResultJson);
	            
	            System.out.println("-------------");
	            System.out.println("yoloResultJson : " + yoloResultJson);
	            
	            JsonNode analysisResultNode = rootNode.get("analysis_result");

	            // Null 체크
	            if (analysisResultNode == null || !analysisResultNode.isArray()) {
	                throw new RuntimeException("'analysis_result' 필드가 JSON에 존재하지 않거나 배열이 아닙니다.");
	            }
	            
	            // JSON에서 "analysis_result" 배열만 추출
	            List<DetectedObject> detectedObjects = objectMapper.readValue(
	            		analysisResultNode.toString(),
	                    new TypeReference<List<DetectedObject>>() {}
	            );

	            // file_idx를 각 객체에 설정하고 저장
	            detectedObjects.forEach(obj -> {
	                obj.setFile_idx(fileIdx); // 외래 키 설정
	                objectRepository.save(obj); // DB에 저장
	            });

	            return detectedObjects; // 저장된 객체 리스트 반환
	        } catch (Exception e) {
	            throw new RuntimeException("YOLO 결과 처리 중 오류 발생: " + e.getMessage(), e);
	        }
	    }
	}