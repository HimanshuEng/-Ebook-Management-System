<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.CartDaoImpl" %>
<%@ page import="com.model.Cart" %>
<%@ page import="com.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout | EBook Store</title>
    <%@include file="allcomponents/allCss.jsp" %>

    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e0f7fa);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
        }

        .text-success {
            color: #388e3c !important;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn-warning {
            background: linear-gradient(to right, #f9a825, #fdd835);
            color: #000;
            font-weight: bold;
            border: none;
        }

        .btn-success {
            background: linear-gradient(to right, #43a047, #66bb6a);
            color: white;
            font-weight: bold;
        }

        .btn-danger {
            background-color: #e53935;
            border: none;
        }

        .form-control {
            border-radius: 10px;
        }

        .card-title {
            font-weight: 600;
            font-size: 22px;
            margin-bottom: 15px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f1f8e9;
        }

        .btn:focus {
            box-shadow: none;
        }

        .alert {
            font-weight: bold;
        }
    </style>
</head>

<body>
<%@include file="allcomponents/navbar.jsp" %>

<%
    User u = (User) session.getAttribute("userobj");
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CartDaoImpl dao = new CartDaoImpl();
    List<Cart> cartList = dao.getBookByUser(u.getId());
    request.setAttribute("list", cartList);
%>

<div class="container py-4">
    <div class="row g-4">
        <!-- Cart Section -->
        <div class="col-md-6">
            <div class="card p-3">
                <h4 class="card-title text-success text-center">📚 Your Selected Books</h4>
                <table class="table table-striped">
                    <thead class="table-success">
                        <tr>
                            <th>Book Name</th>
                            <th>Author</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="totalPrice" value="0.0" />
                        <c:forEach var="c" items="${list}">
                            <tr>
                                <td>${c.bookName}</td>
                                <td>${c.author}</td>
                                <td>₹ ${c.price}</td>
                                <td>
                                    <a href="removecartcontroller?bid=${c.bid}&uid=${c.uid}&cid=${c.cid}" class="btn btn-sm btn-danger">Remove</a>
                                </td>
                            </tr>
                            <c:set var="totalPrice" value="${totalPrice + c.price}" />
                        </c:forEach>
                        <tr class="table-warning fw-bold">
                            <td colspan="2">Total Price</td>
                            <td colspan="2">₹ ${totalPrice}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Order Details Section -->
        <div class="col-md-6">
            <div class="card p-4">
                <h4 class="card-title text-success text-center">📝 Your Details For Order</h4>
                <form action="OrderBookController" method="post">
                    <input type="hidden" name="id" value="${userobj.id}">

                    <div class="row mb-3">
                        <div class="col">
                            <label>Name</label>
                            <input type="text" name="username" class="form-control" value="${userobj.name}" required>
                        </div>
                        <div class="col">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="${userobj.email}" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label>Mobile Number</label>
                            <input type="number" name="phno" class="form-control" value="${userobj.phno}" required>
                        </div>
                        <div class="col">
                            <label>Address</label>
                            <input type="text" name="address" class="form-control" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label>Landmark</label>
                            <input type="text" name="landmark" class="form-control" required>
                        </div>
                        <div class="col">
                            <label>City</label>
                            <input type="text" name="city" class="form-control" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label>State</label>
                            <input type="text" name="state" class="form-control" required>
                        </div>
                        <div class="col">
                            <label>Pincode</label>
                            <input type="number" name="pincode" class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Payment Type</label>
                        <select class="form-control" name="payment">
                            <option value="noselect">----select----</option>
                            <option value="COD">Cash On Delivery</option>
                        </select>
                    </div>

                    <div class="text-center">
                        <button class="btn btn-warning me-2">Order Now</button>
                        <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
