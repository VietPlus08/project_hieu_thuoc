package com.java.service.impl;

import com.java.dto.EmployeeDto;
import com.java.model.Employee;
import com.java.model.OrderList;
import com.java.repo.EmployeeRepo;
import com.java.repo.OrderRepo;
import com.java.service.IEmployeeService;
import com.java.utils.Const;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService implements IEmployeeService {

    @Autowired
    private EmployeeRepo employeeRepo;

    @Autowired
    private OrderRepo orderRepo;

    @Override
    public List<Employee> getList() {
        return employeeRepo.findAll();
    }

    @Override
    public Employee create(EmployeeDto dto) {
        Employee employee = new Employee();
        employee.setName(dto.getName());
        employee.setAddress(dto.getAddress());
        employee.setEmail(dto.getEmail());
        employee.setAccount(dto.getAccount());
        employee.setPassword(dto.getPassword());

        employee = employeeRepo.save(employee);
        return employee;
    }

    @Override
    public boolean update(Employee employee) {
        Employee result = employeeRepo.save(employee);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        // find odder and update null
        List<OrderList> odders = orderRepo.findByEmp(id);
        for (OrderList order: odders) {
            order.setEmployee(null);
        }
        orderRepo.saveAll(odders);

        //
        employeeRepo.deleteById(id);
        return true;
    }

    @Override
    public Employee getById(Integer id) {
        return employeeRepo.findById(id).orElse(null);
    }

    @Override
    public Employee getByName(String name) {
        return employeeRepo.findByName(name);
    }

    @Override
    public Page<Employee> listPaging(Pageable pageable) {
        return null;
    }

    @Override
    public Pair<Boolean, Employee> authenticate(String username, String password) {
        if (username == null || username.isEmpty() || password == null || password.isEmpty()){
            return Pair.of(false, null);
        }

        Employee employee = employeeRepo.findByAccount(username);
        if (employee == null || !employee.getPassword().equals(password)) {
            return Pair.of(false, null);
        }
        return Pair.of(true, employee);
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
