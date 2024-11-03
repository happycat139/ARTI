package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.Arti.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	/* 로그인 SQL */
	public User findByEmailAndPassword(String email, String password);
	
	@Modifying
    @Transactional
    @Query("UPDATE User u SET u.profileImageUrl = :imageUrl WHERE u.uid = :userId")
    void updateProfileImageUrl(@Param("userId") Long userId, @Param("imageUrl") String imageUrl);
}
