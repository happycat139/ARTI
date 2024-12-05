package com.smhrd.Arti.Configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "payment")
public class PaymentProperties {

	private String secretKey; // Secret Key
    private String baseUrl;   // API Base URL
    private String successUrl; // 성공 리다이렉트 URL
    private String failUrl;   // 실패 리다이렉트 URL
}
