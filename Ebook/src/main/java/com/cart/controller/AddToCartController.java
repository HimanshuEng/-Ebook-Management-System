package com.cart.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.CartDaoImpl;
import com.model.Cart;

public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();

		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			String bookName = req.getParameter("bookName");
			String author = req.getParameter("author");
			double price = Double.parseDouble(req.getParameter("price"));

			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(bookName);
			c.setAuthor(author);
			c.setPrice(price);
			c.setTotalPrice(price);

			CartDaoImpl dao = new CartDaoImpl();
			int i = dao.addCart(c);

			if (i == 1) {
				session.setAttribute("succMsg", "Book added to cart");
			} else {
				session.setAttribute("failedMsg", "Failed to add book to cart");
			}

			res.sendRedirect("all_new_book.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("failedMsg", "Something went wrong");
			res.sendRedirect("all_new_book.jsp");
		}
	}
}
