package com.surrey.com3014.group10.Client;

/**
 * Created by KENNY on 03/05/2016.
 */
public class User {

    private long id;
    private String name;
    private boolean allowedToDraw;
    private long gameSessionId;


    public long getUserId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void allowedToDraw(boolean value) {
        allowedToDraw = value;
    }

    public long getGameSessionId() {
        return gameSessionId;
    }
}
