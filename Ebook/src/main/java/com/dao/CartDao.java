package com.dao;

import java.util.List;

import com.model.Cart;


public interface CartDao {
	public int addCart(Cart c);
	public List<Cart> getBookByUser(int uid);
	public int deleteBook(int bid,int uid,int cid);

}
