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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Read form data
		String name = request.getParameter("empName");
		String email = request.getParameter("empEmail");
		String password = request.getParameter("empPassword");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		double salary = Double.parseDouble(request.getParameter("salary"));
		int deptId = Integer.parseInt(request.getParameter("dept_id"));
		String doj = request.getParameter("doj");

		// DTO Object (NO constructor)
		EmployeeDTO emp = new EmployeeDTO();
		emp.setEmpName(name);
		emp.setEmpEmail(email);
		emp.setEmpPassword(password);
		emp.setEmpPhone(phone);
		emp.setEmpAddress(address);
		emp.setEmpSalary(salary);
		emp.setDeptId(deptId);
		emp.setEmpDoj(doj);

		// DAO call
		EmployeeDAO dao = new EmployeeDAO();
		boolean result = dao.addEmployee(emp);

		if (result) {
			HttpSession session = request.getSession();
			session.setAttribute("emp_email", email);
			session.setAttribute("emp_name", name);

			response.sendRedirect(request.getContextPath() + "/welcome.jsp");
		} else {
			request.setAttribute("errorMessage", "Registration failed");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}
}
