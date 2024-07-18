package com.java.repo;

import com.java.model.OrderList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepo extends JpaRepository<OrderList, Integer> {
}
