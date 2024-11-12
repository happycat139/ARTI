package com.smhrd.Arti.Model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatGPTResponse {

	private List<Choice> choices;

	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class Choice {
		private Message message; // 각 choice에 포함되는 메시지
	}

	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class Message {
		private String role; // "system", "user", "assistant"
		private String content; // 실제 메시지 내용
	}
}
