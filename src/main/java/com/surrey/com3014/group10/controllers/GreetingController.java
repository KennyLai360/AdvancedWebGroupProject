package com.surrey.com3014.group10.controllers;

/**
 * Created by Xyline on 03/05/2016.
 */
import java.util.ArrayList;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class GreetingController {

    @MessageMapping("/chat/{room}")
    @SendTo("/topic/greetings/{room}")
    public Greeting greeting(ChatMessage message) throws Exception {
        if (message.getMessage().toLowerCase().contains(WordController.word.toLowerCase())) {
            String s;
            s = message.getMessage().toLowerCase();
            s = s.substring(0, s.indexOf(':'));
            s = s.replace(":", "");
            s = s.trim();
            return new Greeting("Correct guess! " + s + " guessed correctly. The word was " + WordController.word);
        }
        else {
            return new Greeting(message.getMessage());
        }
    }
    @MessageMapping("/chat/roomOps/{room}")
    @SendTo("/topic/roomOps/{room}")
    public Greeting connectionInfo(ChatMessage message) throws Exception {
//        Thread.sleep(1000); // simulated delay
        return new Greeting(message.getMessage());
    }

    @MessageMapping("/chat/global")
    @SendTo("/topic/main")
    public Greeting mainInfo(ChatMessage message) throws Exception {
//        Thread.sleep(1000); // simulated delay
        return new Greeting(message.getMessage());
    }
}


