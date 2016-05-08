/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User.dao;

import com.surrey.com3014.group10.User.model.User;
import java.util.List;

/**
 *
 * @author Ade Oladejo
 * Interface class that provides a list of Data Access Object operations.
 */
public interface UserDao {

    User findById(int id);

    User findByUserName(String username);

    void createUser(User user);

    List<User> findAllUsers();

   void deleteUser(int id);
   
}
