package com.smhrd.Arti.Model;

import lombok.Data;

@Data
public class PublishRequest {

	private Long pub_idx;
    private String pub_sender;
    private String sender_phone;
    private String pub_email;
    private String pub_receiver;
    private String receiver_phone;
    private String zipCode; // 우편 번호
    private String address; // 집 주소
    private String message; // 배송 메세지
	
	
}
