package com.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDaoImpl;


/**
 * Servlet implementation class removecartcontroller
 */
public class removecartcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removecartcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		CartDaoImpl dao=new CartDaoImpl();
		int i=dao.deleteBook(bid,uid,cid);
		
		HttpSession session=request.getSession();
		if(i>0)
		{
			session.setAttribute("succMsg", "Book removed from cart");
			response.sendRedirect("checkout.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something went wrong");
			response.sendRedirect("checkout.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
