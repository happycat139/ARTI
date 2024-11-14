package com.smhrd.Arti.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Repo.StoryBookRepository;

@Service
public class StoryBookService {

	@Autowired
	StoryBookRepository repo;
	
	public void saveStoryline(String storyline) {
        String[] pages = storyline.split("###");

        StoryBook storyBook = new StoryBook();
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

        repo.save(storyBook);
	}
	
	
}
