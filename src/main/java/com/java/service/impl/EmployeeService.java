package com.java.service.impl;

import com.java.model.Employee;
import com.java.repo.EmployeeRepo;
import com.java.service.IEmployeeService;
import com.java.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService implements IEmployeeService {

    @Autowired
    private EmployeeRepo employeeRepo;

    @Override
    public List<Employee> getList() {
        return null;
    }

    @Override
    public boolean create(Employee employee) {
        Employee result = employeeRepo.save(employee);
        return true;
    }

    @Override
    public boolean update(Employee employee) {
        Employee result = employeeRepo.save(employee);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        employeeRepo.deleteById(id);
        return true;
    }

    @Override
    public Employee getById(Integer id) {
        return employeeRepo.findById(id).orElse(null);
    }

    @Override
    public Page<Employee> listPaging(Pageable pageable) {
        return null;
    }

    @Override
    public boolean authenticate(String username, String password) {
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) return false;
        Employee employee = employeeRepo.findByAccount(username);
        if (employee == null) return false;
        return employee.getPassword().equals(password);
    }

    public void updateStaticAccount() {
        Employee employee = employeeRepo.findById(Const.CURRENT_EMPLOYEE.getId()).orElse(null);
        if (employee == null) {
            employee = new Employee();
            employee.setName("Bác Nhật");
            employee.setEmail("nhat@gmail.com");
            employee.setAccount("nhat");
            employee.setPassword("1234");
            employeeRepo.save(employee);
        }
    }
}
