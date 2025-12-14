package com.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dto.ModificationRequestDTO;
import com.employee.util.DBUtil;

public class ModificationRequestDAO {

    // ============================================
    // 1️⃣ Get Requests By Employee ID
    // ============================================
    public List<ModificationRequestDTO> getRequestsByEmployee(int empId) {

        List<ModificationRequestDTO> list = new ArrayList<>();

        try (Connection con = DBUtil.getConnection()) {

            String sql = "SELECT id, emp_id, request_note, status, request_date "
                       + "FROM modification_requests WHERE emp_id=? "
                       + "ORDER BY request_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, empId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ModificationRequestDTO mr = new ModificationRequestDTO();
                mr.setRequestId(rs.getInt("id"));
                mr.setEmpId(rs.getInt("emp_id"));
                mr.setRequestNote(rs.getString("request_note"));
                mr.setStatus(rs.getString("status"));
                mr.setRequestDate(rs.getTimestamp("request_date"));

                list.add(mr);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    
    // ============================================
    // 2️ Get All Pending Requests (Not Approved)
    // ============================================
    public List<ModificationRequestDTO> getAllEmployeeRequests() {

        List<ModificationRequestDTO> list = new ArrayList<>();

        try (Connection con = DBUtil.getConnection()) {

            String sql = "SELECT * FROM modification_requests WHERE status <> 'approved'";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ModificationRequestDTO mr = new ModificationRequestDTO();
                mr.setRequestId(rs.getInt("id"));
                mr.setEmpId(rs.getInt("emp_id"));
                mr.setRequestNote(rs.getString("request_note"));
                mr.setStatus(rs.getString("status"));
                mr.setRequestDate(rs.getTimestamp("request_date"));

                list.add(mr);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // ============================================
    // 3️⃣ UPDATE Request Status (Approve / Reject)
    // ============================================
    public boolean updateRequestStatus(int requestId, String status) {

        boolean updated = false;

        try (Connection con = DBUtil.getConnection()) {

            String sql = "UPDATE modification_requests SET status=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, requestId);

            int rows = ps.executeUpdate();
            updated = (rows > 0);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

}
