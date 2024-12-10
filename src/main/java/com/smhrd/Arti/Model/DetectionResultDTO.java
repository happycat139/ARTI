package com.smhrd.Arti.Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DetectionResultDTO {

	private float xmin;
	private float ymin;
	private float xmax;
	private float ymax;
	
	// YOLOv5 신뢰도
	private float confidence;
	
	// YOLOv5 클래스ID
	private int classId;
	
	// YOLOv5 탐지 객체 이름
	private String name;
	
}
