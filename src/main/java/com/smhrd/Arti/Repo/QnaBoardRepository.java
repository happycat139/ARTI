package com.smhrd.Arti.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.Arti.Model.QnaBoard;

@Repository
public interface QnaBoardRepository extends JpaRepository<QnaBoard, Long>{

}
