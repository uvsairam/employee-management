package com.employee.controller;

import java.io.IOException;

import com.employee.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO dao;

	@Override
	public void init() {
		dao = new AdminDAO();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		boolean isValid = dao.validateAdmin(username, password);

		System.out.println("🔥 AdminLoginServlet reached!");
		System.out.println("Entered Username: " + username);
		System.out.println("Entered Password: " + password);

		if (isValid) {
			HttpSession session = request.getSession();
			session.setAttribute("adminUser", username); // optional
			session.setAttribute("role", "admin"); // important!

			// session timeout (optional, 30 mins)
			session.setMaxInactiveInterval(30 * 60);

			// Redirect to employee list
			response.sendRedirect("AdminHomeServlet?action=list");
		} else {
			request.setAttribute("errorMessage", "Invalid Admin Username or Password");
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
		}
	}
}
