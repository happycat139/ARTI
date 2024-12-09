package com.smhrd.Arti.Model;

import lombok.Data;

@Data
public class CartRequest {

	private String email;
    private String bookList; // JSON 형태
    private int totalPrice;
	
}
