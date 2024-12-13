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
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_content")
public class StoryContent {

	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   // 내용 식별자 
	   private Long content_idx;
	   
	   // 도서 식별자
	   private Long book_idx;

	   // 페이지 번호
	   @Column(name = "page_num", nullable = false, unique = true) 
	   private int pageNum;

	   // 내용
	   @Column(name = "content", columnDefinition = "TEXT")
	   private String content;

	   // 내용 구분
	   private String content_type;

	   // 그림
	   private String image;

	   // 그림 구분
	   private String image_type;
	   
	   // 이미지 생성용 프롬포트
	   @Column(name = "img_prompt", columnDefinition = "TEXT")
	   private String imgPrompt;
}
