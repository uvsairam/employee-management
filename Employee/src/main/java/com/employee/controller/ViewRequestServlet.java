package com.employee.controller;

import java.io.IOException;
import java.util.List;

import com.employee.dao.ModificationRequestDAO;
import com.employee.dto.ModificationRequestDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewrequest")
public class ViewRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ModificationRequestDAO dao = new ModificationRequestDAO();
        List<ModificationRequestDTO> list = dao.getAllEmployeeRequests();
        request.setAttribute("requestList", list);
        request.getRequestDispatcher("viewrequest.jsp").forward(request, response);

    }
}
