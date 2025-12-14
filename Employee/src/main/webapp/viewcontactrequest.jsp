<%@ page import="java.util.*, com.employee.dto.ContactDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Requests</title>
    <style>
        table { 
            width: 90%; 
            margin: 20px auto; 
            border-collapse: collapse; 
        }
        th, td { 
            border: 1px solid #ddd; 
            padding: 10px; 
            text-align: left; 
        }
        th { 
            background-color: #f2f2f2; 
        }
        h2 { 
            text-align: center; 
        }
    </style>
</head>
<body>

<h2>All Contact Requests</h2>

<%
    List<ContactDTO> list = (List<ContactDTO>) request.getAttribute("contactList");
    if (list == null || list.isEmpty()) {
%>

<p style="text-align:center;color:red;">No records found.</p>

<%
    } else {
%>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Subject</th>
            <th>Message</th>
        </tr>
    </thead>

    <tbody>
        <% for (ContactDTO c : list) { %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getFullname() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getSubject() %></td>
                <td><%= c.getMessage() %></td>
            </tr>
        <% } %>
    </tbody>
</table>

<% } %>

</body>
</html>
