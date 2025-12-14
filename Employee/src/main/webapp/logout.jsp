<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent browser from caching pages (important for secure logout)
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Get the current session, if any
    jakarta.servlet.http.HttpSession session1 = request.getSession(false);


    // If a session exists, invalidate it (logout)
    if (session1 != null) {
        session1.invalidate();
    }

    // Redirect user to the login page
    response.sendRedirect("login.jsp");
%>
