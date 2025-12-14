package com.employee.controller;

import com.employee.dao.AttendanceDAO;
import com.employee.dto.AttendanceDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewAttendance")
public class ViewAttendanceServlet extends HttpServlet {
    private AttendanceDAO dao = new AttendanceDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<AttendanceDTO> list = dao.getAllAttendance();
        request.setAttribute("attendanceList", list);
        request.getRequestDispatcher("viewAttendance.jsp").forward(request, response);
    }
}
