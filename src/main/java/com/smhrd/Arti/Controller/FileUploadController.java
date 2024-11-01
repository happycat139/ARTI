package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Component.S3Service;

@RestController
public class FileUploadController {

	private final S3Service s3Service;
	
	@Autowired
	public FileUploadController(S3Service s3Service) {
		this.s3Service = s3Service;
	}
	 
	@PostMapping("/upload") 
	public String uploadFile(String filePath) {
		String bucketName = "artismhrd";
		String key = "AKIAZVMTUVLWVLSVO66L";
		
		 s3Service.uploadFile(bucketName, key, filePath);
	     return "파일 업로드 성공";
	}
	
}
