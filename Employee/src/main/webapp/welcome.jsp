<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.*, com.employee.dto.EmployeeDTO"%>
<%
    HttpSession session1 = request.getSession(false);

    String adminEmail = null;
    EmployeeDTO emp = null;

    if (session1 != null) {
        adminEmail = (String) session1.getAttribute("admin_email");
        emp =  (EmployeeDTO)session1.getAttribute("emp");
    }

    // If no session → redirect to login
    if (adminEmail == null && emp == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 700px;
            background: white;
            margin: 100px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 { color: #333; }
        .btn {
            padding: 12px 22px;
            display: inline-block;
            text-decoration: none;
            background: #007bff;
            color: white;
            margin: 10px;
            border-radius: 5px;
        }
        .btn:hover { background: #0056b3; }
        .logout-btn {
            background: #dc3545;
        }
        .logout-btn:hover {
            background: #a52834;
        }
    </style>
</head>
<body>

    <div class="container">

        <!-- ADMIN SECTION -->
        <% if (adminEmail != null) { %>
            <h1>Welcome Admin, <%= adminEmail %> 👑</h1>
            <p>You have full system control.</p>

            <a href="EmployeeServlet?action=list" class="btn">View Employee List</a>
            <a href="addEmployee.jsp" class="btn">Add New Employee</a>
            <a href="DepartmentServlet?action=list" class="btn">View Departments</a>

            <br><br>
            <a href="logout.jsp" class="btn logout-btn">Logout</a>
        <% } %>

        <!-- EMPLOYEE SECTION -->
        <% if (emp != null) { %>
            <h1>Welcome, <%= emp.getEmpName() %> 👋</h1>
            <p>Employee Dashboard</p>

            <a href="employeeProfile.jsp" class="btn">View My Profile</a>
            

            <br><br>
            <a href="logout.jsp" class="btn logout-btn">Logout</a>
        <% } %>

    </div>

</body>
</html>
