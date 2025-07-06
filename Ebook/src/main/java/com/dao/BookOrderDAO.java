package com.dao;

import java.util.List;

import com.model.Book_Order;

public interface BookOrderDAO {
	
	public int getOrderNo();
	public boolean saveOrder(List<Book_Order> clist);
	public List<Book_Order> getBook(String email);
	public List<Book_Order> getAllOrder();

}
