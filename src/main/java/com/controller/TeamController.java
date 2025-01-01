package com.controller;

import com.entity.TeamEntity;
import com.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/teams")
public class TeamController {

    @Autowired
    private TeamRepository teamRepository;

    // GET - Render Create Team Page
    @GetMapping("/create")
    public String showCreateTeamPage() {
        return "CreateTeam"; // Corresponds to CreateTeam.jsp
    }

    // POST - Handle Create Team Form Submission
    @PostMapping("/create")
    public String createTeam(@RequestParam("teamName") String teamName, Model model) {
        if (teamRepository.existsByTeamName(teamName)) {
            model.addAttribute("error", "Team name already exists. Please choose another name.");
            return "CreateTeam"; // Reload CreateTeam.jsp with an error message
        }

        // Create and save the new team
        TeamEntity team = new TeamEntity();
        team.setTeamName(teamName);
        team.setCurrentMembers(1); // Assume the creator is the first member
        team.setMaxMembers(5); // Default max members, can be adjusted dynamically
        team.setStatus(TeamEntity.TeamStatus.IN_PROGRESS);
        teamRepository.save(team);

        model.addAttribute("success", "Team created successfully!");
        return "redirect:/dashboard"; // Redirect to dashboard after successful creation
    }
}
