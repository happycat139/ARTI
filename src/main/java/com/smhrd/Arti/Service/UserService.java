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
    
    
    
    
    
	
}
