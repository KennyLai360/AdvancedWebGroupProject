/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User.service;

import com.surrey.com3014.group10.User.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.surrey.com3014.group10.User.model.User;
import java.util.List;

/**
 *
 * @author Ade Oladejo
 * This class is a Service class that handles Database operations
 * 
 */
@Service("userService")
@Transactional // starts a transaction on each method start, and commits it on each method exit
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    /*
       finds User by their id
    */
    public User findById(int id) {
        return dao.findById(id);
    }

    /*
        finds User by their username
    */
    public User findByUserName(String userName) {
        return dao.findByUserName(userName);
    }
    
    /*
        Creates a new User
    */
    public void createUser( User user)
    {
        dao.createUser(user);
    }
    
    /*
        List all users stored in the database
    */
    public List<User> listAllUsers()
    {
        return dao.findAllUsers();
    }
    
    /*
        this method will delete an user by it's id
    */
    public void deleteUserById(int id)
    {
        dao.deleteUser(id);
    }
   
    /*
     * This method will update user's information in the database
     * Since the method is running with Transaction, there's need to call hibernate update explicitly.
     * Just fetch the entity from db and update it with proper values within transaction.
     * It will be updated in db once transaction ends. 
     */
   public void update(User user)
   {
        User entity = dao.findById(user.getId());
        if(entity!=null){
           // game logic
        }
       
   }
    
}

