package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	/* 로그인 SQL */
	public User findByEmailAndPassword(String email, String password);

}
