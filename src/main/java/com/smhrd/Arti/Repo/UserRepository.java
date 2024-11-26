package com.smhrd.Arti.Repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.Arti.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	
	/* 로그인 SQL */
	public User findByEmailAndPassword(String email, String password);
	
	@Modifying
    @Transactional
    @Query("UPDATE User u SET u.profile_img = :imageUrl WHERE u.email = :email")
    void updateProfileImageUrl(@Param("email") String email, @Param("imageUrl") String imageUrl);
	
	boolean existsByEmail(String email);
    boolean existsByNickname(String nickname);
    Optional<User> findByEmail(String email);
}
