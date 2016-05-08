package com.surrey.com3014.group10.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

    @RequestMapping( value ="/contact" , method = RequestMethod.GET)
    public String contact() {
        return "contact";
    }

    @RequestMapping(value ="/about", method = RequestMethod.GET)
    public String about() {
        return "about";
    }


    @RequestMapping(value ="/index", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

}
