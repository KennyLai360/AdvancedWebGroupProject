/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.controllers;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;

/**
 *
 * @author Jonny
 */
public class DrawController {

    @MessageMapping("/draw")
    @SendTo("/topic/drawings")
    public Drawing draw(DrawData drawing) throws Exception {
//        Thread.sleep(1000); // simulated delay
        return new Drawing(drawing.getCoor());
    }

}
