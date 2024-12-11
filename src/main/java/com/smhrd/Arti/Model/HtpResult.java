package com.smhrd.Arti.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "htp_results")
public class HtpResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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
    private LocalDateTime createdAt;
}

