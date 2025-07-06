<%@page import="com.model.User"%>
<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>
<%@ include file="allcomponents/allCss.jsp" %>

<style>
body {
    background: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.cr-h {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border-radius: 10px;
    box-shadow: 0 0 5px rgba(0,0,0,0.1);
}

.cr-h:hover {
    background-color: #fff;
    transform: scale(1.03);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.card-body img {
    transition: transform 0.3s ease;
}

.card-body img:hover {
    transform: scale(1.1);
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	transform: translateX(-50%);
	background: #28a745;
	padding: 12px 20px;
	color: white;
	text-align: center;
	z-index: 9999;
	font-size: 16px;
	visibility: hidden;
	border-radius: 6px;
	box-shadow: 0px 0px 100px rgba(0,0,0,0.4);
}
#toast.display {
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}
@keyframes fadeIn {
	from { bottom: 0; opacity: 0; }
	to { bottom: 30px; opacity: 1; }
}
@keyframes fadeOut {
	from { bottom: 30px; opacity: 1; }
	to { bottom: 0; opacity: 0; }
}
.badge-custom {
    background-color: #ffc107;
    color: #000;
    font-weight: 500;
}
</style>
</head>
<body>

<%
	User u = (User) session.getAttribute("userobj");
%>

<%@ include file="allcomponents/navbar.jsp" %>

<!-- Toast Message -->
<c:if test="${not empty addCart}">
	<div id="toast">${addCart}</div>
	<script>
		showToast();
		function showToast() {
			$('#toast').addClass("display");
			setTimeout(() => { $('#toast').removeClass("display"); }, 2000);
		}
	</script>
	<c:remove var="addCart" scope="session" />
</c:if>

<!-- New Books Section -->
<div class="container">
	<h3 class="text-center text-primary my-4"> New Arrivals</h3>
	<div class="row">
	<%
		BookDAOImpl dao = new BookDAOImpl();
		List<bookDtls> list = dao.getAllNewBook();
		for (bookDtls b : list) {
	%>
		<div class="col-md-3 col-sm-6 col-12 mb-4">
			<div class="card cr-h h-100">
				<div class="card-body text-center">
					<img src="Books/<%= b.getPhoto() %>" alt="Book Image" class="img-thumbnail mb-2" style="width: 150px; height: 200px;">
					<h5 class="card-title text-dark"><%= b.getBookname() %></h5>
					<p class="mb-1 text-muted">by <%= b.getAuthor() %></p>
					<span class="badge badge-custom mb-2"> <%= b.getBookCategory() %></span>
					<div class="d-flex justify-content-center flex-wrap">
						<% if (u == null) { %>
							<a href="login.jsp" class="btn btn-outline-danger btn-sm m-1">
								<i class="fa fa-cart-plus"></i> Add Cart
							</a>
						<% } else { %>
							<a href="cartcontroller?bid=<%= b.getBookid() %>&uid=<%= u.getId() %>" class="btn btn-danger btn-sm m-1">
								<i class="fa fa-cart-plus"></i> Add Cart
							</a>
						<% } %>
						<a href="view_books.jsp?bid=<%= b.getBookid() %>" class="btn btn-success btn-sm m-1">
							View Details
						</a>
						<span class="btn btn-warning btn-sm m-1">
							Rs<%= b.getPrice() %>
						</span>
					</div>
				</div>
			</div>
		</div>
	<% } %>
	</div>
</div>

</body>
</html>
