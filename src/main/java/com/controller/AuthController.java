package com.controller;

import com.entity.UserEntity;
import com.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String loginPage() {
        return "Login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email, @RequestParam String password, Model model,HttpSession session) {
        UserEntity user = userRepository.findByEmail(email)
                .orElse(null);

        if (user != null && user.getPassword().equals(password)) {
            model.addAttribute("user", user);
            session.setAttribute("user", user);
            return "Dashboard";
        } else {
            model.addAttribute("error", "Invalid email or password!");
            return "Login";
        }
    }

    @GetMapping("/signup")
    public String signupPage() {
        return "Signup";
    }

    @PostMapping("/signup")
    public String registerUser(@ModelAttribute UserEntity user, Model model) {
        if (userRepository.findByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("error", "Email already exists!");
            return "Signup";
        }
        userRepository.save(user);
        model.addAttribute("message", "Registration successful!");
        return "Login";
    }
}
