package com.smhrd.Arti.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.S3Service;
import com.smhrd.Arti.Service.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
public class UserRestController {
	
	@Autowired
	private UserService service ;
	
	@Autowired
	private S3Service s3Service ;
	
	/* 닉네임 수정 메소드 */
	@PostMapping("profile/update/nickname")
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
            service.updateNickname(uid, newNickname);
            
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
	
	
//	/* 프로필 사진 변경 메소드 */
//	public Map<String, Object> updateProfileImage(@RequestParam("profileImage") MultipartFile file, HttpSession session) {
//		
//		Map<String, Object> response = new HashMap<>();
//		
//		try {
//			
//			//String filePath = s3Service.uploadFile(file);
//			
//			User user = (User) session.getAttribute("user");
//			user.setProfileImageUrl(filePath);
//			
//			service.updateUser(user);
//			
//			response.put("success", true);
//			response.put("newImageUrl", filePath);
//		} catch (Exception e) {
//			e.printStackTrace();
//			response.put("success", false);
//		}
//		
//		return response;
//		
//	}
	
}

