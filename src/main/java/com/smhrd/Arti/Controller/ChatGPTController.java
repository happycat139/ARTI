package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.Arti.Model.ChatGPTResponse;
import com.smhrd.Arti.Service.ChatGPTService;

@Controller
@RequestMapping("/gpt")
public class ChatGPTController {


    private final ChatGPTService chatGPTService;

    @Autowired
    public ChatGPTController(ChatGPTService chatGPTService) {
        this.chatGPTService = chatGPTService;
    }

    @PostMapping("/generateStoryline")
    public String generateStoryline(@RequestParam("prompt") String prompt, Model model) {
        // ChatGPTService를 통해 줄거리 생성
    	String storyline = chatGPTService.generateStoryline(prompt);

        // 생성된 줄거리를 모델에 추가하여 다음 페이지로 전달
        model.addAttribute("storyline", storyline);

        // 다음 페이지(JSP)로 이동
        return "ArtisBook/SbStoryline";  // nextPage.jsp 페이지로 이동
    }

}
