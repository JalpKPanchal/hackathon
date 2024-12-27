package com.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "hackathonJudges")
@Data
public class HackathonJudgeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long hackathonJudgeId;

    @ManyToOne
    @JoinColumn(name = "hackathonId", nullable = false)
    private HackathonEntity hackathon;

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private UserEntity user;

    @Column(nullable = false)
    private String role;
}
