/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User.service;
import com.surrey.com3014.group10.User.model.User;
import java.util.List;

/**
 *
 * @author maudf_000
 */
public interface UserService {

    User findById(int id);

    User findByUserName(String userName);
    
    void createUser( User user);
    
    
    void deleteUserById(int id);
    
    List<User> listAllUsers();

}
