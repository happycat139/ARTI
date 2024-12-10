package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smhrd.Arti.Model.AnalysisObject;

public interface ObjectRepository extends JpaRepository<AnalysisObject, Long> {

}
