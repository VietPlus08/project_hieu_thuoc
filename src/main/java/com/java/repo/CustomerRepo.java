package com.java.repo;

import com.java.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
    // custom method để tạo ra các câu lệnh sql
    Customer findByName(String name);
}
