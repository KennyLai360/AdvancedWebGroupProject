package com.surrey.com3014.group10.controllers;

import java.util.ArrayList;

/**
 * Created by Xyline on 07/05/2016.
 */
public class GameList {

    private ArrayList<String> rooms = new ArrayList<>();

    public GameList() {

    }

    public void addRoom(String room) {
        rooms.add(room);
    }

    public void setRooms(ArrayList<String> rooms) {
        this.rooms = rooms;
    }

    public ArrayList<String> getRooms() {
        return rooms;
    }
}
