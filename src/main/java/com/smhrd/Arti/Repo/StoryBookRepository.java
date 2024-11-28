package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.StoryBook;



@Repository
public interface StoryBookRepository extends JpaRepository<StoryBook, Long>{
	
}
