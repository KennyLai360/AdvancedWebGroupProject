package com.surrey.com3014.group10.controllers;

/**
 * Created by Xyline on 03/05/2016.
 */
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class GreetingController {


    @MessageMapping("/chat")
    @SendTo("/topic/greetings")
    public Greeting greeting(ChatMessage message) throws Exception {
//        Thread.sleep(1000); // simulated delay
        return new Greeting(message.getMessage());
    }

}
