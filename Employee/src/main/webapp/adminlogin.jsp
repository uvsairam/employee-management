<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="bg-light">

	<!-- Navbar (optional) -->
	<%@ include file="navbar.jsp"%>

	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 80vh;">
		<div class="card shadow-lg p-4"
			style="width: 400px; border-radius: 15px;">
			<h3 class="text-center mb-4 text-primary">Admin Login</h3>
			<!-- Error message -->
			<%
			String error = (String) request.getAttribute("errorMessage");
			if (error != null) {
			%>
			<div class="alert alert-danger"><%=error%></div>
			<%
			}
			%>
			<form action="<%=request.getContextPath()%>/AdminLoginServlet"
				method="post">
				<div class="mb-3">
					<label class="form-label">Username</label> <input type="text"
						name="username" class="form-control" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Password</label> <input type="password"
						name="password" class="form-control" required>
				</div>

				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>

		</div>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
