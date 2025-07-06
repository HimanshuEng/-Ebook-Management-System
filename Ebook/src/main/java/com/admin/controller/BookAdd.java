package com.admin.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDAOImpl;

import com.model.bookDtls;

/**
 * Servlet implementation class BookAdd
 */
@MultipartConfig
public class BookAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAdd() {
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
		String bookname=request.getParameter("bname");
		String author=request.getParameter("author");
		String price=request.getParameter("price");
		String categories=request.getParameter("category");
		String status=request.getParameter("status");
		Part part=request.getPart("bimg");
		String fileName=part.getSubmittedFileName();
		
	    bookDtls b=new bookDtls();
	    b.setBookname(bookname);
	    b.setAuthor(author);
	    b.setPrice(price);
	    b.setBookCategory(categories);
	    b.setStatus(status);
	    b.setPhoto(fileName);
	    b.setEmail("admin");
	    
	    BookDAOImpl dao=new BookDAOImpl();
	    
	    
	    
	   int i= dao.addbook(b);
	   HttpSession session=request.getSession();
	   
	   if(i>0)
	   { //Code for storing the image in book folder
		   String path=getServletContext().getRealPath("") + "Books";
		    
		    File f=new File(path);
		    part.write(path + File.separator + fileName);
		   // System.out.println(path);
		    //Session Code
		   session.setAttribute("succMsg", "Book added successfully");
		   response.sendRedirect("admin/addbooks.jsp");
		  // System.out.println("Book added successfully");
	   }
	   else
	   {
		   session.setAttribute("falMsg", "Something went wrong");
		   response.sendRedirect("admin/addbooks.jsp");
		   //System.out.println("Something went wrong");
	   }
	    
	}

}
