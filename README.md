# -Ebook-Management-System
A Java-based web application for managing ebooks, users, and shopping carts using Hibernate, Servlets, JSP, and MVC architecture.

**📚 Ebook Management System (JSP + Hibernate + MySQL)**
A full-stack web application for browsing, managing, and ordering ebooks online.
Built using JSP/Servlets, Hibernate ORM, MySQL, and Bootstrap.

**💡 Features**:
=>User authentication (login/register)

=>Add to cart and order functionality

=>Book categories: Recent, New, Old

=>Profile management and secure password update

=>Admin features (if included): book management, order tracking

=>Responsive UI with Bootstrap

**⚙️ Tech Stack:**

=>Frontend: JSP, HTML5, CSS3, Bootstrap

=>Backend: Java Servlets, Hibernate ORM

=>Database: MySQL

Server: Apache Tomcat

**🔒 Prerequisites:**
JDK 17+

=>Apache Tomcat 9/10

=>MySQL Server

=>Maven (if using)

**🎯 Architecture: MVC Pattern**

This project is built using the Model-View-Controller (MVC) architecture:

Model: Java classes (User, Cart, BookDtls, etc.) that represent data and business logic. Hibernate handles ORM (Object Relational Mapping) and database operations.

View: JSP pages (index.jsp, login.jsp, cart.jsp, etc.) render the UI and receive data via JSTL and EL.

Controller: Java Servlets (LoginServlet, CartController, UpdateProfile, etc.) handle incoming requests, process them using the Model, and forward results to Views.
