package com.smhrd.Arti.Model;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_user")
public class User {

	@Id
    // 유저 이메일 
    private String email;

    // 유저 비밀번호 
    private String password;

    // 유저 닉네임 
    private String nickname;

    // 유저 프로필 이미지 
    private String profile_img;

    // 로그인 소스 
    private String login_src = "local";

    // 유저 구분 일반유저: 'USER', 관리자: 'ADMIN'
    @Enumerated(EnumType.STRING)
	private UTYPE role = UTYPE.USER; // 기본값 User;


    // 가입 일자 
    private Timestamp join_dt;

    // 기본 토큰 
    private int join_token = 10;

	
	public User() {
	    this.join_dt = new Timestamp(System.currentTimeMillis()); // 현재 시간 설정
	}
	
	// 빌더 기본값 설정
    public static class UserBuilder {
        private Timestamp join_dt = new Timestamp(System.currentTimeMillis());
        private int join_token = 10;
    }
	
}
