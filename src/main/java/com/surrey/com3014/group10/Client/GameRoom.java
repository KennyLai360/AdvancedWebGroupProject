package com.surrey.com3014.group10.Client;

import org.springframework.security.core.userdetails.User;

/**
 * Created by KENNY on 03/05/2016.
 */
public class GameRoom {
    private long gameRoomId;
    private int gameRoomNumber;
    private User[] listOfUsers;

    public GameRoom(long gameRoomId, int gameRoomNumber) {
        super();
        this.gameRoomId = gameRoomId;
        this.gameRoomNumber = gameRoomNumber;
        this.listOfUsers = new User[4];
    }

}
