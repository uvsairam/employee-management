package com.employee.dao;

import java.util.List;

import com.employee.dto.EmployeeDTO;
import com.employee.dto.ModificationRequestDTO;

public interface EmployeeInterface {

	public EmployeeDTO validateLogin(String email, String password);
	
	public boolean addEmployee(EmployeeDTO emp);
	
	public EmployeeDTO getEmployeeById(int empId);	
	
	public List<EmployeeDTO> getAllEmployees();
	
	public boolean updateEmployee(EmployeeDTO emp);

    public boolean deleteEmployee(int empId);
    
    public boolean isAdminLoggedIn();
    
    public boolean addRequest(int empId, String requestNote) throws Exception;
    
    public boolean saveModificationRequest(ModificationRequestDTO req);


}
