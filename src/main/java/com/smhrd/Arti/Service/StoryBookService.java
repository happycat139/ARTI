package com.smhrd.Arti.Service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.Story;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.StoryBookRepository;
import com.smhrd.Arti.Repo.StoryRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class StoryBookService {

	@Autowired
	StoryBookRepository repo1;

	@Autowired
	StoryRepository repo2;

	public void saveBase(String storyline, HttpSession session) {

		// 입력받았던 작가 이름 가져오기
		String b_writer = (String) session.getAttribute("b_writer");

		// 유저 아이디 가져오기
		User user = (User) session.getAttribute("user");

		String[] pages = storyline.split("###");

		Story story = new Story();
		story.setB_title(pages.length > 0 ? pages[0] : null);
		story.setB_genre(pages.length > 1 ? pages[1] : null);
		story.setB_background(pages.length > 2 ? pages[2] : null);
		story.setB_Theme(pages.length > 3 ? pages[3] : null);
		story.setB_mc(pages.length > 4 ? pages[4] : null);
		story.setB_summary(pages.length > 5 ? pages[5] : null);

		story.setB_writer(b_writer);
		story.setUid(user.getUid());
		repo2.save(story);

		// 세션에도 해당 객체를 담기
		session.setAttribute("story", story);

	}

	public void saveStory(String storyline, HttpSession session) {

		// 이전 페이지의 동화 정보 가져오기
		Story story = (Story) session.getAttribute("story");
		
		String[] pages = storyline.split("###");

		StoryBook storyBook = new StoryBook();
		storyBook.setB_id(story.getB_id());
		storyBook.setB_content1(pages.length > 0 ? pages[0] : null);
		storyBook.setB_content2(pages.length > 1 ? pages[1] : null);
		storyBook.setB_content3(pages.length > 2 ? pages[2] : null);
		storyBook.setB_content4(pages.length > 3 ? pages[3] : null);
		storyBook.setB_content5(pages.length > 4 ? pages[4] : null);
		storyBook.setB_content6(pages.length > 5 ? pages[5] : null);
		storyBook.setB_content7(pages.length > 6 ? pages[6] : null);
		storyBook.setB_content8(pages.length > 7 ? pages[7] : null);
		storyBook.setB_content9(pages.length > 8 ? pages[8] : null);
		storyBook.setB_content10(pages.length > 9 ? pages[9] : null);
		storyBook.setB_content11(pages.length > 10 ? pages[10] : null);

		repo1.save(storyBook);

		// 세션에도 해당 객체를 담기
		session.setAttribute("storyBook", storyBook);

	}

}
