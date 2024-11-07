package com.smhrd.Arti.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.GoogleCloudStorageService;
import com.smhrd.Arti.Service.ProfileService;
import com.smhrd.Arti.Service.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/profile/update")
public class ProfileRestController {

    @Autowired
    private ProfileService profileService;

    @Autowired
    private UserService userService;
    
    @Autowired
    private GoogleCloudStorageService googleCloudStorageService;


    /* 현재 세션에서 사용자 정보 가져오는 메소드 */
    private User getCurrentUserFromSession(HttpSession session) {
        return (User) session.getAttribute("user");
    }
    
    /* 닉네임 수정 메소드 */
    @PostMapping("/nickname")
    public Map<String, Object> updateNickname(@RequestBody Map<String, String> payload, HttpSession session) {

        Map<String, Object> response = new HashMap<>();
        User user = getCurrentUserFromSession(session);
        
        if (user == null) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        String newNickname = payload.get("newNickname");
        Long uid = user.getUid();

        try {
            userService.updateNickname(uid, newNickname);

            // user 세션 객체 닉네임 업데이트
            user.setNickname(newNickname);

            // user 세션 객체 업데이트
            session.setAttribute("user", user);

            response.put("success", true);
            response.put("message", "닉네임이 성공적으로 변경되었습니다.");

        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "닉네임 변경에 실패했습니다.");
        }

        return response;
    }
    
    @PostMapping("/image")
    public ResponseEntity<Map<String, Object>> uploadProfileImage(@RequestParam("profileImageFile") MultipartFile file, @RequestParam("uid") Long uid) {
        
    	Map<String, Object> response = new HashMap<>();
        
        try {
            // 파일을 Google Cloud Storage에 업로드
            String imageUrl = googleCloudStorageService.uploadFile(file);

            // 사용자 프로필에 새로운 이미지 URL 업데이트
            profileService.updateProfileImage(uid, imageUrl);

            response.put("success", true);
            response.put("message", "프로필 이미지 업로드 성공!");
            response.put("imageUrl", imageUrl);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "프로필 이미지 업로드 실패.");
            response.put("error", e.getMessage() != null ? e.getMessage() : "Unknown error occurred.");
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}

