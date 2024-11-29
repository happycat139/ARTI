package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class DallEApiService {
	
	private static final String API_URL = "https://api.openai.com/v1/images/generations";

	private final RestTemplate dalleRestTemplate;
	
	@Autowired
	public DallEApiService(@Qualifier("dalleRestTemplate") RestTemplate dallRestTemplate) {
		this.dalleRestTemplate = dallRestTemplate ;
	}
		
	public String generateImage(String Iprompt) {
		
		String requestBody = "{ \"Iprompt\": \"" + Iprompt + "\", \"n\": 1, \"size\": \"1024x1024\" }";
		
		return dalleRestTemplate.postForObject(API_URL, requestBody, String.class);
	}
	
}
