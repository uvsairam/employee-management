<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Employee Management System</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body, html {
    height: 100%;
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

/* Background image */
.bg-login {
    background: url('images/login-bg.jpg') no-repeat center center fixed;
    background-size: cover;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Login form container */
.login-container {
    max-width: 400px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.95); /* semi-transparent white */
    padding: 30px 35px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

.form-control:focus {
    box-shadow: none;
    border-color: #6610f2;
}
</style>
</head>

<body>

<div class="bg-login">
    <div class="login-container">
        <h3 class="text-center fw-bold mb-4">Employee Login</h3>

        <!-- Error Message Display -->
        <% 
            String error = (String) request.getAttribute("errorMessage");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center">
                <%= error %>
            </div>
        <% } %>

        <form action="login" method="post">
            <div class="mb-3">
                <label class="form-label">Email ID</label>
                <input type="email" class="form-control" name="empEmail" placeholder="Enter your email" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="empPassword" placeholder="Enter password" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>

            <div class="text-center mt-3">
                <p>Don't have an account? <a href="register.jsp">Register here</a></p>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp" %>
</body>
</html>
