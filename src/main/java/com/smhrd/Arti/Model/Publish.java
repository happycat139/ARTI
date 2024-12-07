package com.smhrd.Arti.Model;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_publishing")
public class Publish {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long pub_idx; // 출판 식별자

	private Long book_idx;

	private String email;

}
