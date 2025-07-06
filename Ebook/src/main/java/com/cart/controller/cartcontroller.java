package com.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;
import com.dao.CartDaoImpl;
import com.model.User;
import com.model.bookDtls;
import com.model.Cart;
//
//
//@WebServlet("/cartcontroller")
public class cartcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public cartcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = (User) request.getSession().getAttribute("userobj");
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }
		
        int bid = Integer.parseInt(request.getParameter("bid"));
        int uid = Integer.parseInt(request.getParameter("uid"));

        // Fetch book details (to get name, price, etc.)
        BookDAOImpl bdao = new BookDAOImpl();
        bookDtls book = bdao.getbookbyId(bid);

        Cart c = new Cart();
        c.setBid(bid);
        c.setUid(uid);
        c.setBookName(book.getBookname());
        c.setAuthor(book.getAuthor());
        double price = Double.parseDouble(book.getPrice());
        c.setPrice(price);
        c.setTotalPrice(price); 

        CartDaoImpl dao = new CartDaoImpl();
        int i = dao.addCart(c);
        
        System.out.println("Cart added status: " + i);
        System.out.println("Cart Details: ");
        System.out.println("Book ID: " + c.getBid());
        System.out.println("User ID: " + c.getUid());
        System.out.println("Book Name: " + c.getBookName());
        System.out.println("Author: " + c.getAuthor());
        System.out.println("Price: " + c.getPrice());
        System.out.println("Total Price: " + c.getTotalPrice());


        HttpSession session = request.getSession();
        if (i > 0) {
            session.setAttribute("addCart", "Book added to cart");
        } else {
            session.setAttribute("addCart", "Something went wrong");
        }
        System.out.println("Cart added: " + i); // should print 1

        response.sendRedirect("index.jsp");
    }

	

}
