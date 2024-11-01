package com.smhrd.Arti.Component;

import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;

@Service
public class S3Service {

	private final S3Client s3Client;
	
	@Autowired
	public S3Service(S3Client s3Client) {
		this.s3Client = s3Client;
	}
	
	public void uploadFile(String bucketName, String key, String filePath) {
        PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket(bucketName)
                .key(key)
                .build();

        PutObjectResponse response = s3Client.putObject(putObjectRequest, Paths.get(filePath));
        System.out.println("Upload completed with ETag: " + response.eTag());
    }
	
}
