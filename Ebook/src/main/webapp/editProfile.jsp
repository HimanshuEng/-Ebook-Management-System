<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="allcomponents/allCss.jsp" %>
</head>
<body>
<%@include file="allcomponents/navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="container">
<div class="row p-4">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-primary">Edit Profile</h4>

<c:if test="${not empty falMsg }">
<p class="text-center  text-danger">${falMsg}</p>
<c:remove var="falMsg" scope="session"/>
</c:if>

<c:if test="${not empty succMsg }">
<p class="text-center  text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<form action="UpdateProfile" method="post" >

<input type="hidden" value="${userobj.id }" name="id">

<div class="form-group">
    <label for="exampleInputEmail1">Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter full name" required="required" name="name" value="${userobj.name }">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email" value="${userobj.email }">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Phone Number</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter phone number" required="required" name="phno" value="${userobj.phno }">
    
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password" required="required" name="password">
  </div>
  
  
  <div class="text-center">
  <button type="submit" class="btn btn-primary btn-center">Update</button>
  </div>
  
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top: 10px">

</div>
</body>
</html>