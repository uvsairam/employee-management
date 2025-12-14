package com.employee.controller;

import java.io.IOException;

import com.employee.dao.ModificationRequestDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminEditEmployeeRequest")
public class AdminEditEmployeeRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Prevent GET error
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");

		ModificationRequestDAO dao = new ModificationRequestDAO();
		boolean updated = dao.updateRequestStatus(id, status);

		if (updated) {
			request.setAttribute("message", "Status Updated Successfully!");
			request.getRequestDispatcher("viewrequest.jsp").forward(request, response);
		} else {
			response.getWriter().println("Update failed or Request not found.");
		}
	}
}
