package com.smhrd.Arti.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class User {

	@Id
	@GeneratedValue
	private Long uid; // 식별자 (Primary Key 1 ~)
	private String email;
	private String password;
	private String nickname;
	@Column(name = "profile_image_url")
	private String profileImageUrl;
	
	// 소셜 로그인 관련 추가 필드
	@Column(nullable = true) // nullable 설정을 명시적으로 추가할 수 있음
	private String socialType; // 소셜 로그인 타입 (예: google)
	
	@Column(nullable = true)
	private String socialId; // 소셜 로그인 시 제공되는 고유 사용자 ID

    private boolean isSocial;  // 소셜 로그인 여부
	
	
}
