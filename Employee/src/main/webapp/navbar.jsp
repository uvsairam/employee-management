<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">EMS</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("adminlogin.jsp") ? "active" : "" %>" href="adminlogin.jsp">Admin Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("index.jsp") ? "active" : "" %>" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("about.jsp") ? "active" : "" %>" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("login.jsp") ? "active" : "" %>" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("register.jsp") ? "active" : "" %>" href="register.jsp">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("contact.jsp") ? "active" : "" %>" href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
.navbar {
    box-shadow: 0 2px 10px rgba(0,0,0,0.2);
}
.navbar-nav .nav-link.active {
    color: #0d6efd !important;
    font-weight: 500;
}
.navbar-nav .nav-link:hover {
    color: #0d6efd;
    transition: 0.3s;
}
</style>
