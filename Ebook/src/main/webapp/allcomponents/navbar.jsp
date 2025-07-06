<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Top Strip -->
<div class="container-fluid" style="height: 10px; background: linear-gradient(to right, #3f51b5, #5c6bc0);">
</div>

<!-- Header Bar -->
<div class="container-fluid py-3 shadow-sm bg-white">
    <div class="row align-items-center">
        <div class="col-md-3 text-primary">
            <h3 class="mb-0"><i class="fa-solid fa-book-open-reader"></i> EBooks</h3>
        </div>

        <div class="col-md-6">
            <form class="d-flex" action="search.jsp">
                <input class="form-control me-2 rounded-pill" type="search" placeholder="Search for books..." name="ch">
                <button class="btn btn-outline-primary rounded-pill" type="submit">Search</button>
            </form>
        </div>

        <div class="col-md-3 text-end">
            <c:choose>
                <c:when test="${not empty userobj}">
                    <a href="checkout.jsp" class="btn btn-outline-dark me-2" title="Cart">
                        <i class="fa-solid fa-cart-plus"></i>
                    </a>
                    <a href="login.jsp" class="btn btn-outline-success me-2">
                        <i class="fa-solid fa-user"></i> ${userobj.name}
                    </a>
                    <a href="logoutcontroller" class="btn btn-primary text-white">
                        <i class="fa-solid fa-right-to-bracket"></i> Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="btn btn-outline-success me-2">
                        <i class="fa-solid fa-user"></i> Login
                    </a>
                    <a href="register.jsp" class="btn btn-primary text-white">
                        <i class="fa-solid fa-user-plus"></i> Register
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to right, #3f51b5, #1a237e);">
    <div class="container">
        <a class="navbar-brand d-lg-none" href="index.jsp">EBooks</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">
                        <i class="fa-solid fa-house"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_newbook.jsp">
                        <i class="fa-solid fa-book"></i> New Books
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_recentbook.jsp">
                        <i class="fa-solid fa-clock-rotate-left"></i> Recent Books
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_oldbook.jsp">
                        <i class="fa-solid fa-book-open"></i> Old Books
                    </a>
                </li>
            </ul>

            <div class="d-flex">
                <a href="setting.jsp" class="btn btn-outline-light me-2">
                    <i class="fa-solid fa-gear"></i> Settings
                </a>
                <a href="helpline.jsp" class="btn btn-outline-light">
                    <i class="fa-solid fa-address-book"></i> Contact Us
                </a>
            </div>
        </div>
    </div>
</nav>
