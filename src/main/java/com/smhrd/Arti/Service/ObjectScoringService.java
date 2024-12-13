package com.smhrd.Arti.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Arti.Model.DetectedObject;
import com.smhrd.Arti.Model.HtpResult;
import com.smhrd.Arti.Model.HtpResultDTO;
import com.smhrd.Arti.Model.ObjectScoreRules;
import com.smhrd.Arti.Repo.HtpResultsRepository;

@Service
public class ObjectScoringService {
	
	@Autowired
	HtpResultsRepository htpResultsRepository;
	
	public HtpResultDTO getResultByFileIdx(Long fileIdx) {
        // 데이터베이스에서 특정 file_idx에 해당하는 데이터를 가져옵니다.
        List<HtpResult> results = htpResultsRepository.findByFileIdx(fileIdx);

        if (results.isEmpty()) {
            return null;
        }

        // DTO로 변환하여 반환
        Map<String, Integer> symptomScores = new HashMap<>();
        int totalScore = 0;

        for (HtpResult result : results) {
            symptomScores.put(result.getSymptom(), result.getScore());
            totalScore += result.getScore();
        }

        return HtpResultDTO.builder()
                .userName(results.get(0).getUserName())
                .fileIdx(fileIdx)
                .symptomScores(symptomScores)
                .totalScore(totalScore)
                .summary("총 점수: " + totalScore)
                .build();
    	}
	 
	 
	// 탐지된 객체 리스트를 받아 점수를 계산
	public Map<String, Integer> calculateTotalScore(List<DetectedObject> detectedObjects) {
		
		
	    // 카테고리 초기화
		Map<String, Integer> totalScores = new HashMap<>();
		
		for (DetectedObject obj : detectedObjects) {
			
			Map<String, Object> additionalAttributes = new HashMap<>();
			Map<String, Integer> scores = calculateScores(
					obj.getObj_name(),
					obj.getX_min(),
					obj.getY_min(),
					obj.getX_max(),
					obj.getY_min(),
					1280, 1280, 1638400, // 이미지 크기
					additionalAttributes
			);
			
			// 각 증상별 점수 합산
			scores.forEach((key, value) -> totalScores.merge(key, value, Integer::sum));
		}
		
		return totalScores;
	}
	
	// 점수 계산 메소드
	public Map<String, Integer> calculateScores(
	        String label, 
	        float xmin, float ymin, float xmax, float ymax,
	        int imageWidth, int imageHeight, int imageArea,
	        Map<String, Object> additionalAttributes) {

	    // 바운딩 박스 계산
	    float width = xmax - xmin;
	    float height = ymax - ymin;
	    float area = width * height;
	    float centerX = xmin + width / 2;
	    float centerY = ymin + height / 2;

	    // 규칙 호출하기
	    Map<String, Map<String, Integer>> rules = ObjectScoreRules.getRules();
	    Map<String, Integer> scores = new HashMap<>();

	    // 디버깅: 탐지된 라벨 확인
	    System.out.println("탐지된 라벨: " + label);

	    // 객체의 라벨에 해당하는 규칙이 없으면 빈 점수 반환
	    if (!rules.containsKey(label)) {
	        System.out.println("규칙이 없는 라벨: " + label);
	        return scores;
	    }

	    Map<String, Integer> labelRules = rules.get(label);

	    // 디버깅: 규칙 확인
	    System.out.println("적용된 규칙: " + labelRules);

	    // 크기 조건 적용
	    if (area >= 2.0 / 3 * imageArea) { // 큰 크기
	        scores.merge("공격성", labelRules.getOrDefault("large_area", 0), Integer::sum);
	    } else if (area <= 1.0 / 3 * imageArea) { // 작은 크기
	        scores.merge("사회불안", labelRules.getOrDefault("small_area", 0), Integer::sum);
	        scores.merge("우울", labelRules.getOrDefault("small_area", 0), Integer::sum);
	    } else { // 중간 크기
	        scores.merge("자존감", labelRules.getOrDefault("medium_area", 0), Integer::sum);
	    }

	    // 위치 조건 적용
	    if (centerX <= imageWidth / 3.0) { // 좌측
	        scores.merge("애정결핍", labelRules.getOrDefault("left_position", 0), Integer::sum);
	    } else if (centerX >= 2.0 * imageWidth / 3.0) { // 우측
	        scores.merge("공격성", labelRules.getOrDefault("right_position", 0), Integer::sum);
	    } else { // 중앙
	        scores.merge("자존감", labelRules.getOrDefault("center_position", 0), Integer::sum);
	    }

	    if (centerY <= imageHeight / 3.0) { // 상단
	        scores.merge("정서불안", labelRules.getOrDefault("top_position", 0), Integer::sum);
	    } else if (centerY >= 2.0 * imageHeight / 3.0) { // 하단
	        scores.merge("사회불안", labelRules.getOrDefault("bottom_position", 0), Integer::sum);
	    }

	    // 추가 속성 기반 조건 적용
	    applyAdditionalAttributes(label, labelRules, additionalAttributes, scores);

	    return scores;
	}
	
	 // 추가 속성 처리 메서드
	private void applyAdditionalAttributes(String label, Map<String, Integer> labelRules,

			Map<String, Object> additionalAttributes, Map<String, Integer> scores) {
		
			switch (label) {
			
				case "집전체":
					
					float areaRatio = ((Double) additionalAttributes.getOrDefault("areaRatio", 0.0)).floatValue(); // 이미지 면적 대비 비율
					boolean isCentered = (boolean) additionalAttributes.getOrDefault("isCentered", false); // 집 위치
					
					if (areaRatio >= 0.66) {
						scores.merge("공격성", labelRules.getOrDefault("large_area", 0), Integer::sum);
					} else if (areaRatio <= 0.33) {
						scores.merge("사회불안", labelRules.getOrDefault("small_area", 0), Integer::sum);
						scores.merge("우울", labelRules.getOrDefault("small_area", 0), Integer::sum);
						scores.merge("정서불안", labelRules.getOrDefault("small_area", 0), Integer::sum);
					}

					if (!isCentered) {
						scores.merge("애정결핍", labelRules.getOrDefault("left_position", 0), Integer::sum);
						scores.merge("공격성", labelRules.getOrDefault("right_position", 0), Integer::sum);
					} else {
						scores.merge("자존감", labelRules.getOrDefault("center_position", 0), Integer::sum);
					}
					break;
	            
				case "사람전체":
						boolean hasFace = (boolean) additionalAttributes.getOrDefault("hasFace", true);
						boolean hasArms = (boolean) additionalAttributes.getOrDefault("hasArms", true);
						boolean hasFeet = (boolean) additionalAttributes.getOrDefault("hasFeet", true);

						if (!hasFace) {
							scores.merge("사회불안", labelRules.getOrDefault("no_face", 0), Integer::sum);
						}
						if (!hasArms) {
							scores.merge("우울", labelRules.getOrDefault("missing_arms", 0), Integer::sum);
						}
						if (!hasFeet) {
							scores.merge("열등감", labelRules.getOrDefault("missing_legs", 0), Integer::sum);
						}
						break;

				case "나무":
					int branchCount = (int) additionalAttributes.getOrDefault("branchCount", 0);
					int fruitCount = (int) additionalAttributes.getOrDefault("fruitCount", 0);
					
					if (branchCount > 4) {
						scores.merge("공격성", labelRules.getOrDefault("many_branches", 0), Integer::sum);
					} else if (branchCount <= 1) {
						scores.merge("우울", labelRules.getOrDefault("few_branches", 0), Integer::sum);
					}
					
					if (fruitCount > 4) {
						scores.merge("정서불안", labelRules.getOrDefault("many_fruits", 0), Integer::sum);
					}
					break;
					
				case "연못":
					boolean hasPond = (boolean) additionalAttributes.getOrDefault("hasPond", false);
					if (hasPond) {
						scores.merge("자존감", labelRules.getOrDefault("exists", 0), Integer::sum);
					} else {
						scores.merge("우울", labelRules.getOrDefault("no_pond", 0), Integer::sum);
					}
					break;
					
				case "울타리":
					boolean hasFence = (boolean) additionalAttributes.getOrDefault("hasFence", false);
					if (hasFence) {
						scores.merge("정서불안", labelRules.getOrDefault("exists", 0), Integer::sum);
					} else {
						scores.merge("사회불안", labelRules.getOrDefault("no_fence", 0), Integer::sum);
					}
					break;
					
				case "굴뚝":
					boolean hasChimney = (boolean) additionalAttributes.getOrDefault("hasChimney", false);
					if (hasChimney) {
						scores.merge("자존감", labelRules.getOrDefault("exists", 0), Integer::sum);
					} else {
						scores.merge("열등감", labelRules.getOrDefault("no_chimney", 0), Integer::sum);
					}
					break;	
					
				case "태양":
					boolean hasSun = (boolean) additionalAttributes.getOrDefault("hasSun", false);
					if (hasSun) {
						scores.merge("자존감", labelRules.getOrDefault("exists", 0), Integer::sum);
					} else {
						scores.merge("정서불안", labelRules.getOrDefault("no_sun", 0), Integer::sum);
					}
					break;
	
				case "지붕":
					boolean hasRoof = (boolean) additionalAttributes.getOrDefault("hasRoof", true);
					if (!hasRoof) {
						scores.merge("사회불안", labelRules.getOrDefault("no_roof", 0), Integer::sum);
					}
					break;
					
				case "창문":
					int windowCount = (int) additionalAttributes.getOrDefault("windowCount", 0);
					if (windowCount == 0) {
						scores.merge("대인회피", labelRules.getOrDefault("no_window", 0), Integer::sum);
					} else if (windowCount > 4) {
						scores.merge("사회불안", labelRules.getOrDefault("many_windows", 0), Integer::sum);
					}
					break;
					
				case "문":
					int doorCount = (int) additionalAttributes.getOrDefault("doorCount", 0);
					if (doorCount == 0) {
						scores.merge("사회불안", labelRules.getOrDefault("no_door", 0), Integer::sum);
					} else if (doorCount > 1) {
						scores.merge("정서불안", labelRules.getOrDefault("many_doors", 0), Integer::sum);
					}
					break;
					
				case "집벽":
					int wallCount = (int) additionalAttributes.getOrDefault("wallCount", 0);
					if (wallCount == 0) {
						scores.merge("사회불안", labelRules.getOrDefault("no_walls", 0), Integer::sum);
					} else if (wallCount > 1) {
						scores.merge("공격성", labelRules.getOrDefault("many_walls", 0), Integer::sum);
					}
					break;

				case "차량":
					boolean hasVehicle = (boolean) additionalAttributes.getOrDefault("hasVehicle", false);
					if (hasVehicle) {
						scores.merge("공격성", labelRules.getOrDefault("exists", 0), Integer::sum);
					} else {
						scores.merge("사회불안", labelRules.getOrDefault("no_vehicle", 0), Integer::sum);
					}
					break;
					
				case "새":
					int birdCount = (int) additionalAttributes.getOrDefault("birdCount", 0);
					if (birdCount == 1) {
						scores.merge("자존감", labelRules.getOrDefault("single_bird", 0), Integer::sum);
					} else if (birdCount > 1) {
						scores.merge("정서불안", labelRules.getOrDefault("many_birds", 0), Integer::sum);
					}
					break;
					
				default:
					System.out.println("추가 처리되지 않은 라벨: " + label);
					break;
			}
		}
	
	
	// Htp 결과 저장 메소드
	public void saveHtpResult(HtpResultDTO htpResultDTO) {
	
		try { 
			htpResultDTO.getSymptomScores().forEach((symptom, score) -> {
				HtpResult htpResult = HtpResult.builder()
					.userName(htpResultDTO.getUserName())
					.fileIdx(htpResultDTO.getFileIdx())
					.symptom(symptom)
					.score(score)
					.totalScore(htpResultDTO.getTotalScore())
					.summary(htpResultDTO.getSummary())
					.build();
			
			htpResultsRepository.save(htpResult);
			
		});
		
		} catch (Exception e) {
			throw new RuntimeException("Htp 결과 저장 중 오류 발생: " + e.getMessage(), e);
		}
	}
}