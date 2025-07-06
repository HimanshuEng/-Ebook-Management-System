<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<%@ include file="allCss.jsp" %>

<style>
body {
    background: #121212;
    font-family: 'Segoe UI', sans-serif;
    color: #f1f1f1;
}

a {
    text-decoration: none;
    color: inherit;
}

.card {
    background: linear-gradient(135deg, #2c3e50, #4ca1af);
    color: white;
    border: none;
    border-radius: 15px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 0 25px rgba(0,0,0,0.6);
}

.card i {
    font-size: 2.5rem;
    margin-bottom: 10px;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.15); }
    100% { transform: scale(1); }
}

.modal-content {
    background-color: #2c2c2c;
    color: #f1f1f1;
    border-radius: 10px;
}

.modal-header, .modal-body, .modal-footer {
    border: none;
}

.btn-primary {
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    border: none;
}

.btn-primary:hover {
    background: linear-gradient(to right, #ff4b2b, #ff416c);
}

.btn-secondary {
    background-color: #555;
    border: none;
}
</style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<div class="container mt-5">
    <h2 class="text-center p-3 text-white">Hello Admin</h2>

    <div class="row p-4">
        <!-- Add Books -->
        <div class="col-md-3 mb-4">
            <a href="addbooks.jsp">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="fa-solid fa-book-medical text-warning"></i>
                        <h4>Add Books</h4>
                        <hr style="background-color: white;">
                    </div>
                </div>
            </a>
        </div>

        <!-- All Books -->
        <div class="col-md-3 mb-4">
            <a href="allbooks.jsp">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="fa-solid fa-book-open text-success"></i>
                        <h4>All Books</h4>
                        <hr style="background-color: white;">
                    </div>
                </div>
            </a>
        </div>

        <!-- Orders -->
        <div class="col-md-3 mb-4">
            <a href="order.jsp">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="fa-solid fa-box-open text-info"></i>
                        <h4>Orders</h4>
                        <hr style="background-color: white;">
                    </div>
                </div>
            </a>
        </div>

        <!-- Logout -->
        <div class="col-md-3 mb-4">
            <a data-toggle="modal" data-target="#exampleModalCenter">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="fa-solid fa-right-from-bracket text-danger"></i>
                        <h4>Logout</h4>
                        <hr style="background-color: white;">
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body text-center">
        <h4>Do you want to logout?</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logoutcontroller" class="btn btn-primary text-white">LogOut</a>
      </div>
    </div>
  </div>
</div>

<div style="margin-top: 150px;"></div>
</body>
</html>
