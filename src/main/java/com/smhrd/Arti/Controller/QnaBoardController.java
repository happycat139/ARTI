package com.smhrd.Arti.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.Arti.Model.QnaBoard;
import com.smhrd.Arti.Service.QnaBoardService;

@Controller
@RequestMapping("/arti/board")
public class QnaBoardController {

	@Autowired
	QnaBoardService service;

	/* 문의하기 페이지 호출 관련 */

	// 문의하기 메인 페이지 호출
	@GetMapping("main")
	public String BoardMainPage(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size) {
		Page<QnaBoard> boardPage = service.getBoards(page, size);

		// null 방지 확인
		if (boardPage == null || boardPage.getContent() == null) {
			throw new RuntimeException("No data found for boardPage or boardPage content");
		}

		// 데이터 추가
		model.addAttribute("boardPage", boardPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", boardPage.getTotalPages());
		return "QnaBoard/QnaBoardMain";
	}

	// 문의하기 작성 페이지 호출
	@GetMapping("write")
	public String BoardWritePage() {
		return "QnaBoard/QnaBoardWrite";
	}

	// 문의하기 메인 페이지 호출
	@GetMapping("detail")
	public String BoardDetailPage() {
		return "QnaBoard/QnaBoardDetail";
	}

	@PostMapping("new")
	public String writeBoard(QnaBoard board) {
		service.writeBoard(board);
		return "redirect:/arti/board/main";
	}

	@GetMapping("detail/{idx}")
	public String BoardDetailPage(@PathVariable Long idx, Model model) {
		QnaBoard board = service.getDetail(idx);
		model.addAttribute("board", board);
		return "QnaBoard/QnaBoardDetail";
	}
	
	@GetMapping("validate")
	public String validatePassword(
	    @RequestParam("idx") Long idx,
	    @RequestParam("password") String password,
	    RedirectAttributes redirectAttributes) {
	    
	    QnaBoard board = service.getDetail(idx);

	    if (board != null && board.getPassword().equals(password)) {
	        return "redirect:/arti/board/detail/" + idx;
	    } else {
	        redirectAttributes.addFlashAttribute("error", "비밀번호가 틀립니다.");
	        return "redirect:/arti/board/main";
	    }
	}

}
