<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent Books</title>
<%@include file="allcomponents/allCss.jsp" %>
<style>
body {
    background: linear-gradient(to right, #f5f7fa, #c3cfe2);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.cr-h {
    transition: transform 0.3s, box-shadow 0.3s;
    border-radius: 10px;
    box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);
}

.cr-h:hover {
    background-color: #ffffff;
    transform: scale(1.02);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.card-body img {
    width: 150px;
    height: 200px;
    border-radius: 8px;
    transition: transform 0.3s ease;
}

.card-body img:hover {
    transform: scale(1.08);
}

h3 {
    font-weight: bold;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.btn-custom {
    background: linear-gradient(to right, #fc5c7d, #6a82fb);
    color: white;
    border: none;
}

.btn-custom:hover {
    background: linear-gradient(to right, #6a82fb, #fc5c7d);
    color: white;
}

.badge-category {
    display: inline-block;
    padding: 5px 10px;
    font-size: 13px;
    color: #fff;
    background: #ff7e5f;
    border-radius: 20px;
    margin-bottom: 10px;
}
</style>
</head>
<body>

<%@include file="allcomponents/navbar.jsp" %>
<%
	User u = (User) session.getAttribute("userobj");
%>

<div class="container-fluid">
	<h3 class="text-center mt-4"> Recently Added Books</h3>
	<div class="row">
	<%
		BookDAOImpl dao1 = new BookDAOImpl();
		List<bookDtls> list1 = dao1.getAllRecentBook();
		for (bookDtls b : list1) {
	%>	
		<div class="col-md-3 col-sm-6 col-12 my-3">
			<div class="card cr-h h-100">
				<div class="card-body text-center">
					<img src="Books/<%= b.getPhoto() %>" alt="Book Image" class="img-thumblin mb-2">
					<h5 class="mb-1"><%= b.getBookname() %></h5>
					<p class="text-muted mb-1">by <%= b.getAuthor() %></p>
					<span class="badge-category"><%= b.getBookCategory() %></span>
					
					<div class="d-flex justify-content-center flex-wrap mt-2">
						<% if (b.getBookCategory().equals("Old")) { %>
							<a href="view_books.jsp?bid=<%= b.getBookid() %>" class="btn btn-success btn-sm m-1">View Details</a>
							<span class="btn btn-warning btn-sm m-1">Rs<%= b.getPrice() %></span>
						<% } else { %>
							<% if (u == null) { %>
								<a href="login.jsp" class="btn btn-custom btn-sm m-1">
									<i class="fa-solid fa-cart-shopping"></i> Add Cart
								</a>
							<% } else { %>
								<a href="cartcontroller?bid=<%= b.getBookid() %>&uid=<%= u.getId() %>" class="btn btn-custom btn-sm m-1">
									<i class="fa-solid fa-cart-shopping"></i> Add Cart
								</a>
							<% } %>
							<a href="view_books.jsp?bid=<%= b.getBookid() %>" class="btn btn-success btn-sm m-1">View Details</a>
							<span class="btn btn-warning btn-sm m-1">Rs<%= b.getPrice() %></span>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	<% } %>
	</div>
</div>

</body>
</html>
