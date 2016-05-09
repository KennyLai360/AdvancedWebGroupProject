package com.surrey.com3014.group10.controllers;

import com.surrey.com3014.group10.Client.GameRoom;
import com.surrey.com3014.group10.Client.User;
import com.surrey.com3014.group10.User.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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

    @Autowired
    private UserService userService;

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
    public
    @ResponseBody
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
    @RequestMapping(value = "/getRooms", method = RequestMethod.GET)
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
    public
    @ResponseBody
    String addUser(
        @RequestBody com.surrey.com3014.group10.Client.User user) throws ParseException, IOException {
        boolean userExists = false;
        boolean alreadyListed = false;
        try {
            for (com.surrey.com3014.group10.User.model.User userx : userService.listAllUsers()) {
                if (user.getName().equals(userx.getSsoId())) {
                    userExists = true;
                }
            }
            for (User userA : globalUserList) {
                if (user.getName().equals(userA.getName())) {
                    alreadyListed = true;
                }
            }
            if (userExists && !alreadyListed) {
                DrawController.globalUserList.add(user);
                return "Successfully added user";
            } else {
                return null;
            }
        } catch (Exception ex) {
            return null;
        }
    }

    /*
        Retrives user from the global user list.
        Called when updating rooms list.
     */
    @RequestMapping(value = "/getUserList", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<com.surrey.com3014.group10.Client.User> getUserList() {
        return DrawController.globalUserList;
    }

    /*
        Adds a user to the global user list.
        Indicates that a user has logged in to the game.
    */
    @RequestMapping(value = "/removeUser", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    void removeUser(
        @RequestBody String userName) throws ParseException, IOException {
        try {
            for (User userx : DrawController.globalUserList) {
                if (userx.getName().equals(userName)) {
                    DrawController.globalUserList.remove(userx);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /*
        Retrieves user details.
        Called when joined a room.
    */
    @RequestMapping(value = "/getUser", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public User getUser() {
        for (User userx : DrawController.globalUserList) {
            if (userx.getName().equals(getPrincipal())) {
                return userx;
            }
        }
        return null;
    }

    /*
      Adds a user to the global user list.
      Indicates that a user has logged in to the game.
    */
    @RequestMapping(value = "/joinRoom", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    String joinRoom(
        @RequestBody User user) throws ParseException, IOException {
        try {
            // Check if room exists
            for (GameRoom gRoom : DrawController.rooms) {
                if (user.getGameRoomId() == gRoom.getGameRoomId()) {
                    // Check if room is full
                        // Check if user exists
                        for (User userA : DrawController.globalUserList) {
                            // Check if User is in a valid logged in user in the globalUserList.
                            if (user.getName().equals(userA.getName())) {
                                // Check if User is in Game.
                                if (userA.getState() == 0) {
                                    userA.setGameRoomId(gRoom.getGameRoomId());
                                    userA.setState(1);
                                    gRoom.addUser(userA);
                                    return "Successfully added to room data.";
                                } else {
                                    return "User is already in game.";
                                }
                            }
                        }
                    }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    /*
        Retrieves the joined room information.
     */
    @RequestMapping(value = "/getJoinedRoom", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public GameRoom getJoinedRoom() {
        for (User userx: DrawController.globalUserList) {
            if(userx.getName().equals(getPrincipal())){
                for(GameRoom gr : DrawController.rooms){
                    if(gr.getGameRoomId() == userx.getGameRoomId()) {
                        return gr;
                    }
                }
            }
        }
        return null;
    }
    /*
        Adds a user to the global user list.
        Indicates that a user has logged in to the game.
    */
    @RequestMapping(value = "/resetUser", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    void resetUser(
        @RequestBody User user) throws ParseException, IOException {
        try {
            for (User userx : DrawController.globalUserList) {
                if (userx.getName().equals(user.getName())) {
                    userx.setState(0);
                    userx.setGameRoomId(0);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    /*
        Adds a user to the global user list.
        Indicates that a user has logged in to the game.
    */
    @RequestMapping(value = "/updateRoomUserList", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    void updateRooms(
        @RequestBody GameRoom gameroom) throws ParseException, IOException {
        try {
            for (GameRoom gr : DrawController.rooms) {
                if (gr.getGameRoomId() == gameroom.getGameRoomId()) {
                    if(gameroom.getListOfUsers().size() == 0){
                        DrawController.rooms.remove(gr);
                    } else {
                        gr.setListOfUsers(gameroom.getListOfUsers());
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
