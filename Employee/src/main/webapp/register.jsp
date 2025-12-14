<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | Employee Management System</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body, html {
    height: 100%;
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

/* Full-page background image */
body {
    background: url('images/register-bg.jpg') no-repeat center center fixed;
    background-size: cover;
}

/* Registration form container */
.register-container {
    max-width: 550px;
    margin: auto;
    margin-top: 50px;
    background-color: rgba(255, 255, 255, 0.95); /* semi-transparent */
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.2);
}

.form-control:focus, .form-select:focus {
    box-shadow: none;
    border-color: #20c997;
}
</style>
</head>
<body>

<div class="register-container">
    <h3 class="text-center fw-bold mb-4">Employee Registration</h3>

    <% 
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) {
    %>
        <div class="alert alert-danger text-center">
            <%= error %>
        </div>
    <% } %>

    <form action="register" method="post">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="empName" class="form-control" placeholder="Enter your name" required>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="empEmail" class="form-control" placeholder="Enter your email" required>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="empPassword" class="form-control" placeholder="Create a password" required>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Phone</label>
                <input type="text" name="phone" class="form-control" placeholder="Enter phone number">
            </div>

            <div class="col-md-12 mb-3">
                <label class="form-label">Address</label>
                <input type="text" name="address" class="form-control" placeholder="Enter address">
            </div>

            <div class="mb-3">
                <label class="form-label">Salary</label>
                <input type="number" class="form-control" name="salary" placeholder="Enter salary" required>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Department</label>
                <select name="dept_id" class="form-select" required>
                    <option value="">-- Select Department --</option>
                    <option value="6">Information Technology</option>
                    <option value="7">Human Resources</option>
                    <option value="8">Finance</option>
                    <option value="9">Marketing</option>
                    <option value="10">R&D</option>
                </select>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Date of Joining</label>
                <input type="date" name="doj" class="form-control" required>
            </div>
        </div>

        <button type="submit" class="btn btn-success w-100">Register</button>

        <div class="text-center mt-3">
            <p>
                Already registered? <a href="login.jsp">Login here</a>
            </p>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="footer.jsp" %>

</body>
</html>
