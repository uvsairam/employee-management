package com.employee.controller;

import java.io.IOException;

import com.employee.dao.EmployeeDAO;
import com.employee.dao.EmployeeInterface;
import com.employee.dto.EmployeeDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeProfileServle")
public class EmployeeProfileServle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int empId = Integer.parseInt(request.getParameter("empId"));// Get employee ID from session or request

		EmployeeInterface empDAO = new EmployeeDAO();
		EmployeeDTO emp = empDAO.getEmployeeById(empId);

		request.setAttribute("employee", emp);// set employee object
		request.getRequestDispatcher("employeeProfile.jsp").forward(request, response);

	}

}
