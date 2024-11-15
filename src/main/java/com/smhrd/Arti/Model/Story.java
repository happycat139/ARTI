package com.smhrd.Arti.Model;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tb_story")
public class Story {

	private Long uid;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long b_id;
	
    private String b_writer;
    private String b_title;
    private String b_thumbnail;
    private String b_genre;
    private String b_Theme;
    private Date b_create_date;
	
}
