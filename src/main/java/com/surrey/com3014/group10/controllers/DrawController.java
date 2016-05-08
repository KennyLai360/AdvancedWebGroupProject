package com.surrey.com3014.group10.controllers;

import com.surrey.com3014.group10.Client.GameRoom;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.surrey.com3014.group10.controllers.MainController.gl;

/**
 *
 * @author Jonny
 */
@RestController
public class DrawController {
    private static List<GameRoom> rooms = new ArrayList<>();

    @MessageMapping("/draw/{room}")
    @SendTo("/topic/drawings/{room}")
    public Drawing drawing(DrawData drawMessage) throws Exception {
//        Thread.sleep(1000); // simulated delay
        return new Drawing(drawMessage.getDrawing());
    }

    @RequestMapping(value = "/addRooms", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody
    String addRooms(
        @RequestBody GameRoom room) throws ParseException, IOException {
        try {
            DrawController.rooms.add(room);
//            gl.addRoom(rooms);
            return "Successfully added rooms";
        } catch (Exception ex) {
            return null;
        }
    }

    @RequestMapping(value="/getRooms", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<GameRoom> getRooms() {
        return DrawController.rooms;
    }


}
