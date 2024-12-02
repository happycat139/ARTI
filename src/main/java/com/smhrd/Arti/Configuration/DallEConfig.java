package com.smhrd.Arti.Configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class DallEConfig {

	private final GptProperties gptProperties;
	
	@Autowired
	public DallEConfig(GptProperties gptProperties) {
		this.gptProperties = gptProperties;
	}
	
	@Bean
	public RestTemplate dalleRestTemplate() {
		
		RestTemplate restTemplate = new RestTemplate();
		
		restTemplate.getInterceptors().add((request, body, execution) -> { 
			request.getHeaders().add("Authorization", "Bearer " + gptProperties.getApiKey());
			request.getHeaders().add("Content-Type", "application/json");
			return execution.execute(request, body);
		});
		return restTemplate;
	}
	
}
