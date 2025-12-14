package com.employee.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminHomeServlet")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private boolean isAdminLoggedIn(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return session != null && "admin".equals(session.getAttribute("role"));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!isAdminLoggedIn(request)) {
			// Admin not logged in → redirect to login page
			response.sendRedirect("adminlogin.jsp");
			return;
		}

		// Admin is logged in → forward to adminhome.jsp
		request.getRequestDispatcher("adminhome.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Usually just forward POST to GET
		doGet(request, response);
	}
}
