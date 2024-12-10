package com.smhrd.Arti.Controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.AnalysisObject;
import com.smhrd.Arti.Model.Upload;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.ObjectRepository;
import com.smhrd.Arti.Repo.UploadRepository;
import com.smhrd.Arti.Service.GoogleCloudStorageService;
import com.smhrd.Arti.Service.YoloService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/htp")
@Controller
public class UploadController {

    @Autowired
    private GoogleCloudStorageService gcpStorageService;

    @Autowired
    private UploadRepository uploadRepository;
    
    @Autowired
    private ObjectRepository objectRepository;
    
    @Autowired
    private YoloService yoloService;

    // 결과 페이지 GET 요청 처리
    @GetMapping("/result")
    public String resultPage(Model model) {
        return "test/HtpResult"; // 결과 JSP 경로
    }

    // 이미지 업로드 및 분석 POST 요청 처리
    @PostMapping("/upload")
    public String uploadImage(@RequestParam("file") MultipartFile file, HttpSession session, Model model) {
        try {
            
        	// 세션에서 사용자 정보 가져오기
            User user = (User) session.getAttribute("user");
            if (user == null) {
                return "redirect:/welcome"; // 로그인 페이지로 리다이렉트
            }

            // 세션에서 이메일 가져오기
            String email = user.getEmail();

            // GCP에 저장할 폴더 이름 설정
            String folderName = "HTP/Upload";

            // GCP에 이미지 업로드
            String imageUrl = gcpStorageService.uploadFile(file, folderName);
            
            System.out.println(imageUrl);
            
            // DB에 저장할 정보 생성
            Upload upload = Upload.builder()
                    .file_idx(null) // 자동 증가
                    .file_name(imageUrl) // GCP 이미지 URL
                    .file_ext(file.getContentType()) // 파일 확장자 (MIME 타입)
                    .file_size((int) file.getSize()) // 파일 크기
                    .upload_dt(new Timestamp(System.currentTimeMillis())) // 현재 시간
                    .email(email) // 사용자 이메일
                    .build();
            
            System.out.println(upload);

            // DB 저장
            uploadRepository.save(upload);
            
            System.out.println("-------------------------------");
            System.out.println(upload);
            
            // YOLO 모델 호출
            String yoloResult = yoloService.analyzeImage(imageUrl);
            
            System.out.println("url 도달" + yoloResult);

            // 결과를 모델에 추가하여 JSP로 전달
            model.addAttribute("imageUrl", imageUrl);
            model.addAttribute("yoloResult", yoloResult);

            // 결과 페이지로 이동
            return "test/HtpResult"; 
        } catch (Exception e) {
            // 실패 시 에러 메시지를 모델에 추가
            model.addAttribute("error", "이미지 업로드 및 분석 중 오류 발생: " + e.getMessage());
            return "error"; // 에러 페이지로 이동
        }
    }
   
}
