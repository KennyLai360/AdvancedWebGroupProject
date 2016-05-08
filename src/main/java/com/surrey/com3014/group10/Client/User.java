package com.surrey.com3014.group10.Client;

/**
 * Created by KENNY on 03/05/2016.
 */
public class User {

    private long id;
    private String name;
    private long gameRoomId;
    private int state;

    public long getUserId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public long getGameRoomId() {
        return gameRoomId;
    }

    public int getState(){
        return state;
    }

    public User(){
        super();
    }

    public User(long id, String name, int state, long gameRoomId){
        this.id = id;
        this.name = name;
        this.state = state;
        this.gameRoomId = gameRoomId;
    }
}
