package com.java.service.impl;

import com.java.dto.OrderDto;
import com.java.dto.OrderItemDto;
import com.java.model.*;
import com.java.repo.*;
import com.java.service.IOrderService;
import com.java.service.IProductService;
import com.java.utils.Const;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;
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
        return orderRepo.findAll().stream().filter(it -> !it.isDelete()).collect(Collectors.toList());
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
        Optional<OrderList> order = orderRepo.findById(id);
        if (order.isPresent()) {
            order.get().setDelete(true);
            orderRepo.save(order.get());
            return true;
        }
        return false;
    }

    @Override
    public OrderList getById(Integer id) {
        return orderRepo.findById(id).orElse(null);
    }

    @Override
    public Page<OrderList> listPaging(Pageable pageable) {
        return null;
    }

    @Override
    public Map<String, String> createOrder(OrderDto orderDto) {
        Map<String, String> error = new HashMap<>();

        // kiểm tra order có dữ liệu gửi xuống ko
        orderDto = isOrderNull(orderDto);
        if (orderDto == null) {
            error.put("NOT_VALID", "Vui lòng chọn số lượng thuốc.");
            return error;
        }

        //create OrderItem entity
        List<OrderItem> allOrderItems = new ArrayList<>();
        List<Integer> productIds = orderDto.getOrderItems()
                .stream().map(OrderItemDto::getProductId)
                .collect(Collectors.toList());
        Map<Integer, Product> inventoryProductHashMap = productService.getKeyValueInventoryProduct(productIds);

        double totalPrice = 0d;
        StringBuilder productsIsOut = new StringBuilder();
        for (OrderItemDto item : orderDto.getOrderItems()) {
            // Pair là kiểu dữ liệu key value, thư viện <artifactId>commons-lang3</artifactId>
            Pair<Product, Boolean> pair = checkProductAvailable(item, inventoryProductHashMap);
            Product currentProduct = pair.getLeft();
            boolean isAvailable = pair.getRight();
            if (isAvailable) {
                OrderItem orderItem = new OrderItem();
                orderItem.setProduct(new Product(item.getProductId()));
                orderItem.setQuantity(item.getQuantity());
                allOrderItems.add(orderItem);
                totalPrice += item.getQuantity() * currentProduct.getPrice();
                continue;
            }
            if (productsIsOut.length() > 0) {
                productsIsOut.append(", ");
            }
            productsIsOut.append(currentProduct.getName())
                    .append(" (số lượng còn lại: ")
                    .append(currentProduct.getQuantity())
                    .append(")");
        }
        if (productsIsOut.length() > 0) {
            error.put("INVENTORY_IS_OUT", productsIsOut.toString());
            return error;
        }

        //create Order entity
        OrderList orderList = new OrderList();
        orderList.setOrderDate(Date.valueOf(LocalDate.now()));
        orderList.setCustomer(getCustomer(Const.KHACH_LE.getName()));
        orderList.setEmployee(getCurrentEmployee());
        orderList.setOrderTime(LocalTime.now());
        orderList = orderRepo.save(orderList);

        // save order items
        for (OrderItem item : allOrderItems) {
            item.setOrderList(orderList);
        }
        orderItemRepo.saveAll(allOrderItems);

        // update total price cho order
        orderList.setTotal(totalPrice);
        orderList.setOrderCode(String.format("HDL%05d", orderList.getId()));
        orderList = orderRepo.save(orderList);

        // cập nhật lại inventory
        productService.updateInventory(inventoryProductHashMap);
        return error;
    }

    @Override
    public OrderDto createForm() {
        OrderDto orderDto = new OrderDto();

        // Tạo mã hóa đơn
        orderDto.setOrderCode(getCurrentOrderCode());
        orderDto.setCustomerName(Const.KHACH_LE.getName());
        orderDto.setEmployeeName(Const.CURRENT_EMPLOYEE.getName());
        orderDto.setOrderDate(Date.valueOf(LocalDate.now()));
        return orderDto;
    }

    @Override
    public OrderList showDetailOrder(Integer id) {
        Optional<OrderList> optional = orderRepo.findById(id);
        if (optional.isPresent()) {
            OrderList order = optional.get();
            List<OrderItem> orderItems = orderItemRepo.getOrderItemByOrderList(order);
            order.setOrderItems(orderItems);
            return order;
        }
        return null;
    }

    private Integer generateId() {
        Integer id = orderRepo.findTopByOrderByIdDesc().getId();
        if (id == null) {
            return 1;
        }
        return id + 1;
    }

    private Pair<Product, Boolean> checkProductAvailable(OrderItemDto orderItem, Map<Integer, Product> inventoryProducts) {
        Product inventoryProduct = inventoryProducts.get(orderItem.getProductId());
        if (inventoryProduct.getQuantity() >= orderItem.getQuantity()) {
            inventoryProduct.setQuantity(inventoryProduct.getQuantity() - orderItem.getQuantity());
            return Pair.of(inventoryProduct, true);
        }
        return Pair.of(inventoryProduct, false);
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

    private String getCurrentOrderCode() {
        OrderList lastOrder = orderRepo.findTopByOrderByIdDesc();
        if (lastOrder == null) {
            return String.format("HDL%05d", 1);
        }
        return String.format("HDL%05d", lastOrder.getId() + 1);
    }

    private Customer getCustomer(String customer) {
        return customerRepo.findByName(customer);
    }

    private Employee getCurrentEmployee() {
        return employeeRepo.findByName(Const.CURRENT_EMPLOYEE.getName());
    }
}
