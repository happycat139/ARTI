package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.smhrd.Arti.Service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
}
