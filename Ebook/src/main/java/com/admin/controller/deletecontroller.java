package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;


/**
 * Servlet implementation class deletecontroller
 */
public class deletecontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletecontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		BookDAOImpl dao=new BookDAOImpl();
		int i=dao.deletebook(id);
		HttpSession session=request.getSession();
		
		if(i>0)
		{
			session.setAttribute("succMsg", "Book Deleted Successfully");
			response.sendRedirect("admin/allbooks.jsp");
		}
		else
		{
			session.setAttribute("falMsg", "Book Updated Something went wrong");
			response.sendRedirect("admin/allbooks.jsp");
			
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
