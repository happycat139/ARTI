package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.User;

@Repository
public interface AdminRepository extends JpaRepository<User, String> {

}
