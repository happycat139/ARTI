package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Service.UserService;


@RestController
public class UserRestController {
	
	@Autowired
	private UserService service ;
	
	
	
}

