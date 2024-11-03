package com.smhrd.Arti.Service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository repo;
	
	// 회원가입
    public void register (User user) {
    	repo.save(user);
    }
    
    // 로그인
    public User login (User user) {
    	return repo.findByEmailAndPassword(user.getEmail(), user.getPassword());
    }
    
    // 닉네임 수정
    public void updateNickname (Long uid, String newNickname) {
    	
    	User user = repo.findById(uid).orElseThrow();
    	
    	user.setNickname(newNickname);
    	
    	repo.save(user);
    }
    
    // 사용자 업데이트
    public void updateUser(User user) {
    	repo.save(user);
    }
    
    
    
    /* 프로필 사진 관련 서비스 */
    @Value("${profile.upload-dir}")
    private String uploadDir;
    
    private String newImageUrl;

    public boolean uploadProfileImage(MultipartFile file) {
        try {
        	// 파일명을 고유하게 만들기 위해 UUID 사용
            String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File destFile = new File(uploadDir + File.separator + filename);

            // 파일을 저장할 디렉토리가 없으면 생성
            File uploadDirectory = new File(uploadDir);
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdirs();
            }

            // 파일 전송
            file.transferTo(destFile);

            // 파일 경로 설정
            newImageUrl = "/uploaded-images/" + filename;

            // DB에 파일 경로 저장
            Long userId = getCurrentUserId();
            repo.updateProfileImageUrl(userId, newImageUrl);

            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getNewImageUrl() {
        return newImageUrl;
    }

    // 현재 사용자의 ID를 반환하는 메서드 (예시)
    private Long getCurrentUserId() {
        // 실제로는 세션이나 인증 정보를 바탕으로 현재 사용자의 ID를 가져오는 로직을 구현해야 합니다.
        return 1L; // 예시로 1을 반환
    }
    
	
}
