package com.java.service.impl;

import com.java.dto.OrderDto;
import com.java.dto.OrderItemDto;
import com.java.model.*;
import com.java.repo.*;
import com.java.service.IOrderService;
import com.java.service.IProductService;
import com.java.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

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

    @Autowired
    ProductRepo productRepo;

    @Autowired
    IProductService productService;

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
    public boolean createOrder(OrderDto orderDto) {
        // kiểm tra order có dữ liệu gửi xuống ko
        orderDto = isOrderNull(orderDto);
        if (orderDto == null) return false;

        //create Order entity
        OrderList orderList = new OrderList();
        orderList.setOrderDate(Date.valueOf(LocalDate.now()));
        orderList.setCustomer(getCustomer(Const.KHACH_LE.getName()));
        orderList.setEmployee(getCurrentEmployee());
        orderList.setOrderTime(LocalTime.now());
        orderList = orderRepo.save(orderList);

        //create OrderItem entity
        List<OrderItem> allOrderItems = new ArrayList<>();
        List<Integer> productIds = orderDto.getOrderItems().stream().map(OrderItemDto::getProductId).collect(Collectors.toList());
        HashMap<Integer, Product> inventoryProductHashMap = productService.getKeyValueInventoryProduct(productIds);

        double totalPrice = 0d;
        for (OrderItemDto item : orderDto.getOrderItems()) {
            if (isProductAvailable(item, inventoryProductHashMap)) {
                OrderItem orderItem = new OrderItem();
                orderItem.setProduct(new Product(item.getProductId()));
                orderItem.setQuantity(item.getQuantity());
                orderItem.setOrderList(orderList);
                allOrderItems.add(orderItem);
                totalPrice += item.getQuantity() * item.getPrice();
                continue;
            }
            // cần xử lý lấy ra list gửi lại fe -> chưa làm
            return false;
        }
        orderItemRepo.saveAll(allOrderItems);

        // câp nhật total price cho order
        orderList.setTotal(totalPrice);
        orderList = orderRepo.save(orderList);

        // cập nhật lại inventory
        productService.saveHashMapProduct(inventoryProductHashMap);
        return true;
    }

    private boolean isProductAvailable(OrderItemDto orderItem, HashMap<Integer, Product> inventoryProducts) {
        if (inventoryProducts.containsKey(orderItem.getProductId())) {
            Product inventoryProduct = inventoryProducts.get(orderItem.getProductId());
            if (inventoryProduct.getQuantity() >= orderItem.getQuantity()) {
                inventoryProduct.setQuantity(inventoryProduct.getQuantity() - orderItem.getQuantity());
                return true;
            }
        }
        return false;
    }

    private OrderDto isOrderNull(OrderDto orderDto) {
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
        orderDto.setOrderCode(getLastOrder());

        orderDto.setCustomerName(Const.KHACH_LE.getName());
        orderDto.setEmployeeName(Const.CURRENT_EMPLOYEE.getName());
        orderDto.setOrderDate(Date.valueOf(LocalDate.now()));
        return orderDto;
    }

    private String getLastOrder() {
        OrderList lastOrder = orderRepo.findTopByOrderByIdDesc();
        if (lastOrder == null) {
            return String.format("HDL%05d", 1);
        }
        return String.format("HDL%05d", lastOrder.getId());
    }

    private Customer getCustomer(String customer) {
        return customerRepo.findByName(customer);
    }

    private Employee getCurrentEmployee() {
        return employeeRepo.findByName(Const.CURRENT_EMPLOYEE.getName());
    }
}
