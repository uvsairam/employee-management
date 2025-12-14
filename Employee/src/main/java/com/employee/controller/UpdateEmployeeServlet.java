package com.employee.controller;

import java.io.IOException;

import com.employee.dao.EmployeeDAO;
import com.employee.dto.EmployeeDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeDAO dao = new EmployeeDAO();

	private boolean isAdminLoggedIn(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return session != null && "admin".equals(session.getAttribute("role"));
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!isAdminLoggedIn(request)) {
			response.sendRedirect("adminlogin.jsp");
			return;
		}

		EmployeeDTO emp = new EmployeeDTO();
		emp.setEmpId(Integer.parseInt(request.getParameter("empId")));
		emp.setEmpName(request.getParameter("empName"));
		emp.setEmpEmail(request.getParameter("empEmail"));
		emp.setEmpPhone(request.getParameter("empPhone"));
		emp.setDeptId(Integer.parseInt(request.getParameter("deptId")));
		emp.setEmpSalary(Double.parseDouble(request.getParameter("empSalary")));
		emp.setEmpDoj(request.getParameter("empDoj"));

		dao.updateEmployee(emp);
		response.sendRedirect("listEmployees");

	}

}
