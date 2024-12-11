package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smhrd.Arti.Model.HtpResult;
import java.util.List;


public interface HtpResultsRepository extends JpaRepository<HtpResult, Long> {
	
	List<HtpResult> findByUserName(String userName);

}
