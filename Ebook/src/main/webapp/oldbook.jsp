<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>

<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Book</title>
<%@include file="allcomponents/allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">

<%@include file="allcomponents/navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty succMsg }">
<div class="alert alert-success text-center">${succMsg }</div>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<div class="alert alert-success text-danger">${failedMsg }</div>
<c:remove var="failedMsg" scope="session"/>
</c:if>


<div class="container p-3">
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  String email=u.getEmail();
  BookDAOImpl dao=new BookDAOImpl();
  List<bookDtls> list=dao.getBookByOld(email, "Old");
  for(bookDtls b:list)
  {
	  %>
	  <tr>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><a href="oldBookDelete?em=<%=email %>&&id=<%=b.getBookid() %>" class="btn btn-sm btn-danger">Delete</a></td>
    </tr>
	  
	  
<% 	  
  }
  %>
  
  
  
    
   
  </tbody>
</table>
</div>

</body>
</html>