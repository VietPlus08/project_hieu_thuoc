package com.java.service;

import com.java.model.OrderItem;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IOrderItemService {
    List<OrderItem> getList();
    boolean create(OrderItem item);
    boolean update(OrderItem item);
    boolean delete(Integer id);
    OrderItem getById(Integer id);
    Page<OrderItem> listPaging(Pageable pageable);
}
