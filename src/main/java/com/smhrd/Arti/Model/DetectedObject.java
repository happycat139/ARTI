package com.smhrd.Arti.Model;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
public class DetectedObject {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long obj_idx;
	
	private Long file_idx;

	@JsonProperty("name")
	private String obj_name;
	
	@JsonProperty("xmin")
	private float x_min;
	
	@JsonProperty("ymin")
	private float y_min;
	
	@JsonProperty("xmax")
	private float x_max;
	
	@JsonProperty("ymax")
	private float y_max;
	
	@JsonProperty("confidence")
	private float obj_confidence;
	
	@JsonProperty("class")
	private int obj_class;
	
	@CreationTimestamp
	private LocalDateTime obj_dt;
	
}
