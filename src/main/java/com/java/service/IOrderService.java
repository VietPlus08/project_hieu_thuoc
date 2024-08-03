package com.java.service;

import com.java.dto.FilterModel;
import com.java.dto.OrderDto;
import com.java.model.OrderList;

import java.util.List;
import java.util.Map;

public interface IOrderService {
    List<OrderList> getList();
    boolean create(OrderList orderList);
    boolean update(OrderList orderList);
    boolean delete(Integer id);
    OrderList getById(Integer id);
    List<OrderList> filter(FilterModel filterModel);
    Map<String, String> createOrder(OrderDto order);
    OrderDto createForm(String name);
    OrderList showDetailOrder(Integer id);
}
