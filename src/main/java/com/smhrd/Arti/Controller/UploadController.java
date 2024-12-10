package com.smhrd.Arti.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.DetectedObject;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.YoloService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/htp")
@Controller
public class UploadController {

    @Autowired
    private YoloService yoloService;
    
    
    
    // 결과 페이지 GET 요청 처리
    @GetMapping("/result")
    public String resultPage(Model model) {
        return "test/HtpResult"; 
    }

    // 이미지 업로드 및 분석 POST 요청 처리
    @PostMapping("/upload")
    public String uploadImage(
    		@RequestParam("file") MultipartFile file, 
    		HttpSession session, 
    		Model model) {
        try {
            
        	// 세션에서 사용자 정보 가져오기
            User user = (User) session.getAttribute("user");
            
            // 세션에서 이메일 가져오기
            String email = user.getEmail();
            
            if (email == null) {
                return "redirect:/welcome"; 
            }
            
            // YOLO 서비스 호출
            List<DetectedObject> detectedObjects = yoloService.processImage(file, email);
            
            // 결과를 모델에 추가하여 JSP로 전달
            model.addAttribute("detectedObjects", detectedObjects);
            
            // 결과 페이지로 이동
            return "test/HtpResult"; 
            
        } catch (Exception e) {
        	
            // 실패 시 에러 메시지를 모델에 추가
            model.addAttribute("error", "이미지 업로드 및 분석 중 오류 발생: " + e.getMessage());
            return "error"; // 에러 페이지로 이동
        }
    }
   
}
