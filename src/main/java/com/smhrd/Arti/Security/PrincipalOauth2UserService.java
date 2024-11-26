package com.smhrd.Arti.Security;

import java.util.Optional;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Model.UTYPE;
import com.smhrd.Arti.Repo.UserRepository;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{

	 private final UserRepository userRepository;
	 private final HttpSession session;  // 세션 주입

	    @Override
	    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
	        OAuth2User oAuth2User = super.loadUser(userRequest);
	        log.info("getAttributes : {}", oAuth2User.getAttributes());

	        String provider = userRequest.getClientRegistration().getRegistrationId();
	        String providerId = oAuth2User.getAttribute("sub");
	        String email = provider + "_" +providerId;

	        Optional<User> optionalUser = userRepository.findByEmail(email);
	        User user;

	        if(optionalUser.isEmpty()) {
	            user = User.builder()
	                    .email(email)
	                    .password(providerId)
	                    .nickname(oAuth2User.getAttribute("name"))
	                    .login_src(provider)
	                    .role(UTYPE.USER)
	                    .build();
	            userRepository.save(user);
	        } else {
	            user = optionalUser.get();
	        }

	     // 세션에 사용자 정보 저장
	        session.setAttribute("user", user);
	        
	        return new PrincipalDetails(user, oAuth2User.getAttributes());
	    }
}
