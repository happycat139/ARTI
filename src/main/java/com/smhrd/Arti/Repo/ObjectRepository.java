package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smhrd.Arti.Model.DetectedObject;

public interface ObjectRepository extends JpaRepository<DetectedObject, Long> {

}
