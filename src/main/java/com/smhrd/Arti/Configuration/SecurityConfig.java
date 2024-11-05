package com.smhrd.Arti.Configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	 @Bean
	    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	        http
	            .csrf(csrf -> csrf.disable()) // CSRF 비활성화
	            .authorizeHttpRequests(auth -> auth
	                .requestMatchers("/", "/login", "/css/**", "/js/**").permitAll() // 특정 URL을 모든 사용자에게 허용
	                .anyRequest().authenticated() // 그 외의 요청은 인증 필요
	            )
	            .oauth2Login(oauth2 -> oauth2
	                .defaultSuccessUrl("/home", true) // 로그인 성공 후 리다이렉트 URL
	            );

	        return http.build();
	    }
	
}
