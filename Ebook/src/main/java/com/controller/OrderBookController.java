package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderDAOImpl;
import com.dao.CartDaoImpl;

import com.model.Book_Order;
import com.model.Cart;
//import com.model.cart;

/**
 * Servlet implementation class OrderBookController
 */
public class OrderBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderBookController() {
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
		HttpSession session=request.getSession();
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("username");
		String email=request.getParameter("email");
		String phno=request.getParameter("phno");
		String address=request.getParameter("address");
		String landmark=request.getParameter("landmark");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pincode=request.getParameter("pincode");
		String paymentType=request.getParameter("payment");
		
		String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
		
		//System.out.println(name+""+email+""+phno+""+fullAdd+""+paymentType);
		
		CartDaoImpl dao=new CartDaoImpl();
		List<Cart> clist=dao.getBookByUser(id);
		if(clist.isEmpty())
		{
			session.setAttribute("failedMsg","Your cart is empty");
			response.sendRedirect("checkout.jsp");
		}
		else
		{
			BookOrderDAOImpl dao2=new BookOrderDAOImpl();
			int i=dao2.getOrderNo();
			Book_Order o=null;
			ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
			for(Cart c:clist)
			{
				o=new Book_Order();
				o.setOrderId("BOOK-ORD-00"+i);
				o.setUsername(name);
				o.setEmail(email);
				o.setPhno(phno);
				o.setFullAdd(fullAdd);
				o.setBookName(c.getBookName());
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice()+"");
				o.setPaymentType(paymentType);
				orderList.add(o);
				i++;
				
			}
			
			if("noselect".equals(paymentType))
			{
				session.setAttribute("Msg", "Please select payment method");
				response.sendRedirect("checkout.jsp");
			}
			else
			{
				boolean f=dao2.saveOrder(orderList);
				if(f==true)
				{
					response.sendRedirect("orderSuccess.jsp");
					//System.out.println("Order Successfully");
				}
				else
				{
					//System.out.println("Order Failed");
					session.setAttribute("failedMsg", "Order Failed");
					response.sendRedirect("checkout.jsp");
				}
			}
		}
	}

}
