/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User;

/**
 *
 * @author Ade Oladejo
 * UserRoleType is an enum class that declares a set of roles a user can have
 */
public enum UserRoleType {
    
    USER("USER"),
    ADMIN("ADMIN");

    String userRoleType;
    
    private UserRoleType(String getUserRoleType) {
        this.userRoleType = getUserRoleType;
    }

    public String getUserRoleType() {
        return userRoleType;
    }

}
