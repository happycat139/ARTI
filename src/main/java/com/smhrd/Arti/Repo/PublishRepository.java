package com.smhrd.Arti.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.Publish;

@Repository
public interface PublishRepository  extends JpaRepository<Publish, Long>{
	List<Publish> findByEmail(String email);
}
