package com.smhrd.Arti.Model;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_upload")
public class Upload {

	@Id
	// 파일 식별자
	private Long file_idx;
	
	// 파일 이름(링크)
	private String file_name;
	
	// 파일 사이즈
	private int file_ext;
	
	// 업로드 날짜
	private Timestamp upload_dt;
	
	// 유저 이메일 
	private String email;
	
	
}
