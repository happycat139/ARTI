package com.smhrd.Arti.Repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.QnaBoard;

@Repository
public interface QnaBoardRepository extends JpaRepository<QnaBoard, Long>{
	
	// 최신순으로 게시글 조회 (페이징)
    Page<QnaBoard> findAll(Pageable pageable);


}


