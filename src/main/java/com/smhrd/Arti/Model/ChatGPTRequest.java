package com.smhrd.Arti.Model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatGPTRequest {

	private String model;
    private List<ChatMessage> messages;

    // 새로운 생성자 추가
    public ChatGPTRequest(String model, List<ChatMessage> messages) {
        this.model = model;
        this.messages = messages;
    }
    

}
