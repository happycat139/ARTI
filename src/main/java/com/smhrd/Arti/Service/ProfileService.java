package com.smhrd.Arti.Service;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Repo.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProfileService {
    
    @Autowired
    private UserRepository repo;

    @Autowired
    private HttpSession session;

    

   
    
}