package com.smhrd.Arti.Repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.StoryBook;

@Repository
public interface StoryBookRepository extends JpaRepository<StoryBook, Long> {

	@Query("SELECT s.book_thumbnail FROM StoryBook s WHERE s.book_idx = :bookIdx")
	String findBookThumbnailByBookIdx(@Param("bookIdx") Long bookIdx);
	
	/* 사용자 이메일로 책정보 가져오기 */
	List<StoryBook> findByEmail(String email) ;
	
	// 최신순으로 모든 동화책 가져오기
	@Query("SELECT s FROM StoryBook s WHERE s.book_thumbnail IS NOT NULL ORDER BY s.book_idx DESC")
    Page<StoryBook> findAllByOrderByIdDesc(Pageable pageable);
	
	// 최신순대로 다가져오기
	@Query("SELECT s FROM StoryBook s WHERE s.book_thumbnail IS NOT NULL ORDER BY s.createDt DESC")
	List<StoryBook> findAllByOrderByCreateDtDesc();

}
