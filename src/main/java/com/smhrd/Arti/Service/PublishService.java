package com.smhrd.Arti.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.Arti.Model.Publish;
import com.smhrd.Arti.Model.PublishStatus;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Repo.PublishRepository;
import com.smhrd.Arti.Repo.StoryBookRepository;

@Service
public class PublishService {

	private final PublishRepository publishRepository;
    private final StoryBookRepository storyBookRepository;

    public PublishService(PublishRepository publishRepository, StoryBookRepository storyBookRepository) {
        this.publishRepository = publishRepository;
        this.storyBookRepository = storyBookRepository;
    }

    // 장바구니에 책 추가
    public void addToCart(Long bookId, Integer quantity, String email) {
        Publish cart = publishRepository.findByEmailAndStatus(email, PublishStatus.CART)
                .orElseGet(() -> Publish.builder()
                        .email(email)
                        .status(PublishStatus.CART)
                        .bookList("[]")
                        .totalPrice(0)
                        .build());

        Map<Long, Integer> bookMap = parseBookList(cart.getBookList());

        // 기존 책이면 수량 추가, 아니면 새로 추가
        bookMap.put(bookId, bookMap.getOrDefault(bookId, 0) + quantity);

        cart.setBookList(convertToJson(bookMap));
        cart.setTotalPrice(calculateTotalPrice(bookMap));

        publishRepository.save(cart);
    }

    // 장바구니 내용 가져오기
    public List<Map<String, Object>> getCartBooks(String email) {
        Optional<Publish> cartOptional = publishRepository.findByEmailAndStatus(email, PublishStatus.CART);
        if (cartOptional.isEmpty()) {
            return Collections.emptyList();
        }

        Publish cart = cartOptional.get();
        Map<Long, Integer> bookMap = parseBookList(cart.getBookList());
        List<Map<String, Object>> books = new ArrayList<>();

        for (Map.Entry<Long, Integer> entry : bookMap.entrySet()) {
            StoryBook book = storyBookRepository.findById(entry.getKey())
                    .orElseThrow(() -> new IllegalArgumentException("책 정보가 없습니다."));
            Map<String, Object> bookInfo = new HashMap<>();
            bookInfo.put("book_name", book.getBook_name());
            bookInfo.put("book_thumbnail", book.getBook_thumbnail());
            bookInfo.put("quantity", entry.getValue()); // 수량 추가
            bookInfo.put("total_price", entry.getValue() * 9900); // 각 책의 총 금액
            books.add(bookInfo);
        }

        return books;
    }


    // JSON 문자열을 Map<Long, Integer>로 변환
    private Map<Long, Integer> parseBookList(String json) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.readValue(json, new TypeReference<Map<Long, Integer>>() {});
        } catch (Exception e) {
            return new HashMap<>();
        }
    }

    // Map<Long, Integer>를 JSON 문자열로 변환
    private String convertToJson(Map<Long, Integer> bookMap) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(bookMap);
        } catch (Exception e) {
            return "{}";
        }
    }

    // 총 가격 계산
    private int calculateTotalPrice(Map<Long, Integer> bookMap) {
        return bookMap.entrySet().stream()
                .mapToInt(entry -> entry.getValue() * 9900)
                .sum();
    }
	    
	    
}
