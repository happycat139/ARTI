package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Service.DallEApiService;

@RestController
public class DallEController {
	
	@Autowired
	private DallEApiService dallEApiService;
	
	@GetMapping("/generate-image")
	public String generateImage(@RequestParam String Iprompt) {
		return dallEApiService.generateImage(Iprompt);
	}

}
