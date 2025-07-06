<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting Page</title>
<%@include file="allcomponents/allCss.jsp" %>
<style>
body {
    background: linear-gradient(to right, #e0eafc, #cfdef3);
    font-family: 'Segoe UI', sans-serif;
}

a {
    text-decoration: none;
    color: inherit;
}

.card {
    border: none;
    border-radius: 12px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    background: #fff;
}

.card:hover {
    transform: scale(1.03);
    box-shadow: 0 4px 20px rgba(0,0,0,0.15);
}

.card-body i {
    margin-bottom: 10px;
}

h3.text-center {
    font-weight: 600;
    color: #333;
    margin-bottom: 30px;
    background: linear-gradient(to right, #fc466b, #3f5efb);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
</style>
</head>
<body>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>

<%@include file="allcomponents/navbar.jsp" %>

<div class="container p-3">
    <h3 class="text-center">Welcome, ${userobj.name} 	</h3>

    <div class="row p-4">
        <!-- Sell Book -->
        <div class="col-md-4 mb-4">
            <a href="sellOldBook.jsp">
                <div class="card text-center p-3">
                    <div class="card-body">
                        <div class="text-primary">
                            <i class="fa-solid fa-book-open fa-2x"></i>
                        </div>
                        <h4>Sell Books</h4>
                    </div>
                </div>
            </a>
        </div>

        <!-- Old Books -->
        <div class="col-md-4 mb-4">
            <a href="oldbook.jsp">
                <div class="card text-center p-3">
                    <div class="card-body">
                        <div class="text-info">
                            <i class="fa-solid fa-layer-group fa-2x"></i>
                        </div>
                        <h4>Old Books</h4>
                    </div>
                </div>
            </a>
        </div>

        <!-- Edit Profile -->
        <div class="col-md-4 mb-4">
            <a href="editProfile.jsp">
                <div class="card text-center p-3">
                    <div class="card-body">
                        <div class="text-warning">
                            <i class="fa-regular fa-pen-to-square fa-2x"></i>
                        </div>
                        <h4>Edit Profile</h4>
                    </div>
                </div>
            </a>
        </div>

        <!-- Orders -->
        <div class="col-md-6 mb-4">
            <a href="order.jsp">
                <div class="card text-center p-3">
                    <div class="card-body">
                        <div class="text-danger">
                            <i class="fa-solid fa-box-open fa-2x"></i>
                        </div>
                        <h4>Order</h4>
                        <p>Track your order</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- Help Center -->
        <div class="col-md-6 mb-4">
            <a href="helpline.jsp">
                <div class="card text-center p-3">
                    <div class="card-body">
                        <div class="text-success">
                            <i class="fa-solid fa-headset fa-2x"></i>
                        </div>
                        <h4>Help Center</h4>
                        <p>24/7 Support</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<div style="margin-top: 80px;"></div>
</body>
</html>
