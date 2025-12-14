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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("empEmail");
        String password = request.getParameter("empPassword");
        
        System.out.println("LoginServlet called");
        System.out.println("Email: " + email + ", Password: " + password);


        EmployeeDAO empdao = new EmployeeDAO();
        EmployeeDTO emp = empdao.validateLogin(email, password);

        if (emp != null) {

            HttpSession session = request.getSession();
            session.setAttribute("emp", emp);               // store employee object
            session.setAttribute("empId", emp.getEmpId());  // ✅ required for requests page
            session.setAttribute("empName", emp.getEmpName()); // optional, if exists

            response.sendRedirect("welcome.jsp");

        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
