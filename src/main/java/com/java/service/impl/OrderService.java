package com.java.service.impl;

import com.java.dto.OrderDto;
import com.java.dto.OrderItemDto;
import com.java.model.Customer;
import com.java.model.OrderItem;
import com.java.model.OrderList;
import com.java.model.Product;
import com.java.repo.OrderItemRepo;
import com.java.repo.OrderRepo;
import com.java.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService implements IOrderService {

    @Autowired
    OrderRepo orderRepo;

    @Autowired
    OrderItemRepo orderItemRepo;

    @Override
    public List<OrderList> getList() {
        return orderRepo.findAll();
    }

    @Override
    public boolean create(OrderList orderList) {
        orderRepo.save(orderList);
        return true;
    }

    @Override
    public boolean update(OrderList orderList) {
        orderRepo.save(orderList);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        orderRepo.deleteById(id);
        return true;
    }

    @Override
    public OrderList getById(Integer id) {
        OrderList result = orderRepo.getById(id);
        return result;
    }

    @Override
    public Page<OrderList> listPaging(Pageable pageable) {
        return null;
    }

    @Override
    public void createOrder(OrderDto orderDto){
        //create Order entity
        OrderList orderList = new OrderList();
        orderList.setOrderDate(Date.valueOf(LocalDate.now()));
//        orderList.setCustomer(new Customer(orderDto.getCustomerId()));
        orderList = orderRepo.save(orderList);

        //create OrderItem entity
        List<OrderItem> allOrderItems = new ArrayList<>();
        for (OrderItemDto item : orderDto.getOrderItems()) {
            if (item.getProductId() == 0) continue;
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(new Product(item.getProductId()));
            orderItem.setQuantity(item.getQuantity());
            orderItem.setOrderList(orderList);
            allOrderItems.add(orderItem);
        }
        orderItemRepo.saveAll(allOrderItems);
    }
}
