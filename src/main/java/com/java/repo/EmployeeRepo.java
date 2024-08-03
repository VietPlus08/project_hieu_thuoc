package com.java.repo;

import com.java.model.Customer;
import com.java.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepo extends JpaRepository<Employee, Integer> {
    Employee findByName(String name);

    Employee findByAccount(String account);
}
