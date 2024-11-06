package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Repo.AdminRepository;

@Service
public class AdminService {

	@Autowired
	AdminRepository repo;
	
	
}
