package com.smhrd.Arti.Model;

import jakarta.persistence.Column;
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
@Table(name = "tb_storybook")
public class StoryBook {
	
	@Id
	private Long b_id;
	
	@Column(name = "b_content1", columnDefinition = "TEXT")
    private String b_content1;
	@Column(name = "b_content2", columnDefinition = "TEXT")
    private String b_content2;
	@Column(name = "b_content3", columnDefinition = "TEXT")
    private String b_content3;
	@Column(name = "b_content4", columnDefinition = "TEXT")
    private String b_content4;
	@Column(name = "b_content5", columnDefinition = "TEXT")
    private String b_content5;
	@Column(name = "b_content6", columnDefinition = "TEXT")
    private String b_content6;
	@Column(name = "b_content7", columnDefinition = "TEXT")
    private String b_content7;
	@Column(name = "b_content8", columnDefinition = "TEXT")
    private String b_content8;
	@Column(name = "b_content9", columnDefinition = "TEXT")
    private String b_content9;
	@Column(name = "b_content10", columnDefinition = "TEXT")
    private String b_content10;
	@Column(name = "b_content11", columnDefinition = "TEXT")
    private String b_content11;

}
