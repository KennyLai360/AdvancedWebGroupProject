package com.surrey.com3014.group10.controllers;


import com.surrey.com3014.group10.Client.GameRoom;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpStatus;

import com.surrey.com3014.group10.User.model.User;
import com.surrey.com3014.group10.User.service.UserService;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author maudff_000
 */
@Controller
public class MainController {
    //private static final Logger LOGGER = LoggerFactory.getLogger(MainController.class);

    public static GameList gl = new GameList();

    @Autowired
    private UserService userService;


    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "home";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        model.addAttribute("listOfUsers", userService.listAllUsers());
        return "admin";
    }

    @RequestMapping("/admin/deleteUser")
    public ModelAndView deleteUser(@RequestParam int id) {
    userService.deleteUserById(id);
    return new ModelAndView("redirect:/admin");
    }

    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        if(isAuthenticated())
        {
          return "redirect:/join";
        }
        else
        {
           return "login";
    }

    }

    @RequestMapping(value = "/leaderboard", method = RequestMethod.GET)
    public String leaderboard() {
        return "leaderboard";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "home";
    }

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public String game(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "game";
    }

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String menu(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        model.addAttribute("rooms", gl.getRooms());
        return "join";
    }

    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    private boolean isAuthenticated()
    {
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();

if (!(auth instanceof AnonymousAuthenticationToken)) {

    /* The user is logged in :) */
    return true;
}
else
{
    return false;
}

}

}
