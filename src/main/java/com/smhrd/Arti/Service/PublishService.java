package com.smhrd.Arti.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.Publish;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Repo.PublishRepository;
import com.smhrd.Arti.Repo.StoryBookRepository;

@Service
public class PublishService {

	 @Autowired
	    private PublishRepository repo;
	 
	 @Autowired
	    private StoryBookRepository bookRepository;

	    // 장바구니에 추가
	    public Publish addToCart(Long bookIdx, String email) {
	        Publish publish = new Publish();
	        publish.setBook_idx(bookIdx);
	        publish.setEmail(email);

	        return repo.save(publish);
	    }

	    // 장바구니 목록 가져오기
	    public List<StoryBook> getCartItems(String email) {
	        List<Publish> publishes = repo.findByEmail(email);

	        List<StoryBook> storyBooks = new ArrayList<>();
	        for (Publish publish : publishes) {
	            Optional<StoryBook> optionalBook = bookRepository.findById(publish.getBook_idx());
	            if (optionalBook.isPresent()) {
	                storyBooks.add(optionalBook.get());
	            }
	        }

	        return storyBooks;





	    }
	
}
