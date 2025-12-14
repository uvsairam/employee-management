package com.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dto.ContactDTO;
import com.employee.util.DBUtil;

public class ContactRequestDAO {

	public boolean insertdata(ContactDTO c) {
		String sql = "insert into contact (full_name, email, subject, message)" + "Values (?,?,?,?)";

		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, c.getFullname());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getSubject());
			ps.setString(4, c.getMessage());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
//	To Get the All the requests

	public List<ContactDTO> getAllContactRequest() {

		List<ContactDTO> cr = new ArrayList<>();

		try {
			Connection con = DBUtil.getConnection();
			String sql = "select * from contact";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ContactDTO cont = new ContactDTO();
				cont.setId(rs.getInt("id"));
				cont.setFullname(rs.getString("full_name"));
				cont.setEmail(rs.getString("email"));
				cont.setSubject(rs.getString("subject"));
				cont.setMessage(rs.getString("message"));

				cr.add(cont);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cr;
	}
}
