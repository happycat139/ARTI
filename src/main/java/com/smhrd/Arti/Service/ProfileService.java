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
    public void updateProfileImage(Long uid, String imageUrl) {
        User user = repo.findById(uid).orElseThrow(() -> new RuntimeException("사용자를 찾을 수 없습니다"));
        user.setProfileImageUrl(imageUrl);
        repo.save(user);
    }
}
