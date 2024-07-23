package com.java.service;

import com.java.model.Customer;
import com.java.model.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IEmployeeService {
    List<Employee> getList();
    boolean create(Employee employee);
    boolean update(Employee employee);
    boolean delete(Integer id);
    Employee getById(Integer id);
    Page<Employee> listPaging(Pageable pageable);
    boolean authenticate(String username, String password);
}
