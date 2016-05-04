package com.surrey.com3014.group10.controllers;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Jonny
 */
@Controller
public class DrawController {

    @MessageMapping("/draw")
    @SendTo("/topic/drawings")
    public Drawing drawing(DrawData drawMessage) throws Exception {
//        Thread.sleep(1000); // simulated delay
        return new Drawing(drawMessage.getDrawing());
    }

}
