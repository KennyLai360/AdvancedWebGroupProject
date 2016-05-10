package com.surrey.com3014.group10.Client;

import java.util.ArrayList;

/**
 * Created by KENNY on 03/05/2016.
 */
public class GameRoom {
    private long gameRoomId;
    private String gameRoomName;
    private ArrayList<User> listOfUsers;
    private int numberOfRounds;
    private int gameState;

    public GameRoom() {
        super();
    }

//    public GameRoom(long gameRoomId, String gameRoomName, int numberOfRounds) {
//        super();
//        this.gameRoomId = gameRoomId;
//        this.gameRoomName = gameRoomName;
//        this.numberOfRounds = numberOfRounds;
//        this.listOfUsers = new ArrayList<>();
//    }

    public long getGameRoomId() {
        return gameRoomId;
    }

    public void setGameRoomId(long gameRoomId) {
        this.gameRoomId = gameRoomId;
    }

    public String getGameRoomName() {
        return gameRoomName;
    }

    public void setGameRoomName(String gameRoomName) {
        this.gameRoomName = gameRoomName;
    }

    public void setListOfUsers(ArrayList<User> listOfUsers) {
        this.listOfUsers = listOfUsers;
    }

    public ArrayList<User> getListOfUsers() {
        return listOfUsers;
    }

    public int getNumberOfRounds() {
        return numberOfRounds;
    }

    public void setNumberOfRounds(int numberOfRounds) {
        this.numberOfRounds = numberOfRounds;
    }

    public void addUser(User user) {
        if (listOfUsers.size() < 4) {
            listOfUsers.add(user);
        }
        else {
            //Room full
        }
    }

    public int getGameState() {
        return gameState;
    }

    public void setGameState(int gameState) {
        this.gameState = gameState;
    }
}
