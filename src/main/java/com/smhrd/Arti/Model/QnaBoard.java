package com.smhrd.Arti.Model;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Entity
@Table(name = "tbl_qna")
public class QnaBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long qna_idx;

	// 질의 제목
	private String qna_title;

	// 질의 내용
	@Column(name = "qna_content", columnDefinition = "TEXT")
	private String qna_content;

	// 질의 파일
	private String qna_file;

	// 작성 날짜
	@Column(name = "qna_dt")
	private Timestamp qnaDt;

	// 작성자 닉네임 (회원용)	
    private String qna_nickname;

	// 작성자 이름 (비회원용)
	private String qna_name;

	// 작성 비밀번호
	private String qna_pw;
	
	// 답변 여부
	@Column(name = "is_answered")
	private boolean isAnswered = false;
	
	// 답변 내용
	private String qna_answer;

	
	public QnaBoard() {
		this.qnaDt = new Timestamp(System.currentTimeMillis()); // 현재 시간 설정
	}

}
