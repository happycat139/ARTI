package com.smhrd.Arti.Repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.StoryContent;

@Repository
public interface StoryContentRepository extends JpaRepository<StoryContent, Long>{

	// book_idx가 같은 StoryContent 리스트 가져오기
    @Query("SELECT sc FROM StoryContent sc WHERE sc.book_idx = :book_idx")
    List<StoryContent> findByBookIdx(Long book_idx);
    
    @Query("SELECT sc FROM StoryContent sc WHERE sc.book_idx = :bookIdx AND sc.pageNum = :pageNum")
    Optional<StoryContent> findByBookIdxAndPageNum(@Param("bookIdx") Long bookIdx, @Param("pageNum") int pageNum);
    
}
