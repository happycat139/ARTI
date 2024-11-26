package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class ProfileService {
    
    @Autowired
    private UserRepository repo;

    
    @Transactional
    public void updateProfileImage(String email, String imageUrl) {
        User user = repo.findById(email).orElseThrow(() -> new RuntimeException("사용자를 찾을 수 없습니다"));
        user.setProfile_img(imageUrl);
        repo.save(user);
    }
}
