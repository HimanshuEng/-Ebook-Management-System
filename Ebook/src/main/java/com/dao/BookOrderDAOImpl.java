package com.dao;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.db.HibernateUtil;
import com.model.Book_Order;

public class BookOrderDAOImpl implements BookOrderDAO {
	
	

	public BookOrderDAOImpl() {
		
	}

	public int getOrderNo() {
		int i=1;
		int orderNo=1;
		
		try (Session session = HibernateUtil.getfactory().openSession()){
			Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Book_Order",Long.class);
			Long count = query.uniqueResult();
			 orderNo = count.intValue() + 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		 return orderNo;
	}

	public boolean saveOrder(List<Book_Order> clist) {
		Transaction tx = null;
		boolean f=false;
		
		try (Session session = HibernateUtil.getfactory().openSession()){
			tx = session.beginTransaction();
			for(Book_Order b :clist) {
				session.save(b);
				
			}
			tx.commit();
			f=true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			if(tx!=null) tx.rollback();
			e.printStackTrace();
		}
		
		
		
		return f;
	}

	public List<Book_Order> getBook(String email) {
		
		try(Session session = HibernateUtil.getfactory().openSession()	) {
			Query<Book_Order> query = session.createQuery(
		            "FROM Book_Order WHERE email = :email", Book_Order.class);
		        query.setParameter("email", email);
		        return query.list();
			
		} 
		
		
		
	
	}

	public List<Book_Order> getAllOrder() {
	    try (Session session = HibernateUtil.getfactory().openSession()) {
	        Query<Book_Order> query = session.createQuery("FROM Book_Order", Book_Order.class);
	        return query.list();
	    }
	}

	
	

}
