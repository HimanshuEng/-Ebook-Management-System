<%@page import="com.model.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Orders - Admin</title>
<%@ include file="allCss.jsp" %>

<style>
body {
    background-color: #f0f2f2;
    font-family: 'Segoe UI', sans-serif;
}

.table thead {
    background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
    color: white;
    text-align: center;
}

.table tbody tr:nth-child(even) {
    background-color: #e8f0f8;
}

.table tbody tr:hover {
    background-color: #d0e7ff;
    transition: 0.3s;
}

h2 {
    font-weight: bold;
    color: #2c3e50;
}

.badge-payment {
    padding: 5px 10px;
    border-radius: 8px;
    font-size: 13px;
    color: white;
    background-color: #5c6bc0;
}

th, td {
    vertical-align: middle !important;
    font-size: 15px;
}
</style>
</head>

<body>
<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
</c:if>

<h2 class="text-center mt-4 mb-3"> Admin - Customer Orders</h2>

<div class="container mt-3 mb-5">
    <div class="table-responsive">
        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price (₹)</th>
                    <th>Payment</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookOrderDAOImpl dao = new BookOrderDAOImpl();
                    List<Book_Order> list = dao.getAllOrder();
                    for (Book_Order b : list) {
                %>
                <tr>
                    <td><%= b.getOrderId() %></td>
                    <td><%= b.getUsername() %></td>
                    <td><%= b.getEmail() %></td>
                    <td><%= b.getFullAdd() %></td>
                    <td><%= b.getPhno() %></td>
                    <td><%= b.getBookName() %></td>
                    <td><%= b.getAuthor() %></td>
                    <td><%= b.getPrice() %></td>
                    <td><span class="badge-payment"><%= b.getPaymentType() %></span></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
