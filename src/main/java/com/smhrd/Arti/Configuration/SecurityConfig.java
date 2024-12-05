package com.smhrd.Arti.Configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.smhrd.Arti.Model.UTYPE;
import com.smhrd.Arti.Security.PrincipalOauth2UserService;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity  // Spring Security 설정 활성화
@RequiredArgsConstructor
public class SecurityConfig {

    private final PrincipalOauth2UserService principalOauth2UserService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    	http.csrf().disable()
        .authorizeHttpRequests()
        .requestMatchers("/arti/payments/**").permitAll()
        .requestMatchers("/security-login/info").authenticated()
        .requestMatchers("/security-login/admin/**").hasAuthority(UTYPE.ADMIN.name())
        .anyRequest().permitAll()
        .and()
        .oauth2Login()
        .defaultSuccessUrl("/")
        .userInfoEndpoint()
        .userService(principalOauth2UserService);

        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    
}
