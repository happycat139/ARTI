package com.smhrd.Arti.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.QnaBoard;
import com.smhrd.Arti.Repo.QnaBoardRepository;

@Service
public class QnaBoardService {

	
	@Autowired
	QnaBoardRepository repo;
	
	
	// 게시물 작성 기능
		public void writeBoard(QnaBoard board) {
			repo.save(board);
		}

		// 게시물 리스트 보기 기능
		public List<QnaBoard> getBoard() {
			return repo.findAll();
		}
		
		// 게시물 상세보기 기능
		public QnaBoard getDetail(Long idx) {
			
			Optional<QnaBoard> board = repo.findById(idx);
			return board.get();
		}
		
		// 게시글 삭제 기능
		public void deleteBoard(Long idx) {
			repo.deleteById(idx);
		}
	
	
	
	
	
}
