package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.entity.HackathonJudgeEntity;

public interface HackathonJudgeRepository extends JpaRepository<HackathonJudgeEntity, Long> {
}
