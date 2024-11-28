package com.smhrd.Arti.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void saveBase(String storyline, HttpSession session, Long book_idx) {

		System.out.println(storyline);

		// 입력받았던 작가 이름 가져오기
		String author = (String) session.getAttribute("author");

		// 유저 아이디 가져오기
		User user = (User) session.getAttribute("user");

		String[] pages = storyline.split("###");

		StoryBook story;

		// storybookId가 null이 아니면 기존 동화를 검색, 없으면 새 객체 생성
		if (book_idx != null) {
			story = repo1.findById(book_idx).orElseThrow(() -> new IllegalArgumentException("해당 동화를 찾을 수 없습니다."));
		} else {
			story = new StoryBook();
		}

		story.setBook_name(pages.length > 0 ? pages[0] : null);
		story.setBook_genre(pages.length > 1 ? pages[1] : null);
		story.setBook_background(pages.length > 2 ? pages[2] : null);
		story.setBook_subject(pages.length > 3 ? pages[3] : null);
		story.setBook_mc(pages.length > 4 ? pages[4] : null);
		story.setBook_summary(pages.length > 5 ? pages[5] : null);

		story.setAuthor(author);
		story.setEmail(user.getEmail());

		repo1.save(story);

		// 세션에도 해당 객체를 담기
		session.setAttribute("storybook", story);

	}

	// 줄거리 생성 메소드
	public void saveStory(String storyline, HttpSession session) {

		// 이전 페이지의 동화 정보 가져오기
		StoryBook story = (StoryBook) session.getAttribute("storybook");

		String[] pages = storyline.split("###");

		// StoryContent 리스트 생성
		List<StoryContent> storyContentList = new ArrayList<>();

		// 각 페이지 내용을 개별적으로 저장
		for (int i = 0; i < pages.length; i++) {
			StoryContent storyContent = new StoryContent();

			// 도서 식별자 설정
			storyContent.setBook_idx(story.getBook_idx());

			// 페이지 번호 설정 (i + 1로 1부터 시작)
			storyContent.setPageNum(i + 1);

			// 페이지 내용 설정
			storyContent.setContent(pages[i]);

			// 내용 구분 (여기서는 줄거리로 지정)
			storyContent.setContent_type("AI");

			// 저장소에 저장
			repo2.save(storyContent);

			// 리스트에 추가
			storyContentList.add(storyContent);
		}

		// 세션에도 해당 객체를 담기
		session.setAttribute("storyContentList", storyContentList);

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



}
