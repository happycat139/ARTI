package com.smhrd.Arti.Security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.smhrd.Arti.Model.User;

public class PrincipalDetails implements UserDetails, OAuth2User {

	 private User user;
	    private Map<String, Object> attributes; // OAuth2 사용자 속성

	    // 일반 로그인 생성자
	    public PrincipalDetails(User user) {
	        this.user = user;
	    }

	    // OAuth 로그인 생성자
	    public PrincipalDetails(User user, Map<String, Object> attributes) {
	        this.user = user;
	        this.attributes = attributes;
	    }

	    // 권한 관련 작업을 하기 위한 role return
	    @Override
	    public Collection<? extends GrantedAuthority> getAuthorities() {
	        Collection<GrantedAuthority> collections = new ArrayList<>();
	        collections.add(() -> user.getRole().name());
	        return collections;
	    }

	    @Override
	    public String getPassword() {
	        return user.getPassword();
	    }

	    @Override
	    public String getUsername() {
	        return user.getEmail();
	    }

	    @Override
	    public boolean isAccountNonExpired() {
	        return true;
	    }

	    @Override
	    public boolean isAccountNonLocked() {
	        return true;
	    }

	    @Override
	    public boolean isCredentialsNonExpired() {
	        return true;
	    }

	    @Override
	    public boolean isEnabled() {
	        return true;
	    }

	    // OAuth2User의 getAttributes 메서드 구현
	    @Override
	    public Map<String, Object> getAttributes() {
	        return attributes;
	    }

	    // OAuth2User의 getName 메서드 구현
	    @Override
	    public String getName() {
	    	 return String.valueOf(user.getUid()); // 또는 소셜 로그인 제공자의 고유 ID 사용
	    }
}
