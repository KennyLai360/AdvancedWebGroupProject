/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

/*
    This is a Java based Security configuration class that handles security authentication.
    This configuration creates a Servlet Filter known as the springSecurityFilterChain 
    which is responsible for all the security (protecting the application URLs, 
    validating submitted username and passwords) within our application.
*/
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("playerUserDetailService")
    /* UserDetailService is a spring security class that 
    will be used to pull all credentials from the database */
    UserDetailsService userDetailsService;

    /*
    configureGlobalSecurity configures AuthenticationManagerBuilder 
    with user credentials and allowed roles. 
    This AuthenticationManagerBuilder creates AuthenticationManager 
    which is responsible for processing any authentication request
    */
    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    /*
        The overridden Method configure 
        configures HttpSecurity which allows 
        configuring web based security for specific http requests. 
    */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
       http.authorizeRequests()
        .antMatchers("/", "/home", "/about", "contact", "/login").permitAll()
        .antMatchers("/admin/**").access("hasRole('ADMIN')")
           .antMatchers("/join/**", "/leaderboard").access("hasRole('ADMIN') or hasRole('USER')")
        .antMatchers("/dba/**").access("hasRole('DBA')")
        .and().formLogin().loginPage("/login")
        .usernameParameter("ssoId").passwordParameter("password")
           .defaultSuccessUrl("/join")
        .and().csrf()
        .and().exceptionHandling().accessDeniedPage("/Access_Denied");
    }


}
