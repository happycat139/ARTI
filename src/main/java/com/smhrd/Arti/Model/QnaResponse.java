package com.smhrd.Arti.Model;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Entity
@Table(name = "tbl_response")
public class QnaResponse {

	// 응답 식별자
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long res_idx;

	// 질의 식별자
	private Long qna_idx;

	// 응답 내용
	private String res_content;

	// 응답 파일
	private String res_file;

	// 응답 작성일자
	@Column(name = "res_dt")
	private Timestamp resDt;

	// 응답 작성자
	private String admin_email;

	public QnaResponse() {
		this.resDt = new Timestamp(System.currentTimeMillis()); // 현재 시간 설정
	}

}
