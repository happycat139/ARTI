package com.smhrd.Arti.Model;

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
	private String profileImageUrl;
	
}
