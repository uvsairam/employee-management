package com.employee.dao;

import com.employee.dto.AttendanceDTO;
import com.employee.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    // Add new attendance record
    public boolean addAttendance(AttendanceDTO att) {
        String sql = "INSERT INTO employee_attendance(emp_id, attendance_date, status) VALUES (?,?,?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, att.getEmpId());
            ps.setDate(2, att.getAttendanceDate());
            ps.setString(3, att.getStatus());

            return ps.executeUpdate() > 0;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all attendance records
    public List<AttendanceDTO> getAllAttendance() {
        List<AttendanceDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM employee_attendance ORDER BY attendance_date DESC";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                AttendanceDTO att = new AttendanceDTO();
                att.setAttendanceId(rs.getInt("attendance_id"));
                att.setEmpId(rs.getInt("emp_id"));
                att.setAttendanceDate(rs.getDate("attendance_date"));
                att.setStatus(rs.getString("status"));
                list.add(att);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update attendance status
    public boolean updateAttendance(int empId, Date date, String status) {
        String sql = "UPDATE employee_attendance SET status=? WHERE emp_id=? AND attendance_date=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, empId);
            ps.setDate(3, date);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get attendance by empId and date
    public AttendanceDTO getAttendanceByEmpDate(int empId, Date date) {
        String sql = "SELECT * FROM employee_attendance WHERE emp_id=? AND attendance_date=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, empId);
            ps.setDate(2, date);

            try (ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    AttendanceDTO att = new AttendanceDTO();
                    att.setAttendanceId(rs.getInt("attendance_id"));
                    att.setEmpId(rs.getInt("emp_id"));
                    att.setAttendanceDate(rs.getDate("attendance_date"));
                    att.setStatus(rs.getString("status"));
                    return att;
                }
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
