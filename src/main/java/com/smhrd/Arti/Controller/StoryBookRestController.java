package com.smhrd.Arti.Controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.StoryContent;
import com.smhrd.Arti.Service.ChatGPTService;
import com.smhrd.Arti.Service.DallEApiService;
import com.smhrd.Arti.Service.GoogleCloudStorageService;
import com.smhrd.Arti.Service.StoryBookService;

@RestController
@RequestMapping("/arti/book")
public class StoryBookRestController {

	
	private final StoryBookService service;
	private final ChatGPTService chatGptService;
	private final DallEApiService dallEApiService;
    private final GoogleCloudStorageService googleCloudStorageService;
    
    @Autowired
    public StoryBookRestController(
            DallEApiService dallEApiService,
            ChatGPTService chatGptService,
            GoogleCloudStorageService googleCloudStorageService,
            StoryBookService service) {
        this.dallEApiService = dallEApiService;
        this.chatGptService = chatGptService;
        this.googleCloudStorageService = googleCloudStorageService;
        this.service = service;
    }

	@PostMapping("/updateTitle")
	public Map<String, String> updateTitle(@RequestBody StoryBook storyBook) {
		// 제목 업데이트 로직 수행
		service.updateBookTitle(storyBook);

		// JSON 형식 응답 반환
		Map<String, String> response = new HashMap<>();
		response.put("success", "true");
		response.put("message", "제목이 수정되었습니다.");
		return response;
	}

	@PostMapping("/updateStoryContent")
	public ResponseEntity<Map<String, Object>> updateStoryContent(@RequestBody Map<String, Object> request) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        Long bookIdx = Long.valueOf(request.get("book_idx").toString());
	        int pageNum = Integer.parseInt(request.get("pageNum").toString());
	        String content = request.get("content").toString();

	        // 서비스 호출
	        boolean success = service.updateStoryContent(bookIdx, pageNum, content);

	        if (success) {
	            response.put("success", true);
	            response.put("message", "줄거리가 성공적으로 수정되었습니다.");
	        } else {
	            response.put("success", false);
	            response.put("message", "줄거리 수정에 실패했습니다.");
	        }
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "서버 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return ResponseEntity.ok(response);
	}
	
	
	
	
	@PostMapping("/generate-thumbnail")
    public ResponseEntity<String> generateThumbnail(
            @RequestParam("Iprompt") String Iprompt,
            @RequestParam("book_idx") Long bookIdx) {
		
		System.out.println(Iprompt);
		System.out.println(bookIdx);
		
		
        try {
        	
        	String prompt = Iprompt + " \n 위의 내용에 맞는 '동화' 그림을 생성해줘. " +
        		    "\n 고퀄리티 그림으로 그리고, 따뜻한 색감과 부드러운 수채화 스타일로 만들어줘. " +
        		    "\n 주요 인물과 배경 요소를 강조해." +
        		    "\n 아이들이 좋아할 수 있는 밝고 매력적인 분위기를 연출해줘.." +
        		    "\n 중요: 어떠한 텍스트 요소도 완전히 배제해야 해." ;;
        	
        	
            // 1. AI API를 통해 이미지 생성
            String ImageUrl = dallEApiService.generateImage(prompt);

            // 2. Google Cloud Storage에 이미지 업로드
            String uploadedImageUrl = googleCloudStorageService.uploadImageFromUrl(ImageUrl);

            // 3. StoryBook의 thumbnail 필드 업데이트
            service.updateThumbnail(bookIdx, uploadedImageUrl);

            return ResponseEntity.ok(uploadedImageUrl);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("이미지 생성 또는 저장 중 오류 발생: " + e.getMessage());
        }
    }
	
	
	 // 썸네일 데이터 반환
    @GetMapping("/get-thumbnail")
    public ResponseEntity<String> getThumbnail(@RequestParam("book_idx") Long bookIdx) {
        try {
            // 책 정보에서 썸네일 URL 가져오기
            String thumbnailUrl = service.getThumbnail(bookIdx);
            if (thumbnailUrl != null) {
                return ResponseEntity.ok(thumbnailUrl); // URL 반환
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("썸네일이 존재하지 않습니다.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("오류 발생: " + e.getMessage());
        }
    }
    
    
    @PostMapping("/generate-image")
    public ResponseEntity<String> generateImage(@RequestBody Map<String, Object> request) {
    	
    	// JSON 데이터에서 contentIdx 추출
        Long contentIdx = Long.valueOf(request.get("content_idx").toString());
        System.out.println("contentIdx: " + contentIdx);


        try {
            // 1. 해당 동화 내용 가져오기
        	StoryContent content = service.getContentById(contentIdx);

            // 2. 프롬프트 생성
        	String prompt = content.getContent() + 
        		    " \n 위의 내용에 맞는 동화 느낌의 이미지를 생성해줘. " +
        		    "\n 고퀄리티 그림으로 그리고, 따뜻한 색감과 부드러운 수채화 스타일로 만들어줘. " +
        		    "\n 주요 인물과 배경 요소를 강조해." +
        		    "\n 아이들이 좋아할 수 있는 밝고 매력적인 분위기를 연출해줘." +
        		    "\n 중요: 어떠한 텍스트 요소도 완전히 배제해야 해." ;

            // 3. AI API를 통해 이미지 생성
            String imageUrl = dallEApiService.generateImage(prompt);
            
            System.out.println(imageUrl);

            // 4. Google Cloud Storage에 이미지 업로드
            String uploadedImageUrl = googleCloudStorageService.uploadImageFromUrl(imageUrl);

            // 5. StoryBook의 thumbnail 필드 업데이트
            service.updateImage(content.getContent_idx(), uploadedImageUrl);

            return ResponseEntity.ok(uploadedImageUrl);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("이미지 생성 또는 저장 중 오류 발생: " + e.getMessage());
        }
  
    }
    
    
    @PostMapping("/upload-image")
    public ResponseEntity<String> uploadImage(
            @RequestParam("file") MultipartFile file,
            @RequestParam("contentIdx") Long contentIdx) {

        try {
        	
        	// 0. 폴더 지정
        	String folderName = "User/ArtiBook";
        	
            // 1. 파일을 클라우드에 업로드
            String uploadedImageUrl = googleCloudStorageService.uploadFile(file, folderName);

            // 2. DB에 이미지 경로 저장
            service.updateImage(contentIdx, uploadedImageUrl);

            return ResponseEntity.ok(uploadedImageUrl); // 클라이언트에 이미지 URL 반환
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("이미지 업로드 또는 저장 중 오류 발생: " + e.getMessage());
        }
    }

    
    @PostMapping("/upload-thumbnail-png")
    public ResponseEntity<String> uploadImagePng(
            @RequestParam("file") MultipartFile file,
            @RequestParam("bookIdx") Long bookIdx) {

        try {
        	
        	// 0. 폴더 지정
        	String folderName = "User/ArtiBook";
        	
            // 1. 파일을 클라우드에 업로드
            String uploadedImageUrl = googleCloudStorageService.uploadFile(file, folderName);

            // 2. DB에 이미지 경로 저장
            service.updateThumbnail(bookIdx, uploadedImageUrl);

            return ResponseEntity.ok(uploadedImageUrl); // 클라이언트에 이미지 URL 반환
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("이미지 업로드 또는 저장 중 오류 발생: " + e.getMessage());
        }
    }
    
    
    
    
    
}
