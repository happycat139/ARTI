package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public void updateNickname (String email, String newNickname) {
    	
    	User user = repo.findById(email).orElseThrow();
    	
    	user.setNickname(newNickname);
    	
    	repo.save(user);
    }
    
    // 사용자 업데이트
    public void updateUser(User user) {
    	repo.save(user);
    }
    
    // 회원 탈퇴
    public boolean deleteUser(String email) {
        try {
            repo.deleteById(email);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // 프로필 이미지 URL 업데이트
    public void updateProfileImageUrl(String email, String newImageUrl) {
        User user = repo.findById(email).orElseThrow();
        user.setProfile_img(newImageUrl);
        repo.save(user);
    }
    
	
}
