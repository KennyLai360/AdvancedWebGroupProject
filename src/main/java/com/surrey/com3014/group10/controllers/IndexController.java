package com.surrey.com3014.group10.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

    @RequestMapping("/home")
    public String home() {
        return "home";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }

    @RequestMapping("/about")
    public String about() {
        return "about";
    }

    @RequestMapping("/game")
    public String game() {
        return "game";
    }

    @RequestMapping("/join")
    public String menu() {
        return "join";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

}
