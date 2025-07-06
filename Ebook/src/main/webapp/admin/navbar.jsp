<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Top Gradient Strip -->
<div class="container-fluid" style="height: 10px; background: linear-gradient(to right, #6a11cb, #2575fc);">
</div>

<!-- Navbar Top -->
<div class="container-fluid py-3" style="background-color: #1a1a2e; color: white;">
  <div class="row align-items-center">
    <div class="col-md-3">
      <h3 class="text-white"><i class="fa-solid fa-book-open-reader"></i> EBooks</h3>
    </div>

    <div class="col-md-6 text-center">
      <nav class="navbar navbar-expand-lg navbar-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item active px-2">
              <a class="nav-link" href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
            </li>
            <!-- Add more menu items here -->
          </ul>
        </div>
      </nav>
    </div>

    <!-- User Auth Buttons -->
    <div class="col-md-3 text-right">
      <c:if test="${not empty userobj}">
        <span class="btn btn-sm btn-success text-white mr-1"><i class="fa-solid fa-user"></i> ${userobj.name}</span>
        <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
          <i class="fa-solid fa-right-from-bracket"></i> Logout
        </button>
      </c:if>

      <c:if test="${empty userobj}">
        <a href="../login.jsp" class="btn btn-sm btn-success mr-1"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
        <a href="../register.jsp" class="btn btn-sm btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
      </c:if>
    </div>
  </div>
</div>

<!-- Logout Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content bg-dark text-white">
      <div class="modal-header border-0">
        <h5 class="modal-title">Logout Confirmation</h5>
        <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body text-center">
        <h4>Are you sure you want to logout?</h4>
        <button type="button" class="btn btn-secondary mt-3" data-dismiss="modal">Cancel</button>
        <a href="../logoutcontroller" class="btn btn-primary mt-3 ml-2">Yes, Logout</a>
      </div>
    </div>
  </div>
</div>
