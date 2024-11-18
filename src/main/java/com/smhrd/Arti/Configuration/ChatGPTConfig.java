package com.smhrd.Arti.Configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class ChatGPTConfig {

	private final GptProperties gptProperties;

	@Autowired
	public ChatGPTConfig(GptProperties gptProperties) {
		this.gptProperties = gptProperties;
	}

	@Bean
	public RestTemplate template() {
		RestTemplate restTemplate = new RestTemplate();
		// 모든 요청에 `Authorization` 헤더 추가 (API 키 포함)
		restTemplate.getInterceptors().add((request, body, execution) -> {
			request.getHeaders().add("Authorization", "Bearer " + gptProperties.getApiKey());
			return execution.execute(request, body);
		});
		return restTemplate;
	}

}
