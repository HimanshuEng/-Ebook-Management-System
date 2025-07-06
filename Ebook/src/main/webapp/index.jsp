<%@page import="java.util.ArrayList"%>
<%@page import="com.model.User"%>
<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImpl"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : Index</title>
<%@include file="allcomponents/allCss.jsp" %>

<style>
    body {
        background: linear-gradient(to right, #e0f7fa, #e1bee7);
    }

    .back-img {
        background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.7)), url("https://i.pinimg.com/736x/4d/ff/f2/4dfff227347ec506610b396a9f923a0f.jpg") center/cover no-repeat;
        height: 70vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        text-shadow: 1px 1px 4px black;
    }

    .book-section {
        padding-top: 40px;
        padding-bottom: 20px;
    }

    .book-title {
        text-align: center;
        color: #d32f2f;
        font-weight: bold;
        margin-bottom: 30px;
        font-size: 2rem;
    }

    .card.cr-h {
        border-radius: 10px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        background: white;
    }

    .card.cr-h:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        background-color: #fafafa;
    }

    .btn-custom {
        border-radius: 20px;
        padding: 6px 15px;
        font-weight: 500;
    }

    .btn-price {
        background: linear-gradient(to right, #ff5252, #ff1744);
        color: white;
        border: none;
    }

    .btn-price:hover {
        opacity: 0.85;
    }
</style>
</head>

<body>
<%@include file="allcomponents/navbar.jsp" %>
<%
    User u = (User) session.getAttribute("userobj");
%>

<div class="back-img">
    <h1 class="display-4">📚 Welcome to Ebook Management System</h1>
</div>

<!-- SECTION TEMPLATE FUNCTION -->
<%
    BookDAOImpl dao = new BookDAOImpl();

    String[] sectionNames = {"Recent Books", "Old Books", "New Books"};
    List<List<bookDtls>> bookSections = new ArrayList<>();
    bookSections.add(dao.getRecentBook());
    bookSections.add(dao.getoldBook());
    bookSections.add(dao.getNewBook());
    
    String[] allPageLinks = {
        "all_recentbook.jsp",
        "all_oldbook.jsp",
        "all_newbook.jsp"
    };

    for (int section = 0; section < 3; section++) {
        List<bookDtls> books = bookSections.get(section);
%>
    <div class="container book-section">
        <h3 class="book-title"><%=sectionNames[section]%></h3>
        <div class="row g-4">
            <%
                for (bookDtls b : books) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-6 d-flex align-items-stretch">
                <div class="card cr-h w-100">
                    <div class="card-body text-center">
                        <img src="Books/<%=b.getPhoto()%>" alt="Book Image" class="img-thumbnail mb-2" style="width: 130px; height: 180px;">
                        <h5><%=b.getBookname()%></h5>
                        <p><small><%=b.getAuthor()%></small></p>
                        <p><span class="badge bg-primary">Category: <%=b.getBookCategory()%></span></p>
                        <div class="d-flex justify-content-center gap-2 mt-2 flex-wrap">
                            <%
                                if (section != 1) { // No cart for old books
                                    if (u == null) {
                            %>
                            <a href="login.jsp" class="btn btn-danger btn-sm btn-custom">
                                <i class="fa-solid fa-cart-shopping"></i> Add Cart
                            </a>
                            <%
                                    } else {
                            %>
                            <a href="cartcontroller?bid=<%=b.getBookid()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm btn-custom">
                                <i class="fa-solid fa-cart-shopping"></i> Add Cart
                            </a>
                            <%
                                    }
                                }
                            %>
                            <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm btn-custom">View Details</a>
                            <span class="btn btn-price btn-sm btn-custom">₹ <%=b.getPrice()%></span>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="text-center mt-4">
            <a href="<%=allPageLinks[section]%>" class="btn btn-danger text-white btn-custom">View All</a>
        </div>
    </div>
<%
    }
%>

</body>
</html>
