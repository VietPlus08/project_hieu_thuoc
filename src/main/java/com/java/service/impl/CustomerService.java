package com.java.service.impl;

import com.java.model.Customer;
import com.java.repo.CustomerRepo;
import com.java.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepo customerRepo;

    public List<Customer> getList() {
        return customerRepo.findAll();
    }

    @Override
    public Customer create(Customer customer) {
        Customer result = customerRepo.save(customer);
        return result;
    }

    @Override
    public boolean update(Customer customer) {
        Customer result = customerRepo.save(customer);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        customerRepo.deleteById(id);
        return true;
    }

    @Override
    public Customer getById(Integer id) {
        Customer result = customerRepo.getById(id);
        return result;
    }

    @Override
    public Page<Customer> listPaging(Pageable pageable) {
        return null;
    }
}
