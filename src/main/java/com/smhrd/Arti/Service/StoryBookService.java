package com.smhrd.Arti.Service;

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
	
	public void saveStoryline(String storyline, HttpSession session) {
		
		// 입력받았던 작가 이름 가져오기
		String b_writer = (String) session.getAttribute("b_writer");
		User user = (User)session.getAttribute("user");
		
		
        String[] pages = storyline.split("###");

        Story story = new Story();
        story.setB_title(pages.length > 0 ? pages[0] : null);
        story.setB_genre(pages.length > 1 ? pages[1] : null);
        story.setB_Theme(pages.length > 3 ? pages[3] : null);
        story.setB_writer(b_writer);
        story.setUid(user.getUid());
        Story savedStory = repo2.save(story);
        
        StoryBook storyBook = new StoryBook();
        storyBook.setB_id(savedStory.getB_id());
        storyBook.setB_content1(pages.length > 5 ? pages[5] : null);
        storyBook.setB_content2(pages.length > 6 ? pages[6] : null);
        storyBook.setB_content3(pages.length > 7 ? pages[7] : null);
        storyBook.setB_content4(pages.length > 8 ? pages[8] : null);
        storyBook.setB_content5(pages.length > 9 ? pages[9] : null);
        storyBook.setB_content6(pages.length > 10 ? pages[10] : null);
        storyBook.setB_content7(pages.length > 11 ? pages[11] : null);
        storyBook.setB_content8(pages.length > 12 ? pages[12] : null);
        storyBook.setB_content9(pages.length > 13 ? pages[13] : null);
        storyBook.setB_content10(pages.length > 14 ? pages[14] : null);
        storyBook.setB_content11(pages.length > 15 ? pages[15] : null);

        repo1.save(storyBook);
	}
	
	
}
