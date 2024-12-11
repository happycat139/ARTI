package com.smhrd.Arti.Model;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HtpResultDTO {

	 private String userName;                   // 사용자 이름
	 private Map<String, Integer> symptomScores; // 증상별 점수 (예: "우울" -> 3, "공격성" -> 2)
	 private int totalScore;                    // 총합 점수
	 private String summary;                    // 총 해설
	
}