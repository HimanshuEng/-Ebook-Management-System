package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;

import com.model.bookDtls;

/**
 * Servlet implementation class editbookcontroller
 */
public class editbookcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editbookcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String bookname=request.getParameter("bname");
		String author=request.getParameter("author");
		String price=request.getParameter("price");
		String status=request.getParameter("status");
		
		BookDAOImpl dao=new BookDAOImpl();
		bookDtls b=new bookDtls();
		b.setBookid(id);
		b.setBookname(bookname);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		
		int i=dao.updateeditbook(b);
		HttpSession session=request.getSession();
		
		if(i>0)
		{
			session.setAttribute("succMsg", "Book Updated Successfully");
			response.sendRedirect("admin/allbooks.jsp");
		}
		else
		{
			session.setAttribute("falMsg", "Something went wrong");
			response.sendRedirect("admin/allbooks.jsp");
		}
		
		
	}

}
