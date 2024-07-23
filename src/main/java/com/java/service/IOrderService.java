package com.java.service;

import com.java.dto.OrderDto;
import com.java.model.OrderList;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IOrderService {
    List<OrderList> getList();
    boolean create(OrderList orderList);
    boolean update(OrderList orderList);
    boolean delete(Integer id);
    OrderList getById(Integer id);
    Page<OrderList> listPaging(Pageable pageable);
    Map<String, String> createOrder(OrderDto order);
    OrderDto createForm();
    OrderList showDetailOrder(Integer id);
}
