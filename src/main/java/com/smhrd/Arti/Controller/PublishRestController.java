package com.smhrd.Arti.Controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Model.CartRequest;
import com.smhrd.Arti.Model.Publish;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.PublishRepository;
import com.smhrd.Arti.Service.PublishService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("arti/publish")
public class PublishRestController {

	 private final PublishService publishService;

	    public PublishRestController(PublishService publishService) {
	        this.publishService = publishService;
	    }

	    // 장바구니에 책 추가
	    @PostMapping("/add")
	    public ResponseEntity<String> addToCart(@RequestBody Map<String, Object> request, HttpSession session) {
	        try {
	            // 요청 데이터 확인
	            Long bookId = ((Number) request.get("bookIdx")).longValue();
	            Integer quantity = (Integer) request.getOrDefault("quantity", 1); // 기본 수량: 1

	            if (bookId == null || quantity <= 0) {
	                return ResponseEntity.badRequest().body("잘못된 책 ID 또는 수량입니다.");
	            }

	            // 세션에서 사용자 확인
	            User user = (User) session.getAttribute("user");
	            if (user == null || user.getEmail() == null) {
	                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인된 사용자가 없습니다.");
	            }

	            // 서비스 호출
	            publishService.addToCart(bookId, quantity, user.getEmail(), session);
	            
	            return ResponseEntity.ok("장바구니에 추가되었습니다.");
	        } catch (IllegalArgumentException e) {
	            return ResponseEntity.badRequest().body("잘못된 요청: " + e.getMessage());
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("장바구니 추가 실패: " + e.getMessage());
	        }
	    }

	    // 장바구니 목록 가져오기
	    @GetMapping("/items")
	    public ResponseEntity<List<Map<String, Object>>> getCartItems(HttpSession session) {
	        try {
	            // 세션에서 사용자 확인
	            User user = (User) session.getAttribute("user");
	            if (user == null || user.getEmail() == null) {
	                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.emptyList());
	            }

	            // 서비스 호출
	            List<Map<String, Object>> cartBooks = publishService.getCartBooks(user.getEmail());
	            
	         // pub_idx를 세션에 추가 (예: 첫 번째 아이템의 pub_idx 저장)
	            if (!cartBooks.isEmpty() && cartBooks.get(0).containsKey("pub_idx")) {
	                session.setAttribute("pub_idx", cartBooks.get(0).get("pub_idx"));
	            }
	            
	            return ResponseEntity.ok(cartBooks);
	        } catch (IllegalArgumentException e) {
	            return ResponseEntity.badRequest().body(Collections.emptyList());
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.emptyList());
	        }
	    }

}
