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
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Ade Oladejo
 */
@Controller
public class MainController {

    //private static final Logger LOGGER = LoggerFactory.getLogger(MainController.class);

    public static GameList gl = new GameList();

    public static WordController wc = new WordController();

    @Autowired
    private UserService userService;

    /*
     This method will serve the request of form "/home" and root
    */
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "home";
    }

    /*
     This method will serve the request of form "/admin"
    */
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        model.addAttribute("listOfUsers", userService.listAllUsers());
        return "admin";
    }

    /*
     This method will serve the request of form "/admin"
    */
    @RequestMapping(value = "/dba", method = RequestMethod.GET)
    public String dba(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        model.addAttribute("listOfUsers", userService.listAllUsers());
        return "dba";
    }


    /*
     This method will serve the request to delete user by id
    */
    @RequestMapping("/dba/deleteUser")
    public ModelAndView deleteUser(@RequestParam int id) {
        userService.deleteUserById(id);
        return new ModelAndView("redirect:/dba");
    }

    /*
     This method will serve the request of form "/AccessDenied"
    */
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    /*
     This method will serve the request of form "/login"
    */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        if (isAuthenticated()) {
            return "redirect:/join";
        } else {
            return "login";
        }
    }

    /*
     This method will serve the request of form "/leaderboard"
    */
    @RequestMapping(value = "/leaderboard", method = RequestMethod.GET)
    public String leaderboard(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        model.addAttribute("listOfUsers", userService.listAllUsers());
        return "leaderboard";
    }

    /*
     This method will serve the request of form "/logout"
    */
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
        model.addAttribute("listOfUsers", userService.listAllUsers());
        return "game";
    }

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String menu(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        model.addAttribute("rooms", gl.getRooms());
        model.addAttribute("listOfUsers", userService.listAllUsers());
        return "join";
    }

    /*
        This method get the current authenticated User's name
    */
    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    /*
        This method checks whether a user has been authenticated
    */
    private boolean isAuthenticated() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            /* The user is logged in :) */
            return true;
        } else {
            return false;
        }

    }

}
