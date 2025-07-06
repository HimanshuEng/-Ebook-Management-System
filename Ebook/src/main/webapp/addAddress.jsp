<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Address</title>
<%@include file="allcomponents/allCss.jsp" %>

</head>
<body style="background-color: #f0f2f2;">
<%@include file="allcomponents/navbar.jsp" %>

<div class="container">
<div class="row p-4">

<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success p-3">Add Address</h4>
<form action="">
<div class="form-row">

 <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4" >
    </div>

  

    <div class="form-group col-md-6">
      <label for="inputEmail4">LandMark</label>
      <input type="text" class="form-control" id="inputEmail4" >
    </div>
    
     </div>
     
     <div class="form-row">
     
    <div class="form-group col-md-4">
      <label for="inputPassword4">City</label>
      <input type="text" class="form-control" id="inputPassword4" >
    </div>
    
    <div class="form-group col-md-4">
      <label for="inputEmail4">State</label>
      <input type="text" class="form-control" id="inputEmail4" >
    </div>
 
  <div class="form-group col-md-4">
      <label for="inputPassword4">Pincode</label>
      <input type="number" class="form-control" id="inputPassword4" >
    </div>
    
  </div>
 
  
  <div class="text-center ">
  <button class="btn btn-warning text-white">Add Address</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>

<div style="margin-top: 170px">

</div>
</body>
</html>