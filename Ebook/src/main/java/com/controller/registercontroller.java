package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DaoImpl;

import com.model.User;


public class registercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public registercontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phno=request.getParameter("phno");
		String password=request.getParameter("password");
		String check=request.getParameter("check");
		
	
       User us=new User();
       us.setName(name);
       us.setEmail(email);
       us.setPhno(phno);
       us.setPassword(password);
       
       HttpSession session=request.getSession();
       
       if(check!=null)
		{
			DaoImpl dao=new DaoImpl();
			boolean f=dao.checkUser(email);
			if(f)
			{
				int i=dao.userRegister(us);
				
				if(i>0)
				{
					//System.out.println("User register successfully");
					session.setAttribute("succMsg", "Register Successfully");
					response.sendRedirect("register.jsp");
				}
				else
				{
					//System.out.println("Not register successfully");
					session.setAttribute("falMsg", "Something went wrong");
					response.sendRedirect("register.jsp");
				}
			}
			else
			{
				session.setAttribute("falMsg", "User already exist try with another email id");
				response.sendRedirect("register.jsp");
				
			}
			
		}
		else
		{
			//System.out.println("Please agree terms and conditions");
			session.setAttribute("falMsg", "Please agree terms & conditions");
			response.sendRedirect("register.jsp");
		}
		
	}

}
