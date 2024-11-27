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
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Model.UTYPE;
import com.smhrd.Arti.Service.QnaBoardService;

import jakarta.servlet.http.HttpSession;

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


	@PostMapping("new")
	public String writeBoard(QnaBoard board, HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user != null) {
			// 세션이 있으면 이메일 설정
			String nickname = user.getNickname();
			board.setQna_nickname(nickname);
			board.setQna_name(null);
			board.setQna_pw(null);
		} else {
			board.setQna_nickname(null);
		}

		service.writeBoard(board);
		return "redirect:/arti/board/main";
	}

	@GetMapping("detail/{qna_idx}")
	public String BoardDetailPage(@PathVariable Long qna_idx, Model model) {
		QnaBoard board = service.getDetail(qna_idx);
		model.addAttribute("board", board);
		return "QnaBoard/QnaBoardDetail";
	}

	@GetMapping("validate")
	public String validatePassword(@RequestParam("qna_idx") Long qna_idx,
			@RequestParam(value = "qna_pw", required = false) String qna_pw, RedirectAttributes redirectAttributes,
			HttpSession session) {

		// 세션에서 로그인한 사용자 정보 가져오기
		User user = (User) session.getAttribute("user");

		// 게시글 정보 가져오기
		QnaBoard board = service.getDetail(qna_idx);
		if (board == null) {
			redirectAttributes.addFlashAttribute("error", "존재하지 않는 게시글입니다.");
			return "redirect:/arti/board/main";
		}

		// 관리자 접근 허용
		if (user != null && user.getRole() == UTYPE.ADMIN) {
			return "redirect:/arti/board/detail/" + qna_idx;
		}

		// 회원 작성글 접근 허용
		if (board.getQna_nickname() != null) {
			// 회원이 작성한 글인지 확인
			if (user != null && user.getNickname().equals(board.getQna_nickname())) {
				return "redirect:/arti/board/detail/" + qna_idx;
			}
			redirectAttributes.addFlashAttribute("error", "작성자만 접근할 수 있습니다.");
			return "redirect:/arti/board/main";
		}

		// 비회원 작성글 비밀번호 검증
		if (board.getQna_pw() == null || board.getQna_pw().isEmpty()) {
			redirectAttributes.addFlashAttribute("error", "비밀번호가 설정되지 않은 게시글입니다.");
			return "redirect:/arti/board/main";
		}

		if (qna_pw != null && qna_pw.equals(board.getQna_pw())) {
			// 비밀번호가 맞는 경우
			return "redirect:/arti/board/detail/" + qna_idx;
		}

		// 비밀번호가 틀린 경우
		redirectAttributes.addFlashAttribute("error", "비밀번호가 틀렸습니다.");
		return "redirect:/arti/board/main";
	}

}
