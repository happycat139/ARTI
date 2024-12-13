package com.smhrd.Arti.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.smhrd.Arti.Model.HtpResult;
import com.smhrd.Arti.Repo.HtpResultsRepository;


@Service
public class HtpResultService {
	
	@Autowired
	HtpResultsRepository htpResultRepository;

	public void saveExplanations(Integer score, Map<String, String> explanations) {
        
		// JSON으로 변환
        String explanationsJson = new Gson().toJson(explanations);
        
        // HtpResult 생성 및 저장
        HtpResult htpResult = new HtpResult();
        htpResult.setExplanations(explanationsJson);

        htpResultRepository.save(htpResult);
    }
	
	public List<HtpResult> getResultsByUserId(Long fileIdx) {
		
        return htpResultRepository.findByFileIdx(fileIdx);
    }
	
}
