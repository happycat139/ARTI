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
    public void updateNickname (Long uid, String newNickname) {
    	
    	User user = repo.findById(uid).orElseThrow();
    	
    	user.setNickname(newNickname);
    	
    	repo.save(user);
    }
    
	
}
