package com.smhrd.Arti.Model;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_book")
public class StoryBook {

	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   // 도서 식별자 
	   private Long book_idx;
	   // 도서 명
	   private String book_name;
	   // 작가 명
	   private String author;
	   // 출판사
	   private String publisher;
	   // ISBN
	   private String isbn;
	   // 전체쪽수
	   private int pages = 11;
	   // 도서 썸네일
	   private String book_thumbnail;
	   // 도서 장르
	   private String book_genre;
	   // 도서 주제
	   private String book_subject;
	   // 도서 배경
	   private String book_background;
	   // 도서 주인공
	   private String book_mc;
	   // 도서 요약
	   @Column(name = "book_summary", columnDefinition = "TEXT")
	   private String book_summary;
	   // 도서 생성일자
	   @Column(name = "create_dt")
	   private Timestamp createDt;
	   // 유저 이메일
	   private String email;
	   // 발행 비용
	   private int publish_token;
	   
	   public StoryBook() {
			this.createDt = new Timestamp(System.currentTimeMillis()); // 현재 시간 설정
		}
	
}
