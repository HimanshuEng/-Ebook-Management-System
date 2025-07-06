package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.db.HibernateUtil;
import com.model.bookDtls;

public class BookDAOImpl implements BookDAO {
	public BookDAOImpl() {
	    // Hibernate doesn't need any setup here
	}
	public int addbook(bookDtls b) {
		Transaction tx = null;

		try (Session session = HibernateUtil.getfactory().openSession()) {
			tx = session.beginTransaction();
			session.save(b);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return 0;
		}

	}

	public List<bookDtls> getAllBooks() {

		try (Session session = HibernateUtil.getfactory().openSession()) {

			Query<bookDtls> query = session.createQuery("FROM bookDtls", bookDtls.class);
			return query.list();
		}
	}

	public bookDtls getbookbyId(int id) {

		try (Session session = HibernateUtil.getfactory().openSession()) {
			return session.get(bookDtls.class, id);

		}
	}

//	update book dtls
	public int updateeditbook(bookDtls b) {
		Transaction tx = null;

		try (Session session = HibernateUtil.getfactory().openSession()) {
			tx = session.beginTransaction();
			session.update(b);
			tx.commit();
			return 1;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			if (tx != null)
				tx.rollback();

			e.printStackTrace();
			return 0;
		}

	}

	public int deletebook(int id) {
		Transaction tx = null;
		try(Session session = HibernateUtil.getfactory().openSession()) {
			tx = session.beginTransaction();
			bookDtls book = session.get(bookDtls.class, id);
			if(book!=null) {
				session.delete(book);
				tx.commit();
				return 1; 
				
				}	
			
			return 0 ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 if (tx != null) tx.rollback();
			e.printStackTrace();
			return 0 ;
		}

	
	}

	 public List<bookDtls> getNewBook() {
	        try (Session session = HibernateUtil.getfactory().openSession()) {
	            Query<bookDtls> query = session.createQuery(
	                "FROM bookDtls WHERE bookCategory = 'New' AND status = 'Active' ORDER BY bookid DESC", bookDtls.class);
	            query.setMaxResults(4);
	            return query.list();
	        }
	    }

	 public List<bookDtls> getAllRecentBook() {
	        try (Session session = HibernateUtil.getfactory().openSession()) {
	            Query<bookDtls> query = session.createQuery(
	                "FROM bookDtls WHERE status = 'Active' ORDER BY bookid DESC", bookDtls.class);
	            return query.list();
	        }
	    }

    public List<bookDtls> getoldBook() {
        try (Session session = HibernateUtil.getfactory().openSession()) {
            Query<bookDtls> query = session.createQuery(
                "FROM bookDtls WHERE bookCategory = 'Old' AND status = 'Active' ORDER BY bookid DESC", bookDtls.class);
            query.setMaxResults(4);
            return query.list();
        }
    }


   


	 public List<bookDtls> getAllNewBook() {
	        try (Session session = HibernateUtil.getfactory().openSession()) {
	            Query<bookDtls> query = session.createQuery(
	                "FROM bookDtls WHERE bookCategory = 'New' AND status = 'Active' ORDER BY bookid DESC", bookDtls.class);
	            return query.list();
	        }
	    }

	 public List<bookDtls> getAllOldBook() {
	        try (Session session = HibernateUtil.getfactory().openSession()) {
	            Query<bookDtls> query = session.createQuery(
	                "FROM bookDtls WHERE bookCategory = 'Old' AND status = 'Active' ORDER BY bookid DESC", bookDtls.class);
	            return query.list();
	        }
	    }

	 public List<bookDtls> getBookByOld(String email, String cat) {
	        try (Session session = HibernateUtil.getfactory().openSession()) {
	            Query<bookDtls> query = session.createQuery(
	                "FROM bookDtls WHERE bookCategory = :cat AND email = :email", bookDtls.class);
	            query.setParameter("cat", cat);
	            query.setParameter("email", email);
	            return query.list();
	        }
	    }

	 public int oldBookDelete(String email, String cat, int id) {
	        Transaction tx = null;
	        try (Session session = HibernateUtil.getfactory().openSession()) {
	            tx = session.beginTransaction();
	            Query<?> query = session.createQuery(
	                "DELETE FROM bookDtls WHERE bookCategory = :cat AND email = :email AND bookid = :id");
	            query.setParameter("cat", cat);
	            query.setParameter("email", email);
	            query.setParameter("id", id);
	            int result = query.executeUpdate();
	            tx.commit();
	            return result;
	        } catch (Exception e) {
	            if (tx != null) tx.rollback();
	            e.printStackTrace();
	            return 0;
	        }
	    }

	 public List<bookDtls> getBookBySearch(String ch) {
	        try (Session session = HibernateUtil.getfactory().openSession()) {
	            Query<bookDtls> query = session.createQuery(
	                "FROM bookDtls WHERE (bookname LIKE :ch OR author LIKE :ch OR bookCategory LIKE :ch) AND status = 'Active'",
	                bookDtls.class);
	            query.setParameter("ch", "%" + ch + "%");
	            return query.list();
	        }
	    }

	 public List<bookDtls> getRecentBook() {
		    try (Session session = HibernateUtil.getfactory().openSession()) {
		        Query<bookDtls> query = session.createQuery(
		            "FROM bookDtls WHERE status = 'Active' ORDER BY bookid DESC", bookDtls.class);
		        query.setMaxResults(4);  // recent 4
		        return query.list();
		    }
		}
}
