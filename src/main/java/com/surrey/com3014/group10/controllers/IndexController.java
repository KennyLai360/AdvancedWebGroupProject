package com.surrey.com3014.group10.controllers;
import com.surrey.com3014.group10.User.model.User;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
    @author Kenny Lai 
*/
@Controller
public class IndexController {

    /*
     This method will serve the request of form "/contact"
    */
    @RequestMapping( value ="/contact" , method = RequestMethod.GET)
    public String contact(ModelMap model) {
        model.addAttribute("user", MainController.getPrincipal());
        return "contact";
    }

    /*
     This method will serve the request of form "/about"
    */
    @RequestMapping(value ="/about", method = RequestMethod.GET)
    public String about(ModelMap model) {
        model.addAttribute("user", MainController.getPrincipal());
        return "about";
    }

    @RequestMapping(value ="/game", method = RequestMethod.GET)
    public String game(ModelMap model) {
        model.addAttribute("user", MainController.getPrincipal());
        return "game";
    }

    /*
     This method will serve the request of form "/join"
    */
    @RequestMapping(value ="/join", method = RequestMethod.GET)
    public String menu(ModelMap model) {
        model.addAttribute("user", MainController.getPrincipal());
        return "join";
    }

}
