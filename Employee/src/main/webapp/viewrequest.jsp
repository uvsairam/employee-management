<%@ page import="java.util.List, com.employee.dto.ModificationRequestDTO" %>

<%
    List<ModificationRequestDTO> list =
        (List<ModificationRequestDTO>) request.getAttribute("requestList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Requests</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">My Submitted Requests</h2>

    <%
        if (list == null || list.isEmpty()) {
    %>

        <div class="alert alert-info text-center">
            No requests found!
        </div>

    <%
        } else {
    %>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Request ID</th>
                <th>empId</th>
                <th>Request Note</th>
                <th>Request Date</th>
                <th>Status</th>
                <th>Approve</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (ModificationRequestDTO req : list) {
        %>
            <tr>
                <td><%= req.getRequestId() %></td>
                <td><%= req.getEmpId() %></td>
                <td><%= req.getRequestNote() %></td>
                <td><%= req.getRequestDate().toString() %></td>
                <td><%= req.getStatus() %></td>
                <td><a href="AdminEditEmployeeRequest?id=<%= req.getRequestId() %>">Approve</a></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <% } %>

    <div class="text-center mt-4">
        <a href="adminhome.jsp" class="btn btn-secondary">Back</a>
    </div>

</div>

</body>
</html>
