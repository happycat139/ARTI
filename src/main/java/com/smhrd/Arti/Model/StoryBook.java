package com.smhrd.Arti.Model;

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
@Table(name = "TB_StoryBook")
public class StoryBook {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long b_id;
	
    private String b_content1;
    private String b_content2;
    private String b_content3;
    private String b_content4;
    private String b_content5;
    private String b_content6;
    private String b_content7;
    private String b_content8;
    private String b_content9;
    private String b_content10;
    private String b_content11;

}
