package com.smhrd.Arti.Controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.Arti.Model.DetectedObject;
import com.smhrd.Arti.Model.HtpResult;
import com.smhrd.Arti.Model.HtpResultDTO;
import com.smhrd.Arti.Model.User;
import com.smhrd.Arti.Repo.HtpResultsRepository;
import com.smhrd.Arti.Service.HtpAiService;
import com.smhrd.Arti.Service.ObjectScoringService;
import com.smhrd.Arti.Service.YoloService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/htp")
@Controller
public class UploadController {

    @Autowired
    private YoloService yoloService;
    
    @Autowired
    private ObjectScoringService objectScoringService;
    
    @Autowired
    private HtpResultsRepository htpResultsRepository;
    
    @Autowired
    private HtpAiService htpAiService; // HtpAiService 추가
    
    
    // 이미지 업로드 및 분석 POST 요청 처리
    @PostMapping("/upload")
    public String uploadImage(
    		@RequestParam("file") MultipartFile file,
    		HttpSession session, 
    		Model model) {
        try {
            
        	// 세션에서 사용자 정보 가져오기
            User user = (User) session.getAttribute("user");
            
            // 세션에서 이메일, 이름 가져오기
            String email = user.getEmail();
            String userName = user.getNickname();
            
            if (email == null) {
                return "redirect:/welcome"; 
            }
            
            // YOLO 서비스 호출
            List<DetectedObject> detectedObjects = yoloService.processImage(file, email);
            
            // fileIdx를 추출 (DetectedObject 중 하나에서 가져오기)
            Long fileIdx = detectedObjects.isEmpty() ? null : detectedObjects.get(0).getFile_idx();

            if (fileIdx == null) {
                throw new RuntimeException("fileIdx가 생성되지 않았습니다.");
            }
            
            // 업로드된 이미지 URL 조회
            String uploadedImageUrl = yoloService.getUploadedImageUrl(fileIdx);
            
            // 점수 계산 서비스 호출(탐지된 객체 리스트를 한 번에 처리)
            Map<String, Integer> symptomScores = objectScoringService.calculateTotalScore(detectedObjects);
            
            // 총합 점수 계산
            int totalScore = symptomScores.values().stream().mapToInt(Integer::intValue).sum();
            
            // OpenAI를 사용해 해설 생성
            Map<String, String> symptomExplanations = htpAiService.getExplanations(symptomScores);

            
            // 결과 DTO 생성
            String summary = "사용자 " + userName + "님의 진단 결과입니다. 총합 점수는 " + totalScore + "점입니다.";
            HtpResultDTO resultDTO = HtpResultDTO.builder()
                    .userName(userName)
                    .fileIdx(fileIdx)
                    .symptomScores(symptomScores)
                    .symptomExplanations(symptomExplanations)
                    .totalScore(totalScore)
                    .summary(summary)
                    .build();
            
            // 점수 JSON 변환
            ObjectMapper objectMapper = new ObjectMapper();
            String labelsJson = objectMapper.writeValueAsString(resultDTO.getSymptomScores().keySet());
            String dataJson = objectMapper.writeValueAsString(resultDTO.getSymptomScores().values());
            

            // 결과 저장
            objectScoringService.saveHtpResult(resultDTO);

            // JSP로 결과 전달
            model.addAttribute("result", resultDTO);
            
            // 프로필 이미지 링크 전달
            model.addAttribute("uploadedImage", uploadedImageUrl);
            
            model.addAttribute("labelsJson", labelsJson);
            model.addAttribute("dataJson", dataJson);
            
            return "test/HtpResult";
 
            
        } catch (Exception e) {
        	
            // 실패 시 에러 메시지를 모델에 추가
            model.addAttribute("error", "이미지 업로드 및 분석 중 오류 발생: " + e.getMessage());
            return "error"; // 에러 페이지로 이동
        }
    }
    
    @GetMapping("/result")
    public String resultPage(@RequestParam("fileIdx") Long fileIdx, Model model) {
        try {
            // fileIdx 값으로 HtpResult 데이터 조회
            List<HtpResult> results = htpResultsRepository.findByFileIdx(fileIdx);
            
            if (results.isEmpty()) {
                model.addAttribute("error", "해당 fileIdx에 대한 결과가 존재하지 않습니다.");
                return "error";
            }

            // 종합 점수 계산
            int totalScore = results.stream().mapToInt(HtpResult::getScore).sum();

            // 결과를 DTO로 변환
            HtpResultDTO resultDTO = HtpResultDTO.builder()
                    .userName(results.get(0).getUserName()) // 첫 번째 결과의 사용자 이름 사용
                    .fileIdx(fileIdx)
                    .symptomScores(
                        results.stream().collect(Collectors.toMap(
                            HtpResult::getSymptom, 
                            HtpResult::getScore
                        ))
                    )
                    .totalScore(totalScore)
                    .summary("해당 결과의 총합 점수는 " + totalScore + "점입니다.")
                    .build();

            // JSP로 데이터 전달
            model.addAttribute("result", resultDTO);
            return "test/HtpResult";

        } catch (Exception e) {
            model.addAttribute("error", "결과를 불러오는 중 오류 발생: " + e.getMessage());
            return "error";
        }
    }

    
   
}
