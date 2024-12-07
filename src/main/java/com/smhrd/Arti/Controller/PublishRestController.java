package com.smhrd.Arti.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.PublishService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/cart")
public class PublishRestController {

	  @Autowired
	    private PublishService publishService;

	  @PostMapping("/add")
	    public ResponseEntity<String> addToCart(@RequestBody Map<String, Object> payload, HttpSession session) {
	        Long bookIdx = Long.valueOf(payload.get("bookIdx").toString());
	        
	        // 세션에서 User 객체 가져오기
	        User user = (User) session.getAttribute("user");
	        if (user == null) {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	        }

	        String email = user.getEmail();
	        publishService.addToCart(bookIdx, email);

	        return ResponseEntity.ok("장바구니에 추가되었습니다.");
	    }

	    @GetMapping("/items")
	    public ResponseEntity<List<StoryBook>> getCartItems(HttpSession session) {
	        // 세션에서 User 객체 가져오기
	        User user = (User) session.getAttribute("user");
	        if (user == null) {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	        }

	        List<StoryBook> cartItems = publishService.getCartItems(user.getEmail());
	        return ResponseEntity.ok(cartItems);
	    }
	
}
