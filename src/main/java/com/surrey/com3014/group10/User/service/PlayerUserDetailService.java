/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User.service;

import com.surrey.com3014.group10.User.model.User;
import com.surrey.com3014.group10.User.model.UserRole;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author maudf_000
 */

@Service("playerUserDetailService")
public class PlayerUserDetailService implements UserDetailsService {
    
    @Autowired
    private UserService userService;
     
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String userId )
      throws UsernameNotFoundException {
        User user = userService.findByUserName(userId);
        System.out.println("User : "+user);
        if(user==null){
            System.out.println("User not found");
            throw new UsernameNotFoundException("Username not found");
        }
            return new org.springframework.security.core.userdetails.User(user.getSsoId(), user.getPassword() , getGrantedAuthorities(user));
    }
 
     
    private List<GrantedAuthority> getGrantedAuthorities(User user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
         
        for(UserRole userRole : user.getUserProfiles()){
            System.out.println("UserProfile : "+userRole);
            authorities.add(new SimpleGrantedAuthority("ROLE_"+userRole.getType()));
        }
        System.out.print("authorities :"+authorities);
        return authorities;
    }
     
}
   
