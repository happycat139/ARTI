package com.smhrd.Arti.Model;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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

	private String email; // 로그인 되어 잇는 유저 식별자

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private PublishStatus status = PublishStatus.CART; // CART: 장바구니, PUBLISHED: 출판 완료

	@Column(columnDefinition = "JSON", nullable = false)
	private String bookList; // 책 리스트 (JSON 형식)

	private String pub_sender; // 주문자 이름 (출판 상태일 경우에만 필요)
	private String sender_phone; // 주문자 전화번호
	private String pub_email; // 주문자 이메일

	private String pub_receiver; // 수령자 이름
	private String receiver_phone; // 수령자 전화번호
	private String zipCode; // 수령자 우편번호
	private String address; // 수령자 주소
	private String message; // 배송 메시지

	@Column(nullable = false)
	private int totalPrice; // 총 결제 금액

	@CreationTimestamp
	private LocalDateTime createdAt; // 생성 시각

}
