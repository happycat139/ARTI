package com.smhrd.Arti.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

@Service
public class GoogleCloudStorageService {

    @Autowired
    private ResourceLoader resourceLoader;

    // 하드코딩된 버킷 이름
    private static final String BUCKET_NAME = "smhrd_arti"; // 실제 버킷 이름을 여기에 입력

    public String uploadFile(MultipartFile file) throws IOException {

        Resource resource = resourceLoader.getResource("classpath:arti-440803-317400484c88.json");
        File credentialsFile = resource.getFile();

        String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

        // 서비스 계정 키 파일을 통해 자격 증명 생성
        GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream(credentialsFile));

        // 자격 증명을 통해 Storage 객체 생성
        Storage storage = StorageOptions.newBuilder()
                .setCredentials(credentials)
                .build()
                .getService();

        BlobId blobId = BlobId.of(BUCKET_NAME, filename);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setContentType(file.getContentType())
                .build();

        storage.create(blobInfo, file.getBytes());
        return String.format("https://storage.googleapis.com/%s/%s", BUCKET_NAME, filename);
    }
}
