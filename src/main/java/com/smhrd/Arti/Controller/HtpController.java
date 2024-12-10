package com.smhrd.Arti.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/arti/test")
public class HtpController {

	@GetMapping("htp")
	public String htpMainPage() {
		return "test/HtpTestMain";
	}
}
