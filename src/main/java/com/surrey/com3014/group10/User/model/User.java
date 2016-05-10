package com.surrey.com3014.group10.User.model;

import com.surrey.com3014.group10.User.Medal;
import com.surrey.com3014.group10.User.model.UserRole;
import java.io.Serializable;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

/*
    This is an entity class that ensures that the class User is a persistent entity.
    @author Ade Oladejo
*/
@Entity 
@Table(name = "APP_USER") // Table Annotation explicitiy configures which table the entity is mapped to
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id; // auto generated primary key 

    @Column(name = "SSO_ID", unique = true, nullable = false)
    private String ssoId; // maps user's name to column name on database 

    @Column(name = "PASSWORD", nullable = false)
    private String password; // maps password to column name on database 

    @Column(name = "SCORE", nullable = false)
    private int score; // maps score to column name on database 

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "APP_USER_USER_PROFILE",
        joinColumns = {@JoinColumn(name = "USER_ID")},
        inverseJoinColumns = {@JoinColumn(name = "USER_PROFILE_ID")})
    private Set<UserRole> userProfiles = new HashSet<UserRole>();

    @Column(name = "MEDAL", nullable = false)
    @Enumerated(EnumType.STRING)
    private Medal medal = Medal.NONE; 

    @Enumerated(EnumType.STRING)
    public Medal getMedal() {
        return this.medal;
    }

    public void setMedal(Medal medal) {
        this.medal = medal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSsoId() {
        return ssoId;
    }

    public void setSsoId(String ssoId) {
        this.ssoId = ssoId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<UserRole> getUserProfiles() {
        return userProfiles;
    }

    public void setUserProfiles(Set<UserRole> userProfiles) {
        this.userProfiles = userProfiles;
    }

    public int getScore() {
        return this.score;
    }

    public void setScore(int score) {
        this.score = score;
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        result = prime * result + ((ssoId == null) ? 0 : ssoId.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (!(obj instanceof User))
            return false;
        User other = (User) obj;
        if (id != other.id)
            return false;
        if (ssoId == null) {
            if (other.ssoId != null)
                return false;
        } else if (!ssoId.equals(other.ssoId))
            return false;
        return true;
    }

     /*
    Overided To String method to display user information
    */
    @Override
    public String toString() {
        return "User [id=" + id + ", ssoId=" + ssoId + ", password=" + password
            + ", userProfiles=" + userProfiles + "]";
    }


}
