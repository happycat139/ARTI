package com.smhrd.Arti.Controller;

import java.util.List;

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

	@Autowired
	private PublishService publishService;

	@GetMapping("/cart")
	public String PublishCartPage(HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("user");
		
		List<StoryBook> cartList = publishService.getCartItems(user.getEmail());
		model.addAttribute("cartList", cartList);
		return "PublishCart";
	}
	
	@GetMapping("/cart/check")
	public String PublishCheckPage(HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("user");
		
		List<StoryBook> cartList = publishService.getCartItems(user.getEmail());
		model.addAttribute("cartList", cartList);
		return "PublishCheck";
	}

}
