package com.employee.controller;

import com.employee.dao.AttendanceDAO;
import com.employee.dto.AttendanceDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/markAttendance")
public class MarkAttendanceServlet extends HttpServlet {
    private AttendanceDAO dao = new AttendanceDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int empId = Integer.parseInt(request.getParameter("empId"));
        Date date = Date.valueOf(request.getParameter("attendanceDate"));
        String status = request.getParameter("status");

        AttendanceDTO att = new AttendanceDTO();
        att.setEmpId(empId);
        att.setAttendanceDate(date);
        att.setStatus(status);

        boolean success = dao.addAttendance(att);

        if(success) {
            response.sendRedirect("viewAttendance"); // redirect to view page
        } else {
            response.getWriter().println("Error saving attendance!");
        }
    }
}
