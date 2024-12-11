package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.HtpResult;
import com.smhrd.Arti.Model.HtpResultDTO;
import com.smhrd.Arti.Repo.HtpResultsRepository;

@Service
public class ObjectScoringService {
	
	@Autowired
	HtpResultsRepository htpResultsRepository;
	
	public void saveHtpResult(HtpResultDTO htpResultDTO) {
		
		htpResultDTO.getSymptomScores().forEach((symptom, score) -> {
			HtpResult htpResult = HtpResult.builder()
					.userName(htpResultDTO.getUserName())
					.symptom(symptom)
					.score(score)
					.totalScore(htpResultDTO.getTotalScore())
					.summary(htpResultDTO.getSummary())
					.build();
			
			htpResultsRepository.save(htpResult);
			
		});
		
	}
	
}
