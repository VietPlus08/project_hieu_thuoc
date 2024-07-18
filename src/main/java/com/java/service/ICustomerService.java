package com.java.service;

import com.java.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICustomerService {
    List<Customer> getList();
    Customer create(Customer customer);
    boolean update(Customer customer);
    boolean delete(Integer id);
    Customer getById(Integer id);
    Page<Customer> listPaging(Pageable pageable);
}
