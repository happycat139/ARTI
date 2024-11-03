package com.smhrd.Arti.Service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class S3Service {

	private final AmazonS3 amazonS3;
    private final String bucketName;

    @Autowired
    public S3Service(AmazonS3 amazonS3, @Value("${custom.s3.bucket-name}") String bucketName) {
        this.amazonS3 = amazonS3;
        this.bucketName = bucketName;
    }

    public void uploadFile(String key, File file) {
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, file);
        amazonS3.putObject(putObjectRequest);
    }
    
}
