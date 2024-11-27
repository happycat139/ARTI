package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.StoryContent;

@Repository
public interface StoryContentRepository extends JpaRepository<StoryContent, Long>{

}
