package com.smhrd.Arti.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.smhrd.Arti.Model.QnaBoard;
import com.smhrd.Arti.Service.QnaBoardService;

@Controller
public class QnaBoardController {

	@Autowired
	QnaBoardService service;

	
	/* 문의하기 페이지 호출 관련 */
	
	// 문의하기 메인 페이지 호출
	@GetMapping("arti/board/main")
	public String BoardMainPage(Model model) {
		
		List<QnaBoard> boardList = service.getBoard();
		model.addAttribute("boardList", boardList);
		
		return "QnaBoard/QnaBoardMain";
	}
	
	// 문의하기 작성 페이지 호출
	@GetMapping("arti/board/write")
	public String BoardWritePage() {
		return "QnaBoard/QnaBoardWrite";
	}
		
	// 문의하기 메인 페이지 호출
	@GetMapping("arti/board/detail")
	public String BoardDetailPage() {
		return "QnaBoard/QnaBoardDetail";
	}
	


	@PostMapping("arti/board/new")
	public String writeBoard(QnaBoard board) {
		service.writeBoard(board);
		return "redirect:/arti/board/main";
	}

	@GetMapping("arti/board/detail/{idx}")
	public String BoardDetailPage(@PathVariable Long idx, Model model) {
		QnaBoard board = service.getDetail(idx);
		model.addAttribute("board", board);
		return "QnaBoard/QnaBoardDetail";
	}

	
}
