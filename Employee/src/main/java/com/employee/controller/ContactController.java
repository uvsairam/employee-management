package com.employee.controller;

import java.io.IOException;

import com.employee.dao.ContactRequestDAO;
import com.employee.dto.ContactDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactController")
public class ContactController extends HttpServlet {
	
	ContactRequestDAO cd = new ContactRequestDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	ContactDTO cont = new ContactDTO();
        
    	cont.setFullname(request.getParameter("fullname"));
    	cont.setEmail(request.getParameter("email"));
    	cont.setSubject(request.getParameter("subject"));
    	cont.setMessage(request.getParameter("message"));
    	
    	cd.insertdata(cont);
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }
}
