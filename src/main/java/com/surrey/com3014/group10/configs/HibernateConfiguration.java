/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.configs;

import java.util.Properties;
 
import javax.sql.DataSource;
 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
 
@Configuration // Makes this class a Configuration class
@EnableTransactionManagement // enables Spring’s annotation-driven transaction management capability.
@ComponentScan(basePackages ={ "com.surrey.com3014.group10.configs" } , excludeFilters = { @Filter(type = FilterType.ANNOTATION, value = Configuration.class)})
@PropertySource(value = { "classpath:application.properties" }) // sets the location to the class path containing the Application's properties
public class HibernateConfiguration {
 
    @Autowired
    /* Spring's run time environment */
    private Environment environment; 
 
    /*
        
        Method sessionFactory()creates LocalSessionFactoryBean object and returns it 
        as a bean. This object is used to create sessions and ensure thread safety.
    */
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan(new String[] { "com.surrey.com3014.group10.User.model" });
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
     }
     
    /*
        dataSource() returns a DriverManagerDataSource object as bean.
        This bean  serves as simple replacement for a full-blown connection pool.
        It creates a new Connections on every call.
    */
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.driverClassName"));
        dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
        dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
        dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
        return dataSource;
    }
     
    
    /*
        Method that uses @PropertySource to declare 
        a set of properties(defined in a properties file in application classpath)
    */
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
        return properties;        
    }
     
    /*
        Once the SessionFactory is created, it will be injected into Bean method 
        transactionManager() which may eventually provide 
        transaction support for the sessions created by this sessionFactory
    */
    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(s);
       return txManager;
    }
}