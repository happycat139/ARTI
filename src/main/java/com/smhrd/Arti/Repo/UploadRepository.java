package com.smhrd.Arti.Repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smhrd.Arti.Model.Upload;

public interface UploadRepository extends JpaRepository<Upload, Long> {
	
	Optional<Upload> findByFileIdx(Long fileIdx);

}
