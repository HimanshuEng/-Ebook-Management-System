<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
<%@ include file="allCss.jsp" %>

<style>
body {
    background: linear-gradient(to right, #2c3e50, #4ca1af);
    font-family: 'Segoe UI', sans-serif;
}

.card {
    background-color: #1e1e2f;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0,0,0,0.4);
    color: white;
    padding: 20px;
    margin-top: 50px;
}

.card h4 {
    font-weight: bold;
    margin-bottom: 20px;
}

.form-control, .form-control-file, .form-select {
    background-color: #2c2c3b;
    border: none;
    color: white;
    border-radius: 10px;
    transition: 0.3s;
}

.form-control:focus, .form-select:focus {
    box-shadow: 0 0 5px #00bcd4;
    background-color: #2c2c3b;
    color: white;
}

::placeholder {
    color: #bbb;
}

.btn-primary {
    background: linear-gradient(to right, #00c6ff, #0072ff);
    border: none;
    border-radius: 8px;
    padding: 10px 30px;
    transition: 0.3s ease-in-out;
}

.btn-primary:hover {
    background: linear-gradient(to right, #0072ff, #00c6ff);
    transform: scale(1.05);
}

.text-success, .text-danger {
    font-weight: 600;
}
</style>
</head>

<body>
<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
</c:if>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <h4 class="text-center">📚 Add New Book</h4>

                <!-- Success Message -->
                <c:if test="${not empty succMsg}">
                    <p class="text-center text-success">${succMsg}</p>
                    <c:remove var="succMsg" scope="session" />
                </c:if>

                <!-- Failure Message -->
                <c:if test="${not empty falMsg}">
                    <p class="text-center text-danger">${falMsg}</p>
                    <c:remove var="falMsg" scope="session" />
                </c:if>

                <!-- Form Start -->
                <form action="../BookAdd" method="post" enctype="multipart/form-data">
                    <div class="form-group mb-3">
                        <label>Book Name</label>
                        <input name="bname" type="text" class="form-control" required placeholder="Enter book name">
                    </div>

                    <div class="form-group mb-3">
                        <label>Author Name</label>
                        <input name="author" type="text" class="form-control" required placeholder="Enter author name">
                    </div>

                    <div class="form-group mb-3">
                        <label>Price</label>
                        <input name="price" type="number" class="form-control" required placeholder="Enter price">
                    </div>

                    <div class="form-group mb-3">
                        <label>Book Category</label>
                        <select name="category" class="form-control">
                            <option value="" disabled selected>-- Select Category --</option>
                            <option value="New">New Book</option>
                        </select>
                    </div>

                    <div class="form-group mb-3">
                        <label>Book Status</label>
                        <select name="status" class="form-control">
                            <option value="" disabled selected>-- Select Status --</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>

                    <div class="form-group mb-4">
                        <label>Upload Book Image</label>
                        <input name="bimg" type="file" class="form-control-file" required>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Add Book</button>
                    </div>
                </form>
                <!-- Form End -->

            </div>
        </div>
    </div>
</div>

<div style="margin-top: 30px;"></div>
</body>
</html>
