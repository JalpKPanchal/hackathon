package com.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.TeamMembersEntity;

public interface TeamMembersRepository extends JpaRepository<TeamMembersEntity, Long> {
    List<TeamMembersEntity> findByTeam_TeamId(Long teamId);
    List<TeamMembersEntity> findByUser_UserId(UUID userId);
}