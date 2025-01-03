package com.smhrd.Arti.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "htp_results")
public class HtpResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long hId;
    
    @Column(name = "file_idx")
    private Long fileIdx;

    @Column(name = "user_name", nullable = false)
    private String userName;

    @Column(name = "symptom", nullable = false)
    private String symptom;

    @Column(name = "score", nullable = false)
    private int score;

    @Column(name = "total_score", nullable = false)
    private int totalScore;

    @Column(name = "summary")
    private String summary;

    @Column(name = "created_at", updatable = false, nullable = false)
    @CreationTimestamp
    private LocalDateTime createdAt;
    
    @Column(name = "explanations", columnDefinition = "TEXT") 
    private String explanations;
    
    // 파일 이름(링크)
 	private String file_name; 
}

