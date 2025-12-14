package com.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.employee.dto.EmployeeDTO;
import com.employee.dto.ModificationRequestDTO;
import com.employee.util.DBUtil;

public class EmployeeDAO implements EmployeeInterface {

	DBUtil du = new DBUtil();

	// --------------------
	// ADD EMPLOYEE
	// --------------------
	public boolean addEmployee(EmployeeDTO emp) {
		String sql = "INSERT INTO employee (emp_name, emp_email,emp_password, emp_phone, emp_address, dept_id, emp_salary, emp_doj) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?,?)";

		try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, emp.getEmpName());
			ps.setString(2, emp.getEmpEmail());
			ps.setString(3, emp.getEmpPassword());
			ps.setString(4, emp.getEmpPhone());
			ps.setString(5, emp.getEmpAddress());
			ps.setInt(6, emp.getDeptId());
			ps.setDouble(7, emp.getEmpSalary());
			ps.setString(8, emp.getEmpDoj());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// --------------------
	// UPDATE EMPLOYEE
	// --------------------
	public boolean updateEmployee(EmployeeDTO emp) {
		String sql = "UPDATE employee SET emp_name=?, emp_email=?, emp_phone=?, emp_address=?, dept_id=?, emp_salary=?, emp_doj=? WHERE emp_id=?";

		try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, emp.getEmpName());
			ps.setString(2, emp.getEmpEmail());
			ps.setString(3, emp.getEmpPhone());
			ps.setString(4, emp.getEmpAddress());
			ps.setInt(5, emp.getDeptId());
			ps.setDouble(6, emp.getEmpSalary());
			ps.setString(7, emp.getEmpDoj());
			ps.setInt(8, emp.getEmpId());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// --------------------
	// GET ALL EMPLOYEES
	// --------------------
	public List<EmployeeDTO> getAllEmployees() {
		List<EmployeeDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM employee";

		try (Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				EmployeeDTO emp = new EmployeeDTO();
				emp.setEmpId(rs.getInt("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setEmpEmail(rs.getString("emp_email"));
				emp.setEmpPhone(rs.getString("emp_phone"));
				emp.setEmpAddress(rs.getString("emp_address"));
				emp.setDeptId(rs.getInt("dept_id"));
				emp.setEmpSalary(rs.getDouble("emp_salary"));
				emp.setEmpDoj(rs.getString("emp_doj"));

				list.add(emp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// --------------------
	// GET EMPLOYEE BY ID
	// --------------------
	public EmployeeDTO getEmployeeById(int empid) {
		EmployeeDTO emp = null;
		String sql = "SELECT * FROM employee WHERE emp_id=?";

//        System.out.println("Conntecion ayyindhi....");

		
		try (Connection con = DBUtil.getConnection(); 
			PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, empid);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					emp = new EmployeeDTO();
					emp.setEmpId(rs.getInt("emp_id"));
					emp.setEmpName(rs.getString("emp_name"));
					emp.setEmpEmail(rs.getString("emp_email"));
					emp.setEmpPhone(rs.getString("emp_phone"));
					emp.setEmpAddress(rs.getString("emp_address"));
					emp.setDeptId(rs.getInt("dept_id"));
					emp.setEmpSalary(rs.getDouble("emp_salary"));
					emp.setEmpDoj(rs.getString("emp_doj"));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}

	// --------------------
	// DELETE EMPLOYEE
	// --------------------
	public boolean deleteEmployee(int id) {
		String sql = "DELETE FROM employee WHERE emp_id=?";

//        System.out.println("Delete ki vachindhi..!");

		try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);
			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// --------------------
	// LOGIN VALIDATION (OPTIONAL)
	// --------------------
	public EmployeeDTO validateLogin(String email, String password) {
		EmployeeDTO epd = new EmployeeDTO();
		String sql = "SELECT * FROM employee WHERE emp_email=? AND emp_password=?";
		try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);
			ps.setString(2, password);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					epd = getEmployeeById(rs.getInt("emp_id"));
				} else {
					epd = null;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return epd;
	}

	@Override
	public boolean isAdminLoggedIn() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addRequest(int empId, String requestNote) throws Exception {
		String sql = "INSERT INTO modification_requests (emp_id, request_note, status) VALUES (?, ?, 'Pending')";
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, empId);
			ps.setString(2, requestNote);
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("Error inserting modification request", e);
		}
	}

	@Override
	public boolean saveModificationRequest(ModificationRequestDTO req) {
		String sql = "INSERT INTO modification_requests(emp_id, request_note, request_date) VALUES (?, ?, ?)";

		try (Connection con = DBUtil.getConnection(); 
			PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, req.getEmpId());
			ps.setString(2, req.getRequestNote());
			ps.setTimestamp(3, req.getRequestDate());


			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
