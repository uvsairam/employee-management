package com.employee.controller;

import java.io.IOException;

import com.employee.dao.EmployeeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeDAO dao = new EmployeeDAO();

	private boolean isAdminLoggedIn(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return session != null && "admin".equals(session.getAttribute("role"));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!isAdminLoggedIn(request)) {
			response.sendRedirect("adminlogin.jsp");
			return;
		}

		int id = Integer.parseInt(request.getParameter("empId"));
		dao.deleteEmployee(id);
		response.sendRedirect("listEmployees");

	}

}
