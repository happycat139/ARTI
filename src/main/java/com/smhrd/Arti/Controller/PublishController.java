package com.smhrd.Arti.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.PublishService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("arti/publish")
public class PublishController {

	private final PublishService publishService;

    public PublishController(PublishService publishService) {
        this.publishService = publishService;
    }

    // 장바구니 내역 페이지로 이동
    @GetMapping("/cart")
    public String publishCartPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/arti/login";
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
            return "redirect:/arti/login";
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
    
    
    
    
    
    
}
