package com.smhrd.Arti.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.Arti.Model.PublishRequest;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.PaymentService;
import com.smhrd.Arti.Service.PublishService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("arti/publish")
public class PublishController {

	private final PublishService publishService;
	private final PaymentService paymentService;

    public PublishController(PublishService publishService, PaymentService paymentService) {
        this.publishService = publishService;
        this.paymentService = paymentService;
    }

    // 장바구니 내역 페이지로 이동
    @GetMapping("/cart")
    public String publishCartPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/welcome";
        }

        // 장바구니 데이터 가져오기
        List<Map<String, Object>> cartList = publishService.getCartBooks(user.getEmail());

        // 총 금액 계산
        int totalPrice = cartList.stream()
            .mapToInt(cart -> ((int) cart.get("quantity")) * 9900)
            .sum();

        model.addAttribute("cartList", cartList);
        model.addAttribute("totalPrice", totalPrice);

        return "PublishCart";
    }
    
    
    // 장바구니 내역 페이지로 이동
    @GetMapping("/check")
    public String publishCheckPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/welcome";
        }

        // 장바구니 데이터 가져오기
        List<Map<String, Object>> cartList = publishService.getCartBooks(user.getEmail());

        // 총 금액 계산
        int totalPrice = cartList.stream()
            .mapToInt(cart -> ((int) cart.get("quantity")) * 9900)
            .sum();

        model.addAttribute("cartList", cartList);
        model.addAttribute("totalPrice", totalPrice);

        return "PublishCheck";
    }
    
    @PostMapping("/updateQuantity")
    public ResponseEntity<String> updateQuantity(@RequestBody Map<String, Object> request, HttpSession session) {
        try {
            Long bookIdx = ((Number) request.get("book_idx")).longValue();
            Integer quantity = ((Number) request.get("quantity")).intValue();

            if (quantity <= 0) {
                return ResponseEntity.badRequest().body("수량은 1 이상이어야 합니다.");
            }
     
            publishService.updateBookQuantity(bookIdx, quantity, session);
            return ResponseEntity.ok("수량이 성공적으로 변경되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("수량 변경 실패: " + e.getMessage());
        }
    }
    

    // 출판 신청 처리
    @GetMapping("/finalize")
    public String finalizePublish(HttpSession session, Model model) {
        // 세션에서 사용자 확인
        User user = (User) session.getAttribute("user");
        if (user == null || user.getEmail() == null) {
            return "redirect:/welcome"; // 로그인 페이지로 리다이렉트
        }
        
        PublishRequest publishRequest = (PublishRequest) session.getAttribute("publishRequest");

        try {
            // 서비스 호출
            publishService.finalizePublish(publishRequest, user.getEmail());

            // 성공 시 완료 페이지로 이동
            model.addAttribute("message", "출판 신청이 완료되었습니다!");
            return "PublishComplete"; // 완료 JSP로 이동
        } catch (Exception e) {
            model.addAttribute("error", "출판 신청 중 문제가 발생했습니다: " + e.getMessage());
            return "PublishError"; // 에러 페이지 JSP로 이동
        }
    }
    
    
    
    
}
