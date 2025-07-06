<%@page import="com.model.User"%>
<%@page import="com.model.bookDtls"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<%@include file="allcomponents/allCss.jsp" %>

<style>
body {
    background: linear-gradient(to right, #e0eafc, #cfdef3);
    font-family: 'Segoe UI', sans-serif;
}

.container {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.card-img {
    width: 180px;
    height: 250px;
    border-radius: 10px;
    transition: transform 0.3s ease;
}

.card-img:hover {
    transform: scale(1.05);
}

h4 span {
    color: #28a745;
    font-weight: 600;
}

.features i {
    color: #dc3545;
}

.btn-gradient {
    background: linear-gradient(to right, #fc5c7d, #6a82fb);
    border: none;
    color: white;
    transition: 0.3s ease;
}

.btn-gradient:hover {
    background: linear-gradient(to right, #6a82fb, #fc5c7d);
    color: #fff;
}

.btn-price {
    background-color: #ff6b6b;
    color: white;
    font-weight: 600;
    border: none;
}
</style>
</head>
<body>

<%@include file="allcomponents/navbar.jsp" %>

<%
User u = (User)session.getAttribute("userobj");
if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}

int bid = Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao = new BookDAOImpl();
bookDtls b = dao.getbookbyId(bid);
%>

<div class="container p-5 mt-4">
    <div class="row">
        <!-- Book Image and Info -->
     <div class="col-md-6">
    <div class="card shadow p-4">
        <div class="text-center">
            <img src="Books/<%= b.getPhoto() %>" class="card-img mb-3" alt="Book Cover" style="width: 180px; height: 250px; border-radius: 10px;">
            <h4> Book: <span class="text-success"><%= b.getBookname() %></span></h4>
            <h4> Author: <span class="text-primary"><%= b.getAuthor() %></span></h4>
            <h4> Category: <span class="text-info"><%= b.getBookCategory() %></span></h4>
        </div>
    </div>
</div>


        <!-- Details & Actions -->
        <div class="col-md-6 text-center">
            <h2 class="mb-4 text-primary"><%= b.getBookname() %></h2>

            <% if ("Old".equals(b.getBookCategory())) { %>
                <h5 class="text-primary">Contact Seller:</h5>
                <p class="text-primary"><i class="fa-solid fa-envelope"></i> <%= b.getEmail() %></p>
            <% } %>

            <div class="row my-3 features">
                <div class="col-md-4 text-center">
                    <i class="fa-solid fa-money-bill-wave fa-2x mb-1"></i>
                    <p>Cash On Delivery</p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fa-solid fa-rotate-right fa-2x mb-1"></i>
                    <p>Return Available</p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fa-solid fa-truck-fast fa-2x mb-1"></i>
                    <p>Free Shipping</p>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="text-center mt-4">
                <% if ("Old".equals(b.getBookCategory())) { %>
                    <a href="index.jsp" class="btn btn-gradient btn-sm m-2">
                        <i class="fa-solid fa-cart-plus"></i> Continue Shopping
                    </a>
                    <span class="btn btn-price btn-sm m-2">
                        <i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %>
                    </span>
                <% } else { %>
                    <% if (u == null) { %>
                        <a href="login.jsp" class="btn btn-primary btn-sm m-2">
                            <i class="fa-solid fa-cart-plus"></i> Add To Cart
                        </a>
                    <% } else { %>
                        <a href="cartcontroller?bid=<%= b.getBookid() %>&uid=<%= u.getId() %>" class="btn btn-gradient btn-sm m-2">
                            <i class="fa-solid fa-cart-plus"></i> Add To Cart
                        </a>
                    <% } %>
                    <span class="btn btn-price btn-sm m-2">
                        <i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %>
                    </span>
                <% } %>
            </div>
        </div>
    </div>
</div>

</body>
</html>
