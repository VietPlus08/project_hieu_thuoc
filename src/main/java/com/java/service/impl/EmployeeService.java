package com.java.service.impl;

import com.java.model.Customer;
import com.java.model.Employee;
import com.java.repo.EmployeeRepo;
import com.java.service.IEmployeeService;
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
        Employee result = employeeRepo.getById(id);
        return result;
    }

    @Override
    public Page<Employee> listPaging(Pageable pageable) {
        return null;
    }

    @Override
    public boolean authenticate(String username, String password) {
        return false;
    }
}
