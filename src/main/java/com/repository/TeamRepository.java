package com.repository;

import com.entity.TeamEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeamRepository extends JpaRepository<TeamEntity, Long> {
    boolean existsByTeamName(String teamName); // To check if a team name is already in use
}
