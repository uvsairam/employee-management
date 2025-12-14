<%@ page import="java.util.*, com.employee.dto.AttendanceDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Records</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <h2 class="text-center mb-4">All Attendance Records</h2>

    <%
        List<AttendanceDTO> list = (List<AttendanceDTO>) request.getAttribute("attendanceList");
        if(list == null || list.isEmpty()){
    %>
        <div class="alert alert-warning text-center" role="alert">
            No attendance records found.
        </div>
    <%
        } else {
    %>

    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover align-middle text-center">
            <thead class="table-dark">
            <tr>
                <th>Attendance ID</th>
                <th>Employee ID</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <% for(AttendanceDTO att : list) { %>
                <tr class="<%= "Present".equalsIgnoreCase(att.getStatus()) ? "table-success" : "table-danger" %>">
                    <td><%= att.getAttendanceId() %></td>
                    <td><%= att.getEmpId() %></td>
                    <td><%= att.getAttendanceDate() %></td>
                    <td><%= att.getStatus() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <% } %>

    <div class="text-center mt-4">
        <a href="markattendance.jsp" class="btn btn-primary">Mark New Attendance</a>
    </div>
    <div class="text-center mt-4">
        <a href="adminhome.jsp" class="btn btn-secondary">Back</a>
    </div>
</div>

<!-- Bootstrap JS CDN (optional for some components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
