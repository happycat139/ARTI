package com.smhrd.Arti.Model;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
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

	@Enumerated(EnumType.STRING)
	private UserRole role;
	
	// provider : google이 들어감
	private String provider;

	// providerId : 구굴 로그인 한 유저의 고유 ID가 들어감
	private String providerId;

	// isSocial : 소셜 로그인 여부를 나타내는 필드 (기본값 false)
	@Column(columnDefinition = "BOOLEAN DEFAULT false", nullable = false)
	@Builder.Default
	private Boolean isSocial= false;
}
