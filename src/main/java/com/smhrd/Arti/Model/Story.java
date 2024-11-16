package com.smhrd.Arti.Model;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Entity
@Table(name = "tb_story")
public class Story {

	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long b_id;
	
	private Long uid;
    private String b_writer;
    private String b_title;
    private String b_background;
    private String b_thumbnail;
    private String b_genre;
    private String b_Theme;
    private String b_mc;
    
    @Column(name = "b_summary", columnDefinition = "TEXT")
    private String b_summary;
    
    @CreatedDate
    private LocalDateTime b_create_date;
    
    public Story() {
        this.b_create_date = LocalDateTime.now();
    }
	
}
