package com.smhrd.Arti.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.StoryContent;
import com.smhrd.Arti.Service.StoryBookService;

@RestController
@RequestMapping("/arti/book")
public class StoryBookRestController {

	@Autowired
	StoryBookService service;

	@PostMapping("/updateTitle")
	public Map<String, String> updateTitle(@RequestBody StoryBook storyBook) {
		// 제목 업데이트 로직 수행
		service.updateBookTitle(storyBook);

		// JSON 형식 응답 반환
		Map<String, String> response = new HashMap<>();
		response.put("success", "true");
		response.put("message", "제목이 수정되었습니다.");
		return response;
	}

	@PostMapping("/updateStoryContent")
	public ResponseEntity<Map<String, Object>> updateStoryContent(@RequestBody Map<String, Object> request) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        Long bookIdx = Long.valueOf(request.get("book_idx").toString());
	        int pageNum = Integer.parseInt(request.get("pageNum").toString());
	        String content = request.get("content").toString();

	        // 서비스 호출
	        boolean success = service.updateStoryContent(bookIdx, pageNum, content);

	        if (success) {
	            response.put("success", true);
	            response.put("message", "줄거리가 성공적으로 수정되었습니다.");
	        } else {
	            response.put("success", false);
	            response.put("message", "줄거리 수정에 실패했습니다.");
	        }
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "서버 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return ResponseEntity.ok(response);
	}


}
