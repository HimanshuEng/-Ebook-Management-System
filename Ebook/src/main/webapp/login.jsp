<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ebook : Login</title>
    <%@include file="allcomponents/allCss.jsp" %>
	
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .login-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            animation: fadeIn 1.2s ease-in-out;
            padding: 40px;
            width: 100%;
            max-width: 400px;
        }

        @keyframes fadeIn {
            from {
                transform: translateY(-30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .form-control {
            border-radius: 12px;
        }

        .btn-primary {
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            border: none;
            border-radius: 20px;
            padding: 10px 25px;
            transition: 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
            transform: scale(1.05);
        }

        .text-link {
            color: #5b86e5;
            text-decoration: none;
            font-weight: 500;
        }

        .text-link:hover {
            text-decoration: underline;
        }

        .msg {
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="login-card">

    <h3 class="text-center mb-4">📚 Welcome to Ebook Portal</h3>

    <c:if test="${not empty falMsg }">
        <p class="text-center text-danger msg">${falMsg}</p>
        <c:remove var="falMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty succMsg }">
        <p class="text-center text-success msg">${succMsg}</p>
        <c:remove var="succMsg" scope="session"/>
    </c:if>

    <form action="logincontroller" method="post">
        <div class="form-group mb-3">
            <label for="email">Email address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
        </div>

        <div class="form-group mb-4">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
        </div>
	
        <div class="text-center">
            <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
            <a href="register.jsp" class="text-link">Don't have an account? Register here</a>
        </div>
    </form>
</div>

</body>
</html>
