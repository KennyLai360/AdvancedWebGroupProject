/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User.dao;

import com.surrey.com3014.group10.User.model.User;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Ade Oladejo
 * 
 */
@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

    /**
     *  Fetches User from database by Id
     * @param id
     * @return User
     */
    public User findById(int id) {
        return getByKey(id);
    }

    /**
     *  Fetches User from database by name
     * @param id
     * @return User
     */
    public User findByUserName(String sso) {
        Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("ssoId", sso));
                System.out.println((User) crit.uniqueResult());
		return (User) crit.uniqueResult();
    }

    /**
     *  Inserts new user to the database
     * @param user
     */
    public void createUser(User user) {
        persist(user);
    }

    /*
     returns a list of Users from the database
    */
    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Criteria criteria = createEntityCriteria();
        return (List<User>) criteria.list();
    }
    
    /*
        Deletes a user from the database by querying their id
    */
   public void deleteUser(int id)
    {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("id", id));
        User user = (User)crit.uniqueResult();
        delete(user);
    }
}
