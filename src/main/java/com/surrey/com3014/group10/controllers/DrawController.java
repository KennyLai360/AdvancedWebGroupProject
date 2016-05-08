package com.surrey.com3014.group10.controllers;

import com.surrey.com3014.group10.Client.GameRoom;
import com.surrey.com3014.group10.Client.User;
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
    private static List<User> globalUserList = new ArrayList<>();

    /*
        This is the mapping for all drawing data.
        This sends all the drawing data out from the controller to the webSockets to specified rooms.
     */
    @MessageMapping("/draw/{room}")
    @SendTo("/topic/drawings/{room}")
    public Drawing drawing(DrawData drawMessage) throws Exception {
        return new Drawing(drawMessage.getDrawing());
    }

    /*
        Adds the rooms to the global rooms list.
        This stores the rooms created by users in the global room list.
     */
    @RequestMapping(value = "/addRooms", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody
    String addRooms(
        @RequestBody GameRoom room) throws ParseException, IOException {
        try {
            DrawController.rooms.add(room);
            return "Successfully added rooms";
        } catch (Exception ex) {
            return null;
        }
    }

    /*
        Retrives the rooms from the rooms list.
        Called when updating rooms list.
     */
    @RequestMapping(value="/getRooms", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<GameRoom> getRooms() {
        return DrawController.rooms;
    }

    /*
        Adds a user to the global user list.
        Indicates that a user has logged in to the game.
     */
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody
    String addUser(
        @RequestBody User user) throws ParseException, IOException {
        try {
            DrawController.globalUserList.add(user);
            return "Successfully added user";
        } catch (Exception ex) {
            return null;
        }
    }

}
