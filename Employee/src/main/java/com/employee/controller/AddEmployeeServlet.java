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


@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeDAO dao = new EmployeeDAO();
//	------------------------------
//	Check admin login
//	-----------------------
	private boolean isAdminLoggedIn(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return session !=null && "admin".equals(session.getAttribute("role"));
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//		Call the session check here
		if(!isAdminLoggedIn(request)) {
			response.sendRedirect("adminlogin.jsp");
			return;//imortant to stop futher execution
		}
		
		EmployeeDTO emp = new EmployeeDTO();
		emp.setEmpName(request.getParameter("empName"));
		emp.setEmpEmail(request.getParameter("empEmail"));
		emp.setEmpPhone(request.getParameter("empPhone"));
		emp.setEmpAddress(request.getParameter("empAddress"));
		emp.setEmpPassword(request.getParameter("empPassword"));
		emp.setDeptId(Integer.parseInt(request.getParameter("deptId")));
		emp.setEmpSalary(Double.parseDouble(request.getParameter("empSalary")));
		emp.setEmpDoj(request.getParameter("empDoj"));
		
		dao.addEmployee(emp);
		response.sendRedirect("listEmployees");
	}

}
