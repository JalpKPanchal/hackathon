package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.TeamMembersEntity;

public interface TeamMembersRepository extends JpaRepository<TeamMembersEntity, Long> {
    List<TeamMembersEntity> findByTeam_TeamId(Long teamId);
}