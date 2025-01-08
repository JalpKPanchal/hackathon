package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.entity.TeamMembersEntity;
import com.repository.TeamMembersRepository;
import com.repository.TeamRepository;
import com.repository.UserRepository;

@Controller
@RequestMapping("/teams")
public class TeamMemberController {
	@Autowired
    private TeamMembersRepository teamMembersRepository;

    @Autowired
    private TeamRepository teamRepository; // For fetching team details (assumes a TeamRepository exists)
    
    @Autowired
    private UserRepository userRepository;
    
    @GetMapping("/list")
    public String listTeams(Model model) {
        // Fetch all teams and pass to the model
        model.addAttribute("teams", teamRepository.findAll());
        return "ListTeam";
    }

    @GetMapping("/addMember/{teamId}")
    public String showAddMemberForm(@PathVariable Long teamId, Model model) {
        model.addAttribute("teamId", teamId);
        return "AddTeamMember";
    }

    @PostMapping("/addMember")
    public String addMember(
            @RequestParam Long teamId,
            @RequestParam String email,
            @RequestParam String role,
            Model model) {
        // Logic to find the user by email, create an invite, and save to repository
        TeamMembersEntity newMember = new TeamMembersEntity();
        newMember.setTeam(teamRepository.findById(teamId).orElseThrow());
        newMember.setUser(userRepository.findByEmail(email).orElseThrow()); // Assumes a UserRepository with a findByEmail method
        newMember.setStatus(TeamMembersEntity.Status.INVITED);
      
        teamMembersRepository.save(newMember);

        model.addAttribute("message", "Invite sent successfully to " + email);
        return "redirect:/teams/list";
    }
}