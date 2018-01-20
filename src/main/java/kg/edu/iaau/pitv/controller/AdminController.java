package kg.edu.iaau.pitv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
    @RequestMapping(
            value = {"/dashboard"},
            method = {RequestMethod.GET})
    public String getDashboard()
    {
        return "admin/dashboard";
    }
}
