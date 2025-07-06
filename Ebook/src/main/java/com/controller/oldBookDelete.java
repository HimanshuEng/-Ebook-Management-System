package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;


/**
 * Servlet implementation class oldBookDelete
 */
public class oldBookDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public oldBookDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String em=request.getParameter("em");
		int id=Integer.parseInt(request.getParameter("id"));
		
		BookDAOImpl dao=new BookDAOImpl();
		int i=dao.oldBookDelete(em, "Old",id);
		
		HttpSession session=request.getSession();
		if(i>0)
		{
			session.setAttribute("succMsg", " Old book deleted successfully");
			response.sendRedirect("oldbook.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something went wrong");
			response.sendRedirect("oldbook.jsp");
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
