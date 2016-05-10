/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User;

/**
 *
 * @author Ade Oladejo
 * Medal is an enum class used to represent a set of medals
 * a player can have
 */
public enum Medal {
    
    GOLD("GOLD"),
    SILVER("SILVER"),
    BRONZE("BRONZE"),
    NONE("NONE");

    String medal;
    
    private Medal(String medal) {
        this.medal = medal;
    }

    public String getMedal() {
        return medal;
    }

}
