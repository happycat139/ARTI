package com.smhrd.Arti.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.ProfileService;
import com.smhrd.Arti.Service.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/profile/update")
public class ProfileRestController {

	@Autowired
	private ProfileService service ;
	
	@Autowired
	private UserService Uservice ;
	
	/* 닉네임 수정 메소드 */
	@PostMapping("/nickname")
	public Map<String, Object> updateNickname(@RequestBody Map<String, String> payload, HttpSession session) {
		
		Map<String, Object> response = new HashMap<>();
		String newNickname = payload.get("newNickname");
		User user = (User) session.getAttribute("user");
		
		if (user == null) {
			response.put("success", false);
			response.put("message", "로그인이 필요합니다.");
			return response;
		}
		
		Long uid = user.getUid();
		
		try {
            Uservice.updateNickname(uid, newNickname);
            
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
	
	
	/* 프로필 사진 관련 메소드 */
	
	@Value("${profile.upload-dir}")
	private String uploadDir;
	
	@PostMapping("/image")
	public ResponseEntity<Map<String, Object>> updateProfileImage(@RequestParam("profileImage") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        if (file.isEmpty()) {
            response.put("success", false);
            return ResponseEntity.badRequest().body(response);
        }

        boolean isUploaded = service.uploadProfileImage(file);
        if (isUploaded) {
            response.put("success", true);
            response.put("newImageUrl", service.getNewImageUrl());
            return ResponseEntity.ok(response);
        } else {
            response.put("success", false);
            return ResponseEntity.status(500).body(response);
        }
    }
	
}
