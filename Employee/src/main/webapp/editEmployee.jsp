<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.employee.dto.EmployeeDTO" %>
<%
    EmployeeDTO emp = (EmployeeDTO) request.getAttribute("emp");
    if(emp == null){
        response.sendRedirect("EditEmployeeServlet?action=list");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            max-width: 700px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 30px;
        }
        label {
            font-weight: 500;
        }
        .btn-custom {
            background-color: #0d6efd;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0b5ed7;
        }
        .back-link {
            text-decoration: none;
            color: #0d6efd;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Edit Employee</h2>
        <form action="EditEmployeeServlet" method="post">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="empId" value="<%=emp.getEmpId()%>" />

            <div class="mb-3">
                <label for="empName" class="form-label">Full Name:</label>
                <input type="text" class="form-control" id="empName" name="empName" value="<%=emp.getEmpName()%>" required/>
            </div>

            <div class="mb-3">
                <label for="empEmail" class="form-label">Email:</label>
                <input type="email" class="form-control" id="empEmail" name="empEmail" value="<%=emp.getEmpEmail()%>" required/>
            </div>

            <div class="mb-3">
                <label for="empSalary" class="form-label">Salary:</label>
                <input type="number" class="form-control" id="empSalary" step="0.01" name="empSalary" value="<%=emp.getEmpSalary()%>" required/>
            </div>

            <div class="mb-3">
                <label for="empDoj" class="form-label">Date of Joining:</label>
                <input type="date" class="form-control" id="empDoj" name="empDoj" value="<%=emp.getEmpDoj()%>" required/>
            </div>

            <div class="mb-3">
                <label for="empPhone" class="form-label">Phone:</label>
                <input type="text" class="form-control" id="empPhone" name="empPhone" value="<%=emp.getEmpPhone()%>" required/>
            </div>

            <div class="mb-3">
                <label for="empAddress" class="form-label">Address:</label>
                <textarea class="form-control" id="empAddress" name="empAddress" rows="3" required><%=emp.getEmpAddress()%></textarea>
            </div>

            <div class="mb-3">
                <label for="deptId" class="form-label">Department:</label>
                <input type="number" class="form-control" id="deptId" name="deptId" value="<%=emp.getDeptId()%>" required/>
            </div>

            <button type="submit" class="btn btn-custom w-100">Update Employee</button>
        </form>
        <br/>
        <div class="text-center">
            <a href="listEmployees?action=list" class="back-link">Back to Employee List</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

