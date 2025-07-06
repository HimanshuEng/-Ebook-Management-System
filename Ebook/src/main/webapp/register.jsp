<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Register</title>
<%@include file="allcomponents/allCss.jsp" %>

<style>
    body {
        background: linear-gradient(to right, #6a11cb, #2575fc);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .card {
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        border-radius: 20px;
        animation: fadeIn 1.2s ease;
        transition: transform 0.3s ease;
    }

    .card:hover {
        transform: scale(1.02);
    }

    .btn-primary {
        background: linear-gradient(to right, #4e54c8, #8f94fb);
        border: none;
    }

    .btn-primary:hover {
        background: linear-gradient(to right, #667eea, #764ba2);
    }

    .form-check-label {
        font-size: 14px;
    }

    .text-success, .text-danger {
        font-weight: 600;
    }
</style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card p-4">
                <div class="card-body">
                    <h4 class="text-center pb-2">Registration Page</h4>

                    <c:if test="${not empty succMsg }">
                        <p class="text-center text-success">${ succMsg }</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty falMsg }">
                        <p class="text-center text-danger">${ falMsg }</p>
                        <c:remove var="falMsg" scope="session"/>
                    </c:if>

                    <form action="registercontroller" method="post">
                        <div class="form-group mb-3">
                            <label>Full Name</label>
                            <input type="text" class="form-control" placeholder="Enter full name" required name="name">
                        </div>
                        <div class="form-group mb-3">
                            <label>Email address</label>
                            <input type="email" class="form-control" placeholder="Enter email" required name="email">
                        </div>
                        <div class="form-group mb-3">
                            <label>Phone Number</label>
                            <input type="number" class="form-control" placeholder="Enter phone number" required name="phno">
                        </div>
                        <div class="form-group mb-3">
                            <label>Password</label>
                            <input type="password" class="form-control" placeholder="Enter password" required name="password">
                        </div>
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                            <label class="form-check-label" for="exampleCheck1">I agree to the Terms & Conditions</label>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary w-100">Register</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
