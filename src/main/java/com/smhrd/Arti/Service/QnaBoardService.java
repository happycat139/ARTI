package com.smhrd.Arti.Service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.QnaBoard;
import com.smhrd.Arti.Repo.QnaBoardRepository;

@Service
public class QnaBoardService {

	private final QnaBoardRepository repo;

	// 생성자 주입
	public QnaBoardService(QnaBoardRepository repo) {
		this.repo = repo;
	}

	// 게시물 작성 기능
	public void writeBoard(QnaBoard board) {
		repo.save(board);
	}

	// 게시물 리스트 보기 기능
	public Page<QnaBoard> getBoards(int page, int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "qnaDt"));
		return repo.findAll(pageable);
	}



	// 게시물 상세보기 기능
	public QnaBoard getDetail(Long qna_idx) {
		Optional<QnaBoard> board = repo.findById(qna_idx);
	    return board.orElse(null);
	}

	// 게시글 삭제 기능	
	 public boolean deletePost(Long idx) {
	        try {
	            repo.deleteById(idx);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

}
