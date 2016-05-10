/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.User.model;

/**
 *
 * @author maudf_000
 */
import com.surrey.com3014.group10.User.UserRoleType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER_PROFILE")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;  // auto generated primary key 

    @Column(name = "TYPE", length = 15, unique = true, nullable = false)
    private String type = UserRoleType.USER.getUserRoleType(); // maps user's role type to column name on database 

    /*
        gets UserRole's id
    */
    public int getId() {
        return id;
    }

    /*
        sets UserRole's id
    */
    public void setId(int id) {
        this.id = id;
    }

    /*
        gets UserRole's access type
    */
    public String getType() {
        return type;
    }

    /*
        sets UserRole's access type
    */
    public void setType(String type) {
        this.type = type;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        result = prime * result + ((type == null) ? 0 : type.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof UserRole)) {
            return false;
        }
        UserRole other = (UserRole) obj;
        if (id != other.id) {
            return false;
        }
        if (type == null) {
            if (other.type != null) {
                return false;
            }
        } else if (!type.equals(other.type)) {
            return false;
        }
        return true;
    }

    /*
    Overided To String method to display UserRole information
    */
    @Override
    public String toString() {
        return "UserProfile [id=" + id + ",  type=" + type + "]";
    }

}
