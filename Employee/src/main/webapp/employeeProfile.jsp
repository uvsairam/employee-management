<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.employee.dto.EmployeeDTO"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
HttpSession session1 = request.getSession(false);
EmployeeDTO emp = null;

if (session1 != null) {
	emp = (EmployeeDTO) session1.getAttribute("emp");
}

// If no session or no employee object, redirect to login
if (emp == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container mt-5">
		<div class="card shadow-sm">

			<div class="card-header bg-primary text-white text-center">
				<h3>Employee Profile</h3>
			</div>

			<div class="card-body">

				<!-- Employee Details -->
				<div class="mb-2">
					<strong>Employee ID:</strong>
					<%=emp.getEmpId()%></div>
				<div class="mb-2">
					<strong>Name:</strong>
					<%=emp.getEmpName()%></div>
				<div class="mb-2">
					<strong>Email:</strong>
					<%=emp.getEmpEmail()%></div>
				<div class="mb-2">
					<strong>Phone:</strong>
					<%=emp.getEmpPhone()%></div>
				<div class="mb-2">
					<strong>Address:</strong>
					<%=emp.getEmpAddress()%></div>
				<div class="mb-2">
					<strong>Salary:</strong> ₹<%=emp.getEmpSalary()%></div>
				<div class="mb-2">
					<strong>Department ID:</strong>
					<%=emp.getDeptId()%></div>
				<div class="mb-2">
					<strong>Date of Joining:</strong>
					<%=emp.getEmpDoj()%></div>

				<!-- Request Modification Form -->
				<form action="RequestModificationServlet" method="post">
					<input type="hidden" name="empId" value="<%=emp.getEmpId()%>">

					<div class="mb-3 mt-3">
						<label for="requestNote" class="form-label">Add Note /
							Request Details</label>
						<textarea class="form-control" id="requestNote" name="requestNote"
							rows="4" required></textarea>
					</div>

					<button type="submit" class="btn btn-success w-100">Request
						Admin for Update</button>
					<a href="welcome.jsp" class="btn btn-primary logout-btn w-100">Back</a>
				</form>

				<!-- Success Message -->
				<%
				String message = (String) request.getAttribute("message");
				if (message != null) {
				%>
				<div class="alert alert-success mt-3 text-center"><%=message%></div>
				<%
				}
				%>

			</div>
		</div>
	</div>
    
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
