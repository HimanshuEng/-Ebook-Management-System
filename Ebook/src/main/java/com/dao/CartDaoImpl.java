package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.db.HibernateUtil;
import com.model.Cart;


public class CartDaoImpl implements CartDao {

    @Override
    public int addCart(Cart c) {
        int result = 0;
        Transaction tx = null;

        try (Session session = HibernateUtil.getfactory().openSession()) {
            tx = session.beginTransaction();
            session.save(c);
            tx.commit();
            result = 1;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            return 0;
        }

        return result;
    }

    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<Cart>();

        try (Session session = HibernateUtil.getfactory().openSession()) {
            Query<Cart> query = session.createQuery("from Cart where uid = :uid", Cart.class);
            query.setParameter("uid", userId);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    @Override
    public int deleteBook(int bid, int uid, int cid) {
        int result = 0;
        Transaction tx = null;

        try (Session session = HibernateUtil.getfactory().openSession()) {
            tx = session.beginTransaction();

            Query<?> query = session.createQuery(
                "DELETE FROM Cart WHERE bid = :bid AND uid = :uid AND cid = :cid");
            query.setParameter("bid", bid);
            query.setParameter("uid", uid);
            query.setParameter("cid", cid);

            result = query.executeUpdate();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }

        return result;
    }
}
