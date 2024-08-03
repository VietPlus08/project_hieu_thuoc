package com.java.service;

import com.java.dto.EmployeeDto;
import com.java.model.Employee;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IEmployeeService {
    List<Employee> getList();

    Employee create(EmployeeDto employee);

    boolean update(Employee employee);

    boolean delete(Integer id);

    Employee getById(Integer id);

    Employee getByName(String name);

    Page<Employee> listPaging(Pageable pageable);

    Pair<Boolean, Employee> authenticate(String username, String password);

    public void updateStaticAccount();
}
