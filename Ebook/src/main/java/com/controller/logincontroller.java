package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DaoImpl;

import com.model.User;


public class logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public logincontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		DaoImpl dao=new DaoImpl();
		HttpSession session=request.getSession();
		
		
		
		if("admin@gmail.com".equals(email) && "admin".equals(password))
		{
			User us=new User();
			us.setName("Admin");
			session.setAttribute("userobj", us);
			response.sendRedirect("admin/home.jsp");
		}
		else
		{
			User us=dao.login(email, password);
			if(us!=null)
			{
				session.setAttribute("userobj", us);
				response.sendRedirect("index.jsp");
			}
			else
			{
				session.setAttribute("falMsg", "Invalid email or password");
				response.sendRedirect("login.jsp");
			}
		}
	}

}
