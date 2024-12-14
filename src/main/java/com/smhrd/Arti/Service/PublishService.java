package com.smhrd.Arti.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.Arti.Model.Publish;
import com.smhrd.Arti.Model.PublishRequest;
import com.smhrd.Arti.Model.PublishStatus;
import com.smhrd.Arti.Model.StoryBook;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.PublishRepository;
import com.smhrd.Arti.Repo.StoryBookRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class PublishService {

	private final PublishRepository publishRepository;
    private final StoryBookRepository storyBookRepository;

    public PublishService(PublishRepository publishRepository, StoryBookRepository storyBookRepository) {
        this.publishRepository = publishRepository;
        this.storyBookRepository = storyBookRepository;
    }

    // 장바구니에 책 추가
    public void addToCart(Long bookId, Integer quantity, String email, HttpSession session) {
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
        session.setAttribute("pub_idx", cart.getPub_idx());
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
            bookInfo.put("book_idx", book.getBook_idx());
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
    
    private String convertBookListToJson(Map<Long, Integer> bookList) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(bookList); // Map -> JSON 변환
        } catch (Exception e) {
            throw new RuntimeException("책 리스트를 JSON으로 변환하는 데 실패했습니다.", e);
        }
    }
    
    public void updateBookQuantity(Long bookIdx, int quantity, HttpSession session) throws Exception {
        
    	User user = (User) session.getAttribute("user");
    	String email = user.getEmail();
    	
    	Publish cart = publishRepository.findByEmailAndStatus(email, PublishStatus.CART)
                .orElseThrow(() -> new IllegalArgumentException("장바구니가 없습니다."));
    	
    	
    	// book_list 파싱
        Map<Long, Integer> bookList = parseBookList(cart.getBookList());

        // 수량 업데이트
        if (bookList.containsKey(bookIdx)) {
            bookList.put(bookIdx, quantity);
        } else {
            throw new IllegalArgumentException("해당 책이 장바구니에 없습니다.");
        }

        // JSON으로 변환 후 저장
        cart.setBookList(convertBookListToJson(bookList));
        publishRepository.save(cart);
    }
    
    
    // 출판 최종 데이터 저장
    public void finalizePublish(PublishRequest publishRequest, String email) {
        // 출판 데이터 가져오기
        Publish publish = publishRepository.findById(publishRequest.getPub_idx())
                .orElseThrow(() -> new IllegalArgumentException("해당 출판 정보를 찾을 수 없습니다."));

        // 장바구니 상태인지 확인
        if (!publish.getStatus().equals(PublishStatus.CART)) {
            throw new IllegalStateException("출판 상태가 유효하지 않습니다.");
        }

        // 데이터 업데이트
        publish.setPub_sender(publishRequest.getPub_sender());
        publish.setSender_phone(publishRequest.getSender_phone());
        publish.setPub_email(publishRequest.getPub_email());
        publish.setPub_receiver(publishRequest.getPub_receiver());
        publish.setReceiver_phone(publishRequest.getReceiver_phone());
        publish.setZipCode(publishRequest.getZipCode());
        publish.setAddress(publishRequest.getAddress());
        publish.setMessage(publishRequest.getMessage());
        publish.setTotalPrice(publishRequest.getTotalPrice());
        publish.setStatus(PublishStatus.PUBLISHED); // 상태를 PUBLISHED로 변경

        // 데이터 저장
        publishRepository.save(publish);
    }
    
    public Page<Publish> getPublishedObjects(Pageable pageable) {
        return publishRepository.findAllByStatusOrderByPub_idxDesc(PublishStatus.PUBLISHED, pageable);
    }
    
	    
	    
}
