package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.db.HibernateUtil;
import com.model.User;

public class DaoImpl implements UserDAO {
	
	

	public DaoImpl() {
		
	}
//	User registration
	public int userRegister(User us) {
		Transaction tx = null;
		try(Session session=HibernateUtil.getfactory().openSession()){
			tx=session.beginTransaction();
			session.save(us);
			tx.commit();
			return 1;
		}catch(Exception e) {
			if (tx != null) tx.rollback();
            e.printStackTrace();
            return 0;
    		 
		}
		
	}

	public User login(String email, String password) {
		User user=null;
		
		try(Session session = HibernateUtil.getfactory().openSession()) {
			String hql = "From User Where email =:email AND password =:password";
			Query<User> query = session.createQuery(hql,User.class);
			query.setParameter("email", email);
			query.setParameter("password", password);
			
			user = query.uniqueResult();			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return user;
		
	}

//	public int checkPassword(int id, String ps) {
//		int i=0;
//		
//		try {
//			String sql="select * from users where id=? and password=?";
//			PreparedStatement pstate=conn.prepareStatement(sql);
//			pstate.setInt(1, id);
//			pstate.setString(2,ps);
//			ResultSet rs=pstate.executeQuery();
//			while(rs.next())
//			{
//				i=1;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		
//		return i;
//	}

//	public int updateProfile(User us) {
//int i=0;
//		
//		try {
//			String sql="update users set name=? , email=? , phno=? where id=?";
//			PreparedStatement ps=conn.prepareStatement(sql);
//			ps.setString(1, us.getName());
//			ps.setString(2, us.getEmail());
//			ps.setString(3, us.getPhno());
//			ps.setInt(4, us.getId());
//			 i=ps.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		
//		return i;
//		
//	}

	public boolean checkUser(String email) {
		try(Session session = HibernateUtil.getfactory().openSession()){
			Query<User> query = session.createQuery("FROM User WHERE email= :email",User.class); 
			query.setParameter("email", email);
			User user = query.uniqueResult();
			return user == null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

			}


	public boolean checkPassword(int userId, String password) {
	    try (Session session = HibernateUtil.getfactory().openSession()) {
	        User user = session.get(User.class, userId);
	        return user != null && user.getPassword().equals(password);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public boolean updateProfile(User user) {
	    Transaction tx = null;
	    try (Session session = HibernateUtil.getfactory().openSession()) {
	        tx = session.beginTransaction();
	        session.update(user);
	        tx.commit();
	        return true;
	    } catch (Exception e) {
	        if (tx != null) tx.rollback();
	        e.printStackTrace();
	        return false;
	    }
	}
	

	
	
	}
	
	


