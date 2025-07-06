<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books - Admin</title>
<%@ include file="allCss.jsp" %>

<style>
body {
    background-color: #121212;
    color: #f0f0f0;
    font-family: 'Segoe UI', sans-serif;
}

h2 {
    color: #90caf9;
    font-weight: bold;
    text-align: center;
    margin-top: 25px;
}

.table thead {
    background: linear-gradient(to right, #1e3c72, #2a5298);
    color: white;
}

.table tbody tr {
    background-color: #1f1f1f;
    color: #ddd;
}

.table tbody tr:hover {
    background-color: #2c2c2c;
    transition: 0.3s;
}

img.book-thumb {
    width: 50px;
    height: 50px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0,0,0,0.6);
}

.btn-sm {
    padding: 6px 12px;
    font-size: 14px;
}

.btn-primary {
    background-color: #2196f3;
    border: none;
}

.btn-primary:hover {
    background-color: #1976d2;
}

.btn-danger {
    background-color: #f44336;
    border: none;
}

.btn-danger:hover {
    background-color: #c62828;
}

.badge-status {
    padding: 5px 10px;
    border-radius: 12px;
    font-size: 13px;
    font-weight: 500;
    color: white;
}

.badge-active {
    background-color: #4caf50;
}

.badge-inactive {
    background-color: #f44336;
}

.success-msg {
    color: #66bb6a;
    font-weight: bold;
    text-align: center;
}

.error-msg {
    color: #ef5350;
    font-weight: bold;
    text-align: center;
}

.table th, .table td {
    vertical-align: middle !important;
}
</style>
</head>

<body>
<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
</c:if>

<h2> Admin Dashboard All Books</h2>

<c:if test="${not empty succMsg}">
    <div class="success-msg">${succMsg}</div>
    <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty falMsg}">
    <div class="error-msg">${falMsg}</div>
    <c:remove var="falMsg" scope="session"/>
</c:if>

<div class="container mt-4 mb-5">
    <div class="table-responsive">
        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookDAOImpl dao = new BookDAOImpl();
                    List<bookDtls> blst = dao.getAllBooks();
                    for (bookDtls b : blst) {
                %>
                <tr>
                    <td><%= b.getBookid() %></td>
                    <td><img src="../Books/<%= b.getPhoto() %>" class="book-thumb" alt="Book Image"></td>
                    <td><%= b.getBookname() %></td>
                    <td><%= b.getAuthor() %></td>
                    <td><%= b.getPrice() %></td>
                    <td><%= b.getBookCategory() %></td>
                    <td>
                        <span class="badge-status <%= "Active".equals(b.getStatus()) ? "badge-active" : "badge-inactive" %>">
                            <%= b.getStatus() %>
                        </span>
                    </td>
                    <td>
                        <a href="editbooks.jsp?id=<%= b.getBookid() %>" class="btn btn-sm btn-primary" title="Edit Book">
                            <i class="fa-regular fa-pen-to-square"></i> Edit
                        </a>
                        <a href="../deletecontroller?id=<%= b.getBookid() %>" class="btn btn-sm btn-danger" title="Delete Book">
                            <i class="fa-solid fa-trash"></i> Delete
                        </a>
                    </td>
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
