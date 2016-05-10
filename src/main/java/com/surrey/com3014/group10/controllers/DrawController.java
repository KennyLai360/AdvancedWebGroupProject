package com.surrey.com3014.group10.controllers;

import com.surrey.com3014.group10.Client.GameRoom;
import com.surrey.com3014.group10.User.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jonny
 */
@RestController
public class DrawController {

    private static List<GameRoom> rooms = new ArrayList<>();
    private static List<com.surrey.com3014.group10.Client.User> globalUserList = new ArrayList<>();

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
            for (com.surrey.com3014.group10.Client.User userA : globalUserList) {
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
        Retrieves user from the global user list.
        Called when updating rooms list.
     */
    @RequestMapping(value = "/getUserList", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<com.surrey.com3014.group10.Client.User> getUserList() {
        return DrawController.globalUserList;
    }

    /*
        Removes the user from the global List.
        This indicates the user has logged out of the game service.
    */
    @RequestMapping(value = "/removeUser", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    void removeUser(
        @RequestBody String userName) throws ParseException, IOException {
        try {
            for (com.surrey.com3014.group10.Client.User userx : DrawController.globalUserList) {
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
        Returns the user object if successfully validated against the database.
    */
    @RequestMapping(value = "/getUser", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public com.surrey.com3014.group10.Client.User getUser() {
        for (com.surrey.com3014.group10.Client.User userx : DrawController.globalUserList) {
            if (userx.getName().equals(getPrincipal())) {
                return userx;
            }
        }
        return null;
    }

    /*
        'Joins' the user into a specific room.
        This method is called when the user attempts to join a room.
        It validates if the room exists and if the user exists from within the system before
        appending the user to the particular room's user list.
    */
    @RequestMapping(value = "/joinRoom", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    String joinRoom(
        @RequestBody com.surrey.com3014.group10.Client.User user) throws ParseException, IOException {
        try {
            // Check if room exists
            for (GameRoom gRoom : DrawController.rooms) {
                if (user.getGameRoomId() == gRoom.getGameRoomId()) {
                    // Check if room is full
                    // Check if user exists
                    for (com.surrey.com3014.group10.Client.User userA : DrawController.globalUserList) {
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
        Checks the information of the room to user has joined and sends it over.
     */
    @RequestMapping(value = "/getJoinedRoom", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public GameRoom getJoinedRoom() {
        for (com.surrey.com3014.group10.Client.User userx : DrawController.globalUserList) {
            if (userx.getName().equals(getPrincipal())) {
                for (GameRoom gr : DrawController.rooms) {
                    if (gr.getGameRoomId() == userx.getGameRoomId()) {
                        return gr;
                    }
                }
            }
        }
        return null;
    }

    /*
        Resets the information of the user.
        Sets the state and gameroom to 0 indicating the user is not in-game and not in a room.
    */
    @RequestMapping(value = "/resetUser", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    void resetUser(
        @RequestBody com.surrey.com3014.group10.Client.User user) throws ParseException, IOException {
        try {
            for (com.surrey.com3014.group10.Client.User userx : DrawController.globalUserList) {
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
       Updates the room information.
       Sets the state of the room and the user list.
    */
    @RequestMapping(value = "/updateRoom", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    void updateRoom(
        @RequestBody GameRoom gameroom) throws ParseException, IOException {
        try {
            // Checks for rooms.
            for (GameRoom gr : DrawController.rooms) {
                if (gr.getGameRoomId() == gameroom.getGameRoomId()) {
                    if (gameroom.getListOfUsers().size() == 0) {
                        DrawController.rooms.remove(gr);
                    } else {
                        gr.setListOfUsers(gameroom.getListOfUsers());
                        gr.setGameState(gameroom.getGameState());
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /*
        Generates a random word and sends the word to the client-side.
        This random word is taken from the list added to the controller.
     */
    @RequestMapping(value = "/getWord", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public String getWord() {
        WordController wc = new WordController();
        wc.randomWord();
        return wc.getWord();
    }

    /*
        POST method that tallys up the scores.
        Recieves the user object of the user and updates the scores in the database.
    */
    @RequestMapping(value = "/tallyScore", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public
    @ResponseBody
    void updateScores(
        @RequestBody com.surrey.com3014.group10.Client.User user) throws ParseException, IOException {
            userService.update(user);

    }
}
