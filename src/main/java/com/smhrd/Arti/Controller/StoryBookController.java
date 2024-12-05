package com.smhrd.Arti.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.smhrd.Arti.Configuration.GptProperties;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.StoryContent;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Service.ChatGPTService;
import com.smhrd.Arti.Service.DallEApiService;
import com.smhrd.Arti.Service.GoogleCloudStorageService;
import com.smhrd.Arti.Service.StoryBookService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/arti/book")
public class StoryBookController {

	@Autowired
	StoryBookService service;

	@Autowired
	DallEApiService dallEApiService;
	
	@Autowired
	ChatGPTService chatGptService;

	@Autowired
	GoogleCloudStorageService googleCloudStorageService;

	

	/* 페이지 관련 뷰 컨트롤러 */

	// 나의 동화책 작가 등록 페이지 호출
	@GetMapping("/start")
	public String SbCreatepage() {
		return "ArtisBook/SbStartBook";
	}

	// 나의 동화책 선택 페이지 호출
	@GetMapping("/select")
	public String SbSelectpage(@RequestParam("author") String author, HttpSession session) {
		session.setAttribute("author", author.trim());
		return "ArtisBook/SbSelect";
	}

	// 나의 동화책 선택 페이지 호출
	@GetMapping("/topic")
	public String SbTopicpage() {
		return "ArtisBook/SbTopic";
	}

	// 동화책 에디터 페이지 호출
	@GetMapping("/edit")
	public String SbEditPage(Model model, Long book_idx) {

		StoryBook storybook = service.getStoryBook(book_idx);
		model.addAttribute("storybook", storybook);

		List<StoryContent> storyContentList = service.getStoryContent(book_idx);
		model.addAttribute("storyContentList", storyContentList);

		return "ArtisBook/SbEdit";
	}

	// 임시 줄거리 페이지 호출
	@GetMapping("/plot")
	public String SbPlotpage(HttpSession session) {

		StoryBook story = (StoryBook) session.getAttribute("storybook");
		// GPT에서 줄거리 JSON 문자열 생성
		String storylineJson = chatGptService.makeStory(story);

		// JSON 파싱 및 저장
		service.saveStory(storylineJson, story, session);

		return "ArtisBook/SbPlot";
	}

	// 책 테스트 페이지 호출
	@GetMapping("/test")
	public String SbTestPage() {
		return "ArtisBook/SbTest";
	}

	// 책 테스트 페이지 호출
	@GetMapping("/test/new")
	public String SbTestPage2() {
		return "ArtisBook/SbTestNew";
	}
	
	// 샘플 미리보기 1 페이지 호출
	@GetMapping("/sample1")
	public String SbSamplePage1() {
		return "ArtisBook/SbSample1";
	}
	
	// 샘플 미리보기 2 페이지 호출
	@GetMapping("/sample2")
	public String SbSamplePage2() {
		return "ArtisBook/SbSample2";
	}
	
	// 공개갤러리 페이지 호출 (페이징 처리 포함)
	@GetMapping("/gallery")
	public String showGallery(@RequestParam(value = "page", defaultValue = "1") int page,
	                          @RequestParam(value = "size", defaultValue = "12") int size,
	                          Model model) {
		
	    Pageable pageable = PageRequest.of(page - 1, size);
	    Page<StoryBook> storyBookPage = service.getStoryBooksLatest(pageable); 

	    model.addAttribute("storyBooks", storyBookPage.getContent());
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", storyBookPage.getTotalPages());
	    model.addAttribute("totalElements", storyBookPage.getTotalElements());

	    return "ArtisBook/ArtisOpenGallery"; 
	    
	}
	
	/* 동화생성 관련 기능 메소드 */

	/* 사용자 이메일로 책정보 가져오기 */
	@GetMapping("/mypage")
	public String getMyBooks(Model model, HttpSession session) {
		
		User user = (User) session.getAttribute("user"); 
		
		 if (user != null) {
	            String email = user.getEmail();  // User 객체에서 이메일 가져오기
	            
	            System.out.println(email);
	            
	            List<StoryBook> storyBooks = service.getStoryBooksByEmail(email);

	            model.addAttribute("storyBooks", storyBooks);
	            return "ArtisBook/SbMypage"; // storybook.jsp로 이동
	        } else {
	            model.addAttribute("errorMessage", "로그인 후 이용해주세요.");
	            return "Login"; // 로그인 페이지로 이동
	        }
	    }
	
	

	/* GPT관련 컨트롤러 */

	// 동화 제목, 장르, 배경, 주제, 주인공 생성
	@PostMapping("/outline")
	public String SbOutlinepage(@RequestParam("prompt") String prompt,
			@RequestParam(value = "book_idx", required = false) Long book_idx, Model model, HttpSession session)
			throws JsonProcessingException {

		// GPTService를 사용해 StoryBook 객체 생성
		StoryBook storybook = chatGptService.makeBase(prompt, session);

		service.saveBase(storybook, session, book_idx);
		// 모델에 StoryBook 객체 추가 (디버깅 및 화면 출력용)
		model.addAttribute("storybook", storybook);

		return "ArtisBook/SbOutLine";

	}

	// 동화 제목, 장르, 배경, 주제, 주인공 재생성

	@PostMapping("/outline2")
	public String SbOutlinepage2(@RequestParam("reprompt") String reprompt, @RequestParam("book_idx") Long book_idx,
			Model model, HttpSession session) throws JsonProcessingException {

		StoryBook storybook = chatGptService.remakeBase(reprompt, session);

		service.saveBase(storybook, session, book_idx);
		// 모델에 StoryBook 객체 추가 (디버깅 및 화면 출력용)
		model.addAttribute("storybook", storybook);

		return "ArtisBook/SbOutLine";
	}

	// 테스트용 - 동화책 에디터 페이지 호출
	@GetMapping("/test/edit")
	public String SbTestEditPage(Model model, Long book_idx) {

		StoryBook storybook = service.getStoryBook(book_idx);
		model.addAttribute("storybook", storybook);

		List<StoryContent> storyContentList = service.getStoryContent(book_idx);
		model.addAttribute("storyContentList", storyContentList);

		return "ArtisBook/TestEdit";
	}
	
	
	
	@PostMapping("/generate-all-images")
	public ResponseEntity<String> generateAllImages(@RequestParam("book_idx") Long bookIdx) {
	    try {
	        // 1. DB에서 모든 페이지의 줄거리 가져오기
	        List<StoryContent> contents = service.getAllContentByBookIdx(bookIdx);

	        for (StoryContent content : contents) {
	            // 2. 프롬프트 생성
	        	String prompt = content.getContent() + 
	        		    " 위의 줄거리에 맞는 그림을 생성해줘. " +
	        		    "그림은 동화책에 사용될 그림으로, 따뜻한 색감과 부드러운 수채화 스타일로 만들어줘. " +
	        		    "주요 인물과 배경 요소를 강조하고, 각각의 세부사항이 잘 드러나도록 해줘. " +
	        		    "아이들이 좋아할 수 있는 밝고 매력적인 분위기를 연출해줘. 그리고 고퀄리티 그림이여야 해." +
	        		    "텍스트는 무조건 빼 줘." ;

	            // 3. DALL-E API로 이미지 생성
	            String imageUrl = dallEApiService.generateImage(prompt);

	            // 4. 생성된 이미지 경로를 Google Cloud Storage에 업로드
	            String uploadedImageUrl = googleCloudStorageService.uploadImageFromUrl(imageUrl);

	            // 5. DB에 이미지 URL 저장
	            service.updateImage(content.getBook_idx(), content.getPageNum(), uploadedImageUrl);
	        }

	        return ResponseEntity.ok("모든 이미지 생성 및 저장이 완료되었습니다.");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body("이미지 생성 중 문제가 발생했습니다: " + e.getMessage());
	    }
	}


	@GetMapping("/storybook")
	public String StoryBookPage(Model model, Long book_idx) {
		
		StoryBook storybook = service.getStoryBook(book_idx);
		model.addAttribute("storybook", storybook);

		List<StoryContent> storyContentList = service.getStoryContent(book_idx);
		model.addAttribute("storyContentList", storyContentList);

		
		return "ArtisBook/StoryBook";
	}
	
	
	
	
	
}
