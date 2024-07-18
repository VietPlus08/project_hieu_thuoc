package com.java.service.impl;

import com.java.model.OrderItem;
import com.java.repo.OrderItemRepo;
import com.java.service.IOrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemService implements IOrderItemService {

    @Autowired
    OrderItemRepo orderItemRepo;

    @Override
    public List<OrderItem> getList() {
        return orderItemRepo.findAll();
    }

    @Override
    public boolean create(OrderItem item) {
        orderItemRepo.save(item);
        return true;
    }

    @Override
    public boolean update(OrderItem item) {
        orderItemRepo.save(item);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        orderItemRepo.deleteById(id);
        return true;
    }

    @Override
    public OrderItem getById(Integer id) {
        OrderItem result = orderItemRepo.getById(id);
        return result;
    }

    @Override
    public Page<OrderItem> listPaging(Pageable pageable) {
        return null;
    }
}
