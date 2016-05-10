package com.surrey.com3014.group10.Client;

/**
 * Created by KENNY on 03/05/2016.
 */
public class User {

    private String name;
    private long gameRoomId;
    private int state;
    private int score;

    public String getName() {
        return name;
    }

    public long getGameRoomId() {
        return gameRoomId;
    }

    public int getState(){
        return state;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public User(){
        super();
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGameRoomId(long gameRoomId) {
        this.gameRoomId = gameRoomId;
    }

    public void setState(int state) {
        this.state = state;
    }

//    public User(long id, String name, int state, long gameRoomId){
//        this.id = id;
//        this.name = name;
//        this.state = state;
//        this.gameRoomId = gameRoomId;
//    }
}
