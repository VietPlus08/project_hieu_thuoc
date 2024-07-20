package com.java.service.impl;

import com.java.dto.OrderDto;
import com.java.dto.OrderItemDto;
import com.java.model.*;
import com.java.repo.CustomerRepo;
import com.java.repo.EmployeeRepo;
import com.java.repo.OrderItemRepo;
import com.java.repo.OrderRepo;
import com.java.service.IOrderService;
import com.java.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService implements IOrderService {

    @Autowired
    OrderRepo orderRepo;

    @Autowired
    OrderItemRepo orderItemRepo;

    @Autowired
    CustomerRepo customerRepo;

    @Autowired
    EmployeeRepo employeeRepo;

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
    public boolean createOrder(OrderDto orderDto){
        // kiểm tra order có dữ liệu gửi xuống ko
        orderDto = orderisNull(orderDto);
        if (orderDto == null) return false;

        //create Order entity
        OrderList orderList = new OrderList();
        orderList.setOrderDate(Date.valueOf(LocalDate.now()));
        orderList.setCustomer(getCustomer(Const.KHACH_LE.getName()));
        orderList.setEmployee(getEmployee(Const.CURRENT_EMPLOYEE.getName()));
        orderList.setOrderTime(LocalTime.now());
        orderList = orderRepo.save(orderList);

        //create OrderItem entity
        List<OrderItem> allOrderItems = new ArrayList<>();
        for (OrderItemDto item : orderDto.getOrderItems()) {
//            if (item.getProductId() == 0) continue;
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(new Product(item.getProductId()));
            orderItem.setQuantity(item.getQuantity());
            orderItem.setOrderList(orderList);
            allOrderItems.add(orderItem);
        }
        orderItemRepo.saveAll(allOrderItems);
        return true;
    }

    private OrderDto orderisNull(OrderDto orderDto) {
        List<OrderItemDto> list = new ArrayList<>();
        for (OrderItemDto item : orderDto.getOrderItems()) {
            if (item.getProductId() == 0) continue;
            list.add(item);
        }
        orderDto.setOrderItems(list);
        return list.isEmpty() ? null : orderDto;
    }

    @Override
    public OrderDto createForm() {
        OrderDto orderDto = new OrderDto();

        // Tạo mã hóa đơn
        OrderList lastOrder = orderRepo.findTopByOrderByIdDesc();
        String orderCode = String.format("HDL%05d", lastOrder.getId());
        orderDto.setOrderCode(orderCode);

        orderDto.setCustomerName("Khách lẻ");
        orderDto.setEmployeeName("Nguyễn Hoàng Nhật");
        orderDto.setOrderDate(Date.valueOf(LocalDate.now()));
        return orderDto;
    }

    private Customer getCustomer(String customer){
        return customerRepo.findByName(customer);
    }

    private Employee getEmployee(String employee){
        return employeeRepo.findByName(employee);
    }
}
