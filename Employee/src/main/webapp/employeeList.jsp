<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.employee.dto.EmployeeDTO"%>

<%
// ========= ADMIN SESSION CHECK =========
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
<title>Employee List</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #eef2f3;
	padding: 20px;
}

table {
	background-color: white;
}

th, td {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>

<body>

	<h2 class="mb-4">Employee List</h2>

	<table class="table table-bordered table-striped">
		<thead class="table-dark">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Salary</th>
				<th>Date of Joining</th>
				<th>Phone</th>
				<th>Address</th>
				<th>Dept ID</th>
				<th>Actions</th>
			</tr>
		</thead>

		<tbody>
			<%
			List<EmployeeDTO> employees = (List<EmployeeDTO>) request.getAttribute("employee");

			if (employees != null && !employees.isEmpty()) {

				for (EmployeeDTO emp : employees) {

					String formattedDoj = emp.getEmpDoj();

					try {
				java.time.LocalDate date = java.time.LocalDate.parse(emp.getEmpDoj());
				formattedDoj = date.format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy"));
					} catch (Exception e) {
					}
			%>

			<tr>
				<td><%=emp.getEmpId()%></td>
				<td><%=emp.getEmpName()%></td>
				<td><%=emp.getEmpEmail()%></td>
				<td><%=emp.getEmpSalary()%></td>
				<td><%=formattedDoj%></td>
				<td><%=emp.getEmpPhone()%></td>
				<td><%=emp.getEmpAddress()%></td>
				<td><%=emp.getDeptId()%></td>

				<td>
					<!-- Only ADMIN sees edit & delete -->
					 <a href="EditEmployeeServlet?empId=<%=emp.getEmpId()%>"
					    class="btn btn-sm btn-primary">Edit</a> 
					<a href="DeleteEmployeeServlet?empId=<%=emp.getEmpId()%>"
					class="btn btn-sm btn-danger"
					onclick="return confirm('Are you sure?');">Delete</a>
				</td>
			</tr>

			<%
			} // end for loop

			} else {
			%>

			<tr>
				<td colspan="9">No Employees found.</td>
			</tr>

			<%
			}
			%>
		</tbody>

	</table>
	<a href="adminhome.jsp" class="btn logout-btn btn-primary">Back</a>

</body>
</html>
