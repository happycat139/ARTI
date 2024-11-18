package com.smhrd.Arti.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Arti.Service.QnaBoardService;

@RestController
@RequestMapping("/arti/board")
public class QnaBoardRestController {

	@Autowired
	QnaBoardService service;
	
	
	 @DeleteMapping("delete/{idx}")
	    public ResponseEntity<Void> deletePost(@PathVariable Long idx) {
	        boolean isDeleted = service.deletePost(idx);

	        if (isDeleted) {
	            return ResponseEntity.ok().build(); // 성공 응답
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 실패 응답
	        }
	    }
}
