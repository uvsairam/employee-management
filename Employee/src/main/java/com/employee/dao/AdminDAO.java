package com.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.employee.util.DBUtil;

public class AdminDAO {

    public boolean validateAdmin(String username, String password) {
        boolean isValid = false;

        try {
            Connection con = DBUtil.getConnection();
            String sql = "SELECT username, password FROM admin WHERE username = ? AND password = ?";
            PreparedStatement pst = con.prepareStatement(sql);

            pst.setString(1, username.trim());
            pst.setString(2, password.trim());

            System.out.println("Checking admin: " + username + ", " + password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                System.out.println("ADMIN FOUND ✔️");
                isValid = true;
            } else {
                System.out.println("ADMIN NOT FOUND ❌");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
