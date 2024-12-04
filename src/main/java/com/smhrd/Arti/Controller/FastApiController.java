package com.smhrd.Arti.Controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class FastApiController {

	private final RestTemplate restTemplate = new RestTemplate();
		
	@GetMapping("/callhello")
    public String fetchHello(Model model) {
        // FastAPI URL
        String fastApiUrl = "http://localhost:8000/hello/";

        // FastAPI 호출
        ResponseEntity<String> response = restTemplate.getForEntity(fastApiUrl, String.class);

        // FastAPI 응답 데이터를 JSP로 전달
        model.addAttribute("message", response.getBody());
        return "test/TestMethod"; // 결과를 보여줄 JSP 파일
    }
	
	
}
