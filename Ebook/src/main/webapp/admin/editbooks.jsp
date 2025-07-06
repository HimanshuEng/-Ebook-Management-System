<%@page import="com.model.bookDtls"%>

<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">

<%@ include file="navbar.jsp" %>



<div class="container p-4">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Edit Books</h4>

<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg }</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty falMsg }">
<p class="text-center text-success">${falMsg }</p>
<c:remove var="falMsg" scope="session"/>
</c:if>

<%
int id=Integer.parseInt(request.getParameter("id"));
BookDAOImpl dao=new BookDAOImpl();
bookDtls b=dao.getbookbyId(id);
%>

<form action="../editbookcontroller" method="post" >
<input type="hidden" name="id" value="<%=b.getBookid()%>">
<div class="form-group">
<label for="exampleInputEmail1">Book Name</label>
<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" value="<%=b.getBookname() %>">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Author Name</label>
<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" value="<%=b.getAuthor() %>">
</div>

<div class="form-group">
<label for="exampleInputPassword1">Price</label>
<input name="price" type="number" class="form-control" id="exampleInputPassword1" required="required" value="<%=b.getPrice() %>">
</div>


<div class="form-group">
<label for="inputState">Book Status</label>
<select id="inputSate" name="status" class="form-control">

<%
if("Active".equals(b.getStatus()))
{
%>
<option value="Active">Active</option>
<option value="Inactive">Inactive</option>

<%
}else
{
%>
<option value="Inactive">Inactive</option>
<option value="Active">Active</option>

<%
}
%>

</select>
</div>

<button type="submit" class="btn btn-primary  btn-center">Update</button>

</form>
</div>
</div>
</div>
</div>
</div>

<div style="margin-top: 20px">

</div>

</body>
</html>