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
import java.util.Collection;
import java.util.List;

/**
 *
 * @author maudf_000
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    public User findById(int id) {
        return dao.findById(id);
    }

    public User findByUserName(String userName) {
        return dao.findByUserName(userName);
    }
    
    public void createUser( User user)
    {
        dao.createUser(user);
    }
    
    public List<User> listAllUsers()
    {
        return dao.findAllUsers();
    }
    
    public void deleteUserById(int id)
    {
        dao.deleteUser(id);
    }
    
     public void update(int id)
   {
       dao.update(id);
   }
   
   public void update(String username)
   {
       dao.update(username);
   }
    
}

