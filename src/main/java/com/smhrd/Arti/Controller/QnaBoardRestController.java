package com.smhrd.Arti.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Model.QnaBoard;
import com.smhrd.Arti.Service.QnaBoardService;

@RestController
@RequestMapping("/arti/board")
public class QnaBoardRestController {

	@Autowired
	QnaBoardService service;

	@DeleteMapping("delete/{qna_idx}")
	public ResponseEntity<Void> deletePost(@PathVariable Long qna_idx) {
		boolean isDeleted = service.deletePost(qna_idx);

		if (isDeleted) {
			return ResponseEntity.ok().build(); // 성공 응답
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 실패 응답
		}
	}

	@PostMapping("reply")
	public ResponseEntity<Map<String, Object>> replyToQnaBoard(@RequestParam("idx") Long idx, @RequestParam("replyContent") String replyContent) {

		QnaBoard board = service.getDetail(idx);
		if (board != null) {
			board.setQna_answer(replyContent);
			board.setAnswered(true);
			service.writeBoard(board);

			// JSON 응답 생성 
			Map<String, Object> response = new HashMap<>();
			response.put("message", "답변이 저장되었습니다.");
			response.put("answer", replyContent);
			response.put("isAnswered", true);

			return ResponseEntity.ok(response);
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", "게시글을 찾을 수 없습니다."));
	}

}
