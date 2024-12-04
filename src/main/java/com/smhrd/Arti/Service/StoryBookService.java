package com.smhrd.Arti.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.StoryContent;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.StoryBookRepository;
import com.smhrd.Arti.Repo.StoryContentRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class StoryBookService {

	@Autowired
	StoryBookRepository repo1;

	@Autowired
	StoryContentRepository repo2;

	// 기본정보 생성 메소드
	public void saveBase(StoryBook storybook, HttpSession session, Long book_idx) {

		

		// 입력받았던 작가 이름 가져오기
		String author = (String) session.getAttribute("author");

		// 유저 아이디 가져오기
		User user = (User) session.getAttribute("user");

		StoryBook story;

		// storybookId가 null이 아니면 기존 동화를 검색, 없으면 새 객체 생성
		if (book_idx != null) {
			story = repo1.findById(book_idx).orElseThrow(() -> new IllegalArgumentException("해당 동화를 찾을 수 없습니다."));
		} else {
			story = new StoryBook();
		}

		// StoryBook 객체 필드 설정 (GPT 응답 데이터 활용)
	    story.setBook_name(storybook.getBook_name());
	    story.setBook_genre(storybook.getBook_genre());
	    story.setBook_background(storybook.getBook_background());
	    story.setBook_subject(storybook.getBook_subject());
	    story.setBook_mc(storybook.getBook_mc());
	    story.setBook_summary(storybook.getBook_summary());

	    // 세션 정보 활용 (작가 이름, 이메일 등 설정)
	    story.setAuthor(author);
	    story.setEmail(user.getEmail());

		repo1.save(story);

		// 세션에도 해당 객체를 담기
		session.setAttribute("storybook", story);

	}

	// 줄거리 생성 메소드
	public void saveStory(String storylineJson, StoryBook story, HttpSession session) {
	    ObjectMapper objectMapper = new ObjectMapper();

	    try {
	        // JSON 문자열을 List<StoryContent>로 변환
	        List<StoryContent> storyContents = objectMapper.readValue(storylineJson, new TypeReference<List<StoryContent>>() {});

	        // 각 StoryContent 저장
	        for (StoryContent content : storyContents) {
	            content.setBook_idx(story.getBook_idx());
	            content.setContent_type("AI");
	            repo2.save(content);
	        }

	        // 세션에 저장
	        session.setAttribute("storyContentList", storyContents);
	    } catch (JsonProcessingException e) {
	        throw new RuntimeException("줄거리 데이터 파싱 중 오류가 발생했습니다.", e);
	    }
	}



	// 기본정보 출력 메소드
	public StoryBook getStoryBook(Long book_idx) {
		Optional<StoryBook> storybook = repo1.findById(book_idx);
		return storybook.get();
	}

	// 줄거리 출력 메소드
	public List<StoryContent> getStoryContent(Long book_idx) {
		return repo2.findByBookIdx(book_idx);
	}

	// 책 제목 업데이트 메서드
	public void updateBookTitle(StoryBook storyBook) {
		StoryBook existingStoryBook = repo1.findById(storyBook.getBook_idx())
				.orElseThrow(() -> new IllegalArgumentException("해당 book_idx가 존재하지 않습니다: " + storyBook.getBook_idx()));
		existingStoryBook.setBook_name(storyBook.getBook_name());
		repo1.save(existingStoryBook);
	}
	

	@Transactional
    public boolean updateStoryContent(Long bookIdx, int pageNum, String content) {
        // book_idx와 pageNum으로 데이터 찾기
        StoryContent storyContent = repo2.findByBookIdxAndPageNum(bookIdx, pageNum)
            .orElseThrow(() -> new IllegalArgumentException("해당 책의 페이지가 존재하지 않습니다. book_idx: " + bookIdx + ", page_num: " + pageNum));

        // 내용 수정
        storyContent.setContent(content);

        // 저장
        repo2.save(storyContent);
        return true; // 업데이트 성공
    }
	
	@Transactional
	public void updateThumbnail(Long book_idx, String imageUrl) {
	    // Optional 객체로 StoryBook 조회
	    Optional<StoryBook> optionalStoryBook = repo1.findById(book_idx);

	    // 값이 존재하면 업데이트
	    StoryBook storyBook = optionalStoryBook.orElseThrow(() -> 
	        new IllegalArgumentException("해당 ID의 StoryBook을 찾을 수 없습니다: " + book_idx)
	    );

	    // 프로필 이미지 업데이트
	    storyBook.setBook_thumbnail(imageUrl);

	    // 변경 내용 저장
	    repo1.save(storyBook);
	}
	
	 public String getThumbnail(Long bookIdx) {
	        // DB에서 책 정보를 가져와 썸네일 URL 반환
	        return repo1.findBookThumbnailByBookIdx(bookIdx);
	    }
	 
	 
	 // 모든 페이지 내용 가져오기
	    public List<StoryContent> getAllContentByBookIdx(Long bookIdx) {
	        return repo2.findByBookIdx(bookIdx);
	    }

	    // 이미지 URL 업데이트
	    public void updateImage(Long bookIdx, int pageNum, String imageUrl) {
	        StoryContent content = repo2.findByBookIdxAndPageNum(bookIdx, pageNum)
	            .orElseThrow(() -> new RuntimeException("페이지를 찾을 수 없습니다."));
	        content.setImage(imageUrl);
	        repo2.save(content);
	    }

		public StoryContent getContentById(Long contentIdx) {
			Optional<StoryContent> content =  repo2.findById(contentIdx);
			return content.get();
		}
		
		public void updateImage(Long contentIdx, String imageUrl) {
	        StoryContent content = repo2.findById(contentIdx)
	        		.orElseThrow(() -> new RuntimeException("페이지를 찾을 수 없습니다."));
	        content.setImage(imageUrl);
	        repo2.save(content);
	    }



	

}
