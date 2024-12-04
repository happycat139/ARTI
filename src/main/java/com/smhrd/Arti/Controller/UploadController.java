package com.smhrd.Arti.Controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.Upload;
import com.smhrd.Arti.Repo.UploadRepository;
import com.smhrd.Arti.Service.GoogleCloudStorageService;
import com.smhrd.Arti.Service.YoloService;

@RestController
public class UploadController {

	@Autowired
	private GoogleCloudStorageService gcpStorageService;
	
	@Autowired
    private YoloService yoloService;
	
	@Autowired
	private UploadRepository uploadRepository;
	
	 @PostMapping("/upload")
	    public ResponseEntity<?> uploadAndAnalyzeImage(@RequestParam("file") MultipartFile file,
	                                                   @RequestParam("email") String email) {
	        try {
	            // 1. GCP에 이미지 업로드
	            String imageUrl = gcpStorageService.uploadFile(file);

	            // 2. DB에 정보 저장
	            Upload upload = Upload.builder()
	                    .file_idx(null) // 자동 증가
	                    .file_name(imageUrl)
	                    .file_ext((int) file.getSize())
	                    .upload_dt(new Timestamp(System.currentTimeMillis()))
	                    .email(email)
	                    .build();
	            uploadRepository.save(upload);

	            // 3. YOLO 모델 호출
	            String yoloResult = yoloService.sendUrlToYolo(imageUrl);

	            return ResponseEntity.ok("YOLO 분석 결과: " + yoloResult);
	        } catch (Exception e) {
	            return ResponseEntity.status(500).body("처리 중 오류 발생: " + e.getMessage());
	        }
	    }
	}
