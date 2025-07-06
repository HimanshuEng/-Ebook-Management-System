<%@page import="com.dao.BookOrderDAOImpl"%>
<%@page import="com.dao.BookOrderDAO"%>
<%@page import="com.model.Book_Order"%>
<%@page import="java.util.List"%>

<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Page</title>
<%@include file="allcomponents/allCss.jsp" %>
</head>
<body>
<%@include file="allcomponents/navbar.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<div class="container p-1">
<h3 class="text-center text-primary p-3">Your Order</h3>
<table class="table table-striped mt-5">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  BookOrderDAOImpl dao=new BookOrderDAOImpl();
  List<Book_Order> list=dao.getBook(u.getEmail());
  
  for(Book_Order b:list)
  {
  %>
    <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr>
    
    <%} %>
   
  </tbody>
</table>
</div>

<div style="margin-top: 300px">
</div>
</body>
</html>