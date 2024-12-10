package com.smhrd.Arti.Model;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_object")
public class AnalysisObject {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long obj_idx;
	
	@ManyToOne
    @JoinColumn(name = "file_idx", nullable = false)
    private Upload upload; // 연관관계 매핑

	private String obj_name;
	
	private float x_min;
	private float y_min;
	private float x_max;
	private float y_max;
	
	private float obj_confidence;
	
	private int obj_class;
	
	@CreationTimestamp
	private LocalDateTime obj_dt;
	
}
