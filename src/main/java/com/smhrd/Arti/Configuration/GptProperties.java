package com.smhrd.Arti.Configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "gpt")
public class GptProperties {

	 private String apiKey;

	    public String getApiKey() {
	        return apiKey;
	    }

	    public void setApiKey(String apiKey) {
	        this.apiKey = apiKey;
	    }
	
}
