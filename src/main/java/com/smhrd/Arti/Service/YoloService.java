package com.smhrd.Arti.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.DetectedObject;
import com.smhrd.Arti.Model.DetectionResultDTO;
import com.smhrd.Arti.Model.Upload;
import com.smhrd.Arti.Repo.ObjectRepository;
import com.smhrd.Arti.Repo.UploadRepository;


@Service
public class YoloService {
	
	
	private final GoogleCloudStorageService gcpStorageService;
	private final UploadRepository uploadRepository;
	private final ObjectRepository objectRepository;
	private final YoloIntegrationService yoloIntegrationService;
	
	public YoloService(
			GoogleCloudStorageService gcpStorageService,
			UploadRepository uploadRepository,
			ObjectRepository objectRepository,
			YoloIntegrationService yoloIntegrationService){
		this.gcpStorageService = gcpStorageService;
		this.uploadRepository = uploadRepository;
		this.objectRepository = objectRepository;
		this.yoloIntegrationService = yoloIntegrationService;
	}
	
	public List<DetectedObject> processImage(MultipartFile file, String email) {
		
		try {
			// GCP에 이미지 업로드
			String folderName = "HTP/Upload";
			String imageUrl = gcpStorageService.uploadFile(file, folderName);
			
			// 업로드 정보 DB 저장
			Upload upload = Upload.builder()
					.file_name(imageUrl)
					.file_ext(file.getContentType())
					.file_size((int) file.getSize())
					.upload_dt(new Timestamp(System.currentTimeMillis()))
					.email(email)
					.build();
			uploadRepository.save(upload);
			
			// YOLO 모델 호출
			String yoloResultJson = yoloIntegrationService.analyzeImage(imageUrl);
			
			// YOLO 결과 파싱 및 저장
			List<DetectedObject> detectedObjects = yoloIntegrationService.parseAndSaveResults(yoloResultJson, upload.getFile_idx() );
			
			return detectedObjects;
		} catch (Exception e) {
			throw new RuntimeException("이미지 처리 중 오류 발생: " + e.getMessage(), e);
		}
	}
	
    public String analyzeImage(String imageUrl) {
        // FastAPI 서버 주소
        String fastApiUrl = "http://localhost:8000/analyze";

        // 요청 데이터 설정
        Map<String, String> requestData = new HashMap<>();
        requestData.put("image_url", imageUrl);

        // REST 요청
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(fastApiUrl, requestData, String.class);

        System.out.println("YOLO API 응답: " + response.getBody());
        return response.getBody(); // YOLOv5 분석 결과
    }
    
    /* 분석 정보 저장 메소드 */
    public void saveDetectionResults(List<DetectionResultDTO> results, Long fileIdx) {
    	
        results.forEach(result -> {
        	DetectedObject detectedObject = DetectedObject.builder()
                    .file_idx(fileIdx)
                    .obj_name(result.getName())
                    .x_min(result.getXmin())
                    .y_min(result.getYmin())
                    .x_max(result.getXmax())
                    .y_max(result.getYmax())
                    .obj_confidence(result.getConfidence())
                    .obj_class(result.getClassId())
                    .build();

            objectRepository.save(detectedObject);
            
            
        });
    }
    
    
}