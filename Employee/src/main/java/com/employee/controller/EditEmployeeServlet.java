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

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
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

        // ✅ Check for null or empty
        String empIdStr = request.getParameter("empId");
        if (empIdStr == null || empIdStr.isEmpty()) {
            // Redirect back to list if no ID provided
            response.sendRedirect("listEmployees");
            return;
        }

        int empid = Integer.parseInt(empIdStr);

        EmployeeDTO emp = dao.getEmployeeById(empid);
        if (emp == null) {
            // Employee not found, redirect or show error
            response.sendRedirect("listEmployees");
            return;
        }

        request.setAttribute("emp", emp);
        request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Only admin should access update
        if (!isAdminLoggedIn(request)) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        // Get form values
        int empId = Integer.parseInt(request.getParameter("empId"));
        String name = request.getParameter("empName");
        String email = request.getParameter("empEmail");
        double salary = Double.parseDouble(request.getParameter("empSalary"));
        String doj = request.getParameter("empDoj");
        String phone = request.getParameter("empPhone");
        String address = request.getParameter("empAddress");
        int deptId = Integer.parseInt(request.getParameter("deptId"));

        // Create DTO using setters
        EmployeeDTO emp = new EmployeeDTO();
        emp.setEmpId(empId);
        emp.setEmpName(name);
        emp.setEmpEmail(email);
        emp.setEmpSalary(salary);
        emp.setEmpDoj(doj);
        emp.setEmpPhone(phone);
        emp.setEmpAddress(address);
        emp.setDeptId(deptId);

        // Call DAO
        boolean updated = dao.updateEmployee(emp);

        if (updated) {
            response.sendRedirect("listEmployees");
        } else {
            response.getWriter().println("Update Failed!");
        }
    }

}
