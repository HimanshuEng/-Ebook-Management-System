<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Old Book</title>
<%@include file="allcomponents/allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="allcomponents/navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="container">
<div class="row mt-4">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-primary p-1">Sell Old Book</h5> 

<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg }</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty falMsg }">
<p class="text-center text-danger">${falMsg }</p>
<c:remove var="falMsg" scope="session"/>
</c:if>

<form action="addOldBook" method="post" enctype="multipart/form-data">
<input type="hidden" value="${userobj.email }" name="user">
<div class="form-group">
<label for="exampleInputEmail1">Book Name</label>
<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Author Name</label>
<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
</div>

<div class="form-group">
<label for="exampleInputPassword1">Price</label>
<input name="price" type="number" class="form-control" id="exampleInputPassword1" required="required">
</div>


<div class="form-group">
<label for="exampleFormControlFile1">Upload Photo</label>
<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1" required="required">
</div>

<div class="text-center">
<button type="submit" class="btn btn-primary">Sell</button>
</div>

</form>
</div>
</div>
</div>
</div>
</div>

<div style="margin-top: 60px">
</div>
</body>
</html>