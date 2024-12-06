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
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

@Service
public class GoogleCloudStorageService {

    @Autowired
    private ResourceLoader resourceLoader;

    // 하드코딩된 버킷 이름
    private static final String BUCKET_NAME = "smhrd_arti"; // 실제 버킷 이름을 여기에 입력

    public String uploadFile(MultipartFile file, String folderName) throws IOException {

        Resource resource = resourceLoader.getResource("classpath:arti-440803-317400484c88.json");
        File credentialsFile = resource.getFile();

        String filename = folderName + "/" + UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

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
    
    // URL에서 이미지 업로드
    public String uploadImageFromUrl(String imageUrl) throws IOException {
        // 이미지 URL로부터 InputStream 가져오기
        URL url = new URL(imageUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        // 파일명 생성
        String fileName = UUID.randomUUID().toString() + ".png"; // PNG 포맷 가정

        try (InputStream inputStream = connection.getInputStream()) {
            // Google Cloud Storage에 업로드
            return uploadFileFromStream(inputStream, fileName, "image/png");
        }
    }
    
    // InputStream 기반 파일 업로드
    public String uploadFileFromStream(InputStream inputStream, String fileName, String contentType) throws IOException {
        Resource resource = resourceLoader.getResource("classpath:arti-440803-317400484c88.json");
        File credentialsFile = resource.getFile();

        // 서비스 계정 키 파일을 통해 자격 증명 생성
        GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream(credentialsFile));

        // 자격 증명을 통해 Storage 객체 생성
        Storage storage = StorageOptions.newBuilder()
                .setCredentials(credentials)
                .build()
                .getService();

        BlobId blobId = BlobId.of(BUCKET_NAME, fileName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setContentType(contentType)
                .build();

        storage.create(blobInfo, inputStream.readAllBytes());
        return String.format("https://storage.googleapis.com/%s/%s", BUCKET_NAME, fileName);
    }
}
