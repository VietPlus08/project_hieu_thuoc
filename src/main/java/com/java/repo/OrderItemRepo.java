package com.java.repo;

import com.java.model.OrderItem;
import com.java.model.OrderList;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderItemRepo extends JpaRepository<OrderItem, Integer> {
    List<OrderItem> getOrderItemByOrderList(OrderList orderList);
}
