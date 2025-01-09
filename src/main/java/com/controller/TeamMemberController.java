package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.entity.TeamMembersEntity;
import com.entity.UserEntity;
import com.repository.TeamMembersRepository;
import com.repository.TeamRepository;
import com.repository.UserRepository;
import com.service.MailService;

@Controller
@RequestMapping("/teams")
public class TeamMemberController {

    @Autowired
    private TeamMembersRepository teamMembersRepository;

    @Autowired
    private TeamRepository teamRepository; // For fetching team details

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private MailService mailService;

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
            @RequestParam String role, // Add role here
            Model model) {
        // Check if the user exists by email
        UserEntity user = userRepository.findByEmail(email).orElse(null);
        if (user == null) {
            model.addAttribute("message", "User with email " + email + " does not exist.");
            return "AddTeamMember";
        }
        
        // Find the team by teamId
        var team = teamRepository.findById(teamId).orElse(null);
        if (team == null) {
            model.addAttribute("message", "Team not found.");
            return "AddTeamMember";
        }

        // Save the new member with status INVITED
        TeamMembersEntity newMember = new TeamMembersEntity();
        newMember.setTeam(team);
        newMember.setUser(user);
        newMember.setStatus(TeamMembersEntity.Status.INVITED);
        teamMembersRepository.save(newMember);

        // Send the invitation email
        try {
            mailService.sendHackathonInvitationEmail(email, user.getFirstName(), "Hackathon 2025", role, teamId);
            model.addAttribute("message", "Invitation sent successfully to " + email);
        } catch (Exception e) {
            model.addAttribute("message", "Failed to send the email. Please try again.");
        }

        return "Invitation"; // Redirect or forward to Invitation.jsp
    }
}
