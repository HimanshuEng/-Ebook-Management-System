package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.model.User;

public class HibernateUtil {
    
    private static SessionFactory sessionfactory;
    
    static{
    try {
    	sessionfactory = new Configuration().configure("hibernate.cfg.xml")
    			.addAnnotatedClass(User.class)
    			.buildSessionFactory();
    	
    }catch(Throwable ex) {
    	 throw new ExceptionInInitializerError(ex);
    }	
    
    }
    public static SessionFactory getfactory() {
    	return sessionfactory;
    }
    
}
