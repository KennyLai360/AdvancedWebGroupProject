/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User.service;
import com.surrey.com3014.group10.User.model.UserRole;

/**
 *
 * @author maudf_000
 */
public interface UserRoleService {
    UserRole create(UserRole authority);
    UserRole findOne(Long id);
}