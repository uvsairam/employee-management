<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Check admin session
    if (session == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background-color: #eef2f3;
            font-family: Arial, sans-serif;
        }
        .dashboard-box {
            max-width: 600px;
            background: #fff;
            margin: 100px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
            text-align: center;
        }
        h2 {
            font-weight: bold;
        }
        .btn-custom {
            width: 200px;
        }
    </style>
</head>

<body>

    <%@ include file="navbar.jsp" %>

    <div class="dashboard-box">
        <h2>Welcome Admin 👑</h2>
        <p class="text-muted">Manage all employees from here.</p>

        <div class="d-flex flex-column align-items-center gap-3 mt-4">

            <a href="listEmployees?action=list"
               class="btn btn-primary btn-custom">
               View Employee List
            </a>

            <a href="addEmployee.jsp"
               class="btn btn-success btn-custom">
               Add New Employee
            </a>
            
           <a href="viewrequest" 
              class="btn btn-info btn-custom">
              EmployeeRequests
		   </a>
		   
		   <a href="viewcontactrequest" 
              class="btn btn-secondary btn-custom">
              ContactRequests
		   </a>
		   
		  <a href="viewAttendance" 
              class="btn btn-light btn-custom">
              ViewAttandance
		   </a>
           
            <a href="index.jsp"
               class="btn btn-danger btn-info">
               Logout
            </a>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
