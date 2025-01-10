package com.controller;

import java.util.UUID;

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
    private TeamRepository teamRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private MailService mailService;

    @GetMapping("/list")
    public String listTeams(Model model) {
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
        UserEntity user = userRepository.findByEmail(email).orElse(null);
        if (user == null) {
            model.addAttribute("message", "User with email " + email + " does not exist.");
            return "AddTeamMember";
        }

        var team = teamRepository.findById(teamId).orElse(null);
        if (team == null) {
            model.addAttribute("message", "Team not found.");
            return "AddTeamMember";
        }

        TeamMembersEntity newMember = new TeamMembersEntity();
        newMember.setTeam(team);
        newMember.setUser(user);
        newMember.setStatus(TeamMembersEntity.Status.INVITED);
        teamMembersRepository.save(newMember);

        try {
            mailService.sendHackathonInvitationEmail(user.getUserId(), email, user.getFirstName(), "Hackathon 2025", role, teamId);
            model.addAttribute("message", "Invitation sent successfully to " + email);
        } catch (Exception e) {
            model.addAttribute("message", "Failed to send the email. Please try again.");
        }

        return "Invitation";
    }

    @GetMapping("/updateInvitation/{teamId}/{userId}/{status}")
    public String updateInvitation(
            @PathVariable Long teamId,
            @PathVariable UUID userId,
            @PathVariable int status,
            Model model) {
        try {
            TeamMembersEntity teamMember = teamMembersRepository
                    .findByTeam_TeamId(teamId)
                    .stream()
                    .filter(tm -> tm.getUser().getUserId().equals(userId))
                    .findFirst()
                    .orElse(null);

            if (teamMember == null) {
                model.addAttribute("message", "Invalid invitation or user.");
                return "Response";
            }

            if (status == 1) {
                teamMember.setStatus(TeamMembersEntity.Status.ACCEPTED);
                model.addAttribute("message", "You have accepted the invitation.");
            } else {
                teamMember.setStatus(TeamMembersEntity.Status.REJECTED);
                model.addAttribute("message", "You have rejected the invitation.");
            }

            teamMembersRepository.save(teamMember);
        } catch (Exception e) {
            model.addAttribute("message", "An error occurred while processing your response. Please try again.");
        }

        return "Response";
    }
}
