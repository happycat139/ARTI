package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.StoryBook;

@Repository
public interface StoryBookRepository extends JpaRepository<StoryBook, Long> {

	@Query("SELECT s.book_thumbnail FROM StoryBook s WHERE s.book_idx = :bookIdx")
	String findBookThumbnailByBookIdx(@Param("bookIdx") Long bookIdx);



}
