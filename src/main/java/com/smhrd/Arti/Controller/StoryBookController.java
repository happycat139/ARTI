package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.Arti.Model.Story;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Service.ChatGPTService;
import com.smhrd.Arti.Service.StoryBookService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/arti/book")
public class StoryBookController {

	@Autowired
	StoryBookService service;

	// GPT api를 이용한 생성 기능
	private final ChatGPTService chatGPTService;

	@Autowired
	public StoryBookController(ChatGPTService chatGPTService) {
		this.chatGPTService = chatGPTService;
	}

	/* 페이지 관련 뷰 컨트롤러 */

	// 나의 동화책 페이지 호출
	@GetMapping("/mypage")
	public String SbMypage() {
		return "ArtisBook/SbMypage";
	}

	// 나의 동화책 작가 등록 페이지 호출
	@GetMapping("/start")
	public String SbCreatepage() {
		return "ArtisBook/SbStartBook";
	}

	// 나의 동화책 선택 페이지 호출
	@GetMapping("/select")
	public String SbSelectpage(@RequestParam("b_writer") String b_writer, HttpSession session) {
		session.setAttribute("b_writer", b_writer.trim());
		return "ArtisBook/SbSelect";
	}

	// 나의 동화책 선택 페이지 호출
	@GetMapping("/topic")
	public String SbTopicpage() {
		return "ArtisBook/SbTopic";
	}

	// 동화 제목, 장르, 배경, 주제, 주인공 생성
	@PostMapping("/outline")
	public String SbOutlinepage(@RequestParam("prompt") String prompt, Model model, HttpSession session) {

			String storyline = chatGPTService.makeBase(prompt, session);
			service.saveBase(storyline, session);
			model.addAttribute("storyline", storyline);

			return "ArtisBook/SbOutLine";

	}
	
	
	// 동화 제목, 장르, 배경, 주제, 주인공 재생성
		@PostMapping("/outline2")
		public String SbOutlinepage2(@RequestParam("reprompt") String reprompt, Model model, HttpSession session) {

				String storyline = chatGPTService.remakeBase(reprompt, session);

				service.saveBase(storyline, session);
				model.addAttribute("storyline", storyline);

				return "ArtisBook/SbOutLine";

		}
	

	// 임시 줄거리 페이지 호출
	@GetMapping("/plot")
	public String SbPlotpage(HttpSession session) {

		Story story = (Story) session.getAttribute("story");
		String storyline = chatGPTService.makeStory(story);

		service.saveStory(storyline, session);

		return "ArtisBook/SbPlot";
	}

}
