<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<%
    // Admin Access Control
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Employee</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4 text-primary">Add New Employee</h2>

    <form action="AddEmployeeServlet" method="post">
        <input type="hidden" name="action" value="add"/>

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" name="empName" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="empEmail" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="empPassword" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Salary</label>
            <input type="number" step="0.01" class="form-control" name="empSalary" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Date of Joining</label>
            <input type="date" class="form-control" name="empDoj" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" class="form-control" name="empPhone" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Address</label>
            <textarea class="form-control" name="empAddress" rows="3" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Department ID</label>
            <input type="number" class="form-control" name="deptId" required>
        </div>

        <button type="submit" class="btn btn-primary">Add Employee</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
