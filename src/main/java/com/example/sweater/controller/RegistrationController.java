package com.example.sweater.controller;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    private final UserRepository repository;

    public RegistrationController(UserRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("registration")
    public String addUser(User user, Map<String, Object> model) {
        User byUsername = repository.findByUsername(user.getUsername());
        if (byUsername != null) {
            model.put("message", "User exists!");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        repository.save(user);

        return "redirect:/login";
    }
}
