package com.smhrd.Arti.Repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.Publish;
import com.smhrd.Arti.Model.PublishStatus;

@Repository
public interface PublishRepository  extends JpaRepository<Publish, Long>{
	List<Publish> findByEmail(String email);
	
	// 특정 사용자의 장바구니 조회
	Optional<Publish> findByEmailAndStatus(String email, PublishStatus status);
	
	Optional<Publish> findByStatus(PublishStatus status); // 상태로 장바구니 검색
	
	@Query("SELECT p FROM Publish p WHERE p.status = :status ORDER BY p.pub_idx DESC")
    Page<Publish> findAllByStatusOrderByPub_idxDesc(@Param("status") PublishStatus status, Pageable pageable);

}
