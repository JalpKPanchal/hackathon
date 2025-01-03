package com.controller;

import com.entity.HackathonEntity;
import com.entity.TeamEntity;
import com.repository.HackathonRepository;
import com.repository.TeamRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/teams")
public class TeamController {

    @Autowired
    private TeamRepository teamRepository;

    @Autowired
    private HackathonRepository hackathonRepository; // Add this line to access Hackathons

    // GET - Render Create Team Page
    @GetMapping("/create")
    public String showCreateTeamPage(Model model) {
        // Fetch all hackathons from the repository
        List<HackathonEntity> hackathons = hackathonRepository.findAll();
        
        // Add the hackathons list to the model so it can be accessed in the JSP
        model.addAttribute("hackathons", hackathons);
        
        return "CreateTeam"; // Corresponds to CreateTeam.jsp
    }

    // POST - Handle Create Team Form Submission
    @PostMapping("/create")
    public String createTeam(@RequestParam("teamName") String teamName, @RequestParam("hackathonId") Long hackathonId, Model model) {
        if (teamRepository.existsByTeamName(teamName)) {
            model.addAttribute("error", "Team name already exists. Please choose another name.");
            return "Dashboard"; // Reload CreateTeam.jsp with an error message
        }

        // Create and save the new team
        TeamEntity team = new TeamEntity();
        team.setTeamName(teamName);
        team.setCurrentMembers(1); // Assume the creator is the first member
        team.setMaxMembers(5); // Default max members, can be adjusted dynamically
        team.setStatus(TeamEntity.TeamStatus.IN_PROGRESS);
        
        // Set the hackathon for the team (you can adjust this logic as needed)
        HackathonEntity selectedHackathon = hackathonRepository.findById(hackathonId).orElse(null);
        team.setHackathon(selectedHackathon);
        
        teamRepository.save(team);

        model.addAttribute("success", "Team created successfully!");
        return "redirect:/Dashboard"; // Redirect to dashboard after successful creation
    }
}