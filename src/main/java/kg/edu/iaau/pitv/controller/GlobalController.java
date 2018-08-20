package kg.edu.iaau.pitv.controller;

import kg.edu.iaau.pitv.model.User;
import kg.edu.iaau.pitv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalController
{
    @Autowired
    UserService userService;

    @ModelAttribute("currentUser")
    public User getCurrentUser() {
        User user = userService.getCurrentUser();
        return user;
    }
}
