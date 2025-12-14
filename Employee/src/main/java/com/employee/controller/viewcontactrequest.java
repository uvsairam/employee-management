package com.employee.controller;

import java.io.IOException;
import java.util.List;

import com.employee.dao.ContactRequestDAO;
import com.employee.dto.ContactDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewcontactrequest")
public class viewcontactrequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ContactRequestDAO crd = new ContactRequestDAO();
		List<ContactDTO> list = crd.getAllContactRequest();
		
		request.setAttribute("contactList", list);
		request.getRequestDispatcher("viewcontactrequest.jsp").forward(request, response);
	}

}
