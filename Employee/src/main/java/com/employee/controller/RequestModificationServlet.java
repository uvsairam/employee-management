package com.employee.controller;

import java.io.IOException;
import java.sql.Timestamp; // ✅ CORRECT

import com.employee.dao.EmployeeDAO;
import com.employee.dao.EmployeeInterface;
import com.employee.dto.ModificationRequestDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RequestModificationServlet")
public class RequestModificationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private EmployeeInterface empDao = new EmployeeDAO(); // DAO object

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		// Check if employee is logged in
		if (session == null || session.getAttribute("emp") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		// Read values
		int empId = Integer.parseInt(request.getParameter("empId"));
		String note = request.getParameter("requestNote");

		if (note == null || note.trim().isEmpty()) {
			request.setAttribute("message", "Request cannot be empty!");
			request.getRequestDispatcher("employeeProfile.jsp").forward(request, response);
			return;
		}

		// Create DTO object for the request
		ModificationRequestDTO req = new ModificationRequestDTO();
		req.setEmpId(empId);
		req.setRequestNote(note.trim());
		Timestamp now = new Timestamp(System.currentTimeMillis());
		req.setRequestDate(now);

		// Save request using DAO
		boolean isSaved = empDao.saveModificationRequest(req);

		System.out.println("Employee Requst :" + isSaved);

		if (isSaved) {
			request.setAttribute("message", "Request sent successfully to Admin!");
		} else {
			request.setAttribute("message", "Failed to send request. Please try again.");
		}

		// Forward back to profile page
		request.getRequestDispatcher("employeeProfile.jsp").forward(request, response);
	}
}
