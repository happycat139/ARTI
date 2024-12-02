package com.smhrd.Arti.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.StoryContent;
import com.smhrd.Arti.Service.DallEApiService;
import com.smhrd.Arti.Service.GoogleCloudStorageService;
import com.smhrd.Arti.Service.StoryBookService;

@RestController
@RequestMapping("/arti/book")
public class StoryBookRestController {

	
	private final StoryBookService service;
	private final DallEApiService dallEApiService;
    private final GoogleCloudStorageService googleCloudStorageService;
    
    @Autowired
    public StoryBookRestController(
            DallEApiService dallEApiService,
            GoogleCloudStorageService googleCloudStorageService,
            StoryBookService service) {
        this.dallEApiService = dallEApiService;
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
            // 1. AI API를 통해 이미지 생성
            String ImageUrl = dallEApiService.generateImage(Iprompt);

            // 2. Google Cloud Storage에 이미지 업로드
            String uploadedImageUrl = googleCloudStorageService.uploadImageFromUrl(ImageUrl);

            // 3. StoryBook의 thumbnail 필드 업데이트
            service.updateThumbnail(bookIdx, uploadedImageUrl);

            return ResponseEntity.ok("이미지 생성 및 업데이트가 성공적으로 완료되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("이미지 생성 또는 저장 중 오류 발생: " + e.getMessage());
        }
    }


}
