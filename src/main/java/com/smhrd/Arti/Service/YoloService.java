package com.smhrd.Arti.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.smhrd.Arti.Model.AnalysisObject;
import com.smhrd.Arti.Model.Upload;
import com.smhrd.Arti.Repo.ObjectRepository;
import com.smhrd.Arti.Repo.UploadRepository;


@Service
public class YoloService {
	
	@Autowired
	ObjectRepository objectRepository;
	
	@Autowired
	UploadRepository uploadRepository;

    public String analyzeImage(String imageUrl) {
        // FastAPI 서버 주소
        String fastApiUrl = "http://localhost:8000/analyze";

        // 요청 데이터 설정
        Map<String, String> requestData = new HashMap<>();
        requestData.put("image_url", imageUrl);

        // REST 요청
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(fastApiUrl, requestData, String.class);

        return response.getBody(); // YOLOv5 분석 결과
    }
    
    /* 분석 정보 저장 메소드 */
    public void saveAnalysisResults(List<AnalysisObject> results, Long file_idx) {
    	
    	Upload upload = uploadRepository.findById(file_idx)
                .orElseThrow(() -> new IllegalArgumentException("Invalid file ID"));
    	
        results.forEach(result -> {
        	AnalysisObject analysisObject = AnalysisObject.builder()
                    .upload(upload)
                    .obj_name(result.getObj_name())
                    .x_min(result.getX_min())
                    .y_min(result.getY_min())
                    .x_max(result.getX_max())
                    .y_max(result.getY_max())
                    .obj_confidence(result.getObj_confidence())
                    .obj_class(result.getObj_class())
                    .build();

            objectRepository.save(analysisObject);
        });
    }
    
    
}