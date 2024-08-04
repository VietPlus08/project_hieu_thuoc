package com.java.service.impl;

import com.java.dto.FilterModel;
import com.java.dto.OrderDto;
import com.java.dto.OrderItemDto;
import com.java.model.*;
import com.java.repo.*;
import com.java.service.IOrderService;
import com.java.service.IProductService;
import com.java.utils.Const;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;
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
    public List<OrderList> filter(FilterModel filterModel) {
        if (filterModel.getStartTime() == null) {
            filterModel.setStartTime(LocalTime.MIDNIGHT);
        }
        if (filterModel.getEndTime() == null) {
            filterModel.setEndTime(LocalTime.of(23, 59));
        }
        List<OrderList> result = orderRepo.findOrders(filterModel.getStartDate(), filterModel.getEndDate());
        // filter "Khach si" , "Khach le"
        switch (filterModel.getOrderType1()){
            case Const.BAN_SI:
                result = result.stream().filter(it -> it.getCustomer() != null
                        && it.getCustomer().getName().equals(Const.KHACH_SI.getName())).collect(Collectors.toList());
                break;
            case Const.BAN_THEO_DON:
                result = result.stream().filter(it -> it.getCustomer() != null
                        && it.getCustomer().getName().equals(Const.KHACH_THEO_TOA.getName())).collect(Collectors.toList());
                break;
            default:
                result = result.stream().filter(it -> it.getCustomer() != null
                        && it.getCustomer().getName().equals(Const.KHACH_LE.getName())).collect(Collectors.toList());
                break;
        }

        switch (filterModel.getOrderType2()){
            case Const.TEN_KHACH:
                result = result.stream()
                        .filter(it -> it.getCustomer() != null && it.getCustomer().getName() != null)
                        .sorted(Comparator.comparing((OrderList it) -> it.getCustomer().getName()).reversed())
                        .collect(Collectors.toList());
                break;
            case Const.TONG_TIEN:
                result = result.stream()
                        .filter(it -> it.getTotal() != 0)
                        .sorted(Comparator.comparing((OrderList it) -> it.getTotal()).reversed())
                        .collect(Collectors.toList());
                break;
            default:
                result = result.stream()
//                        .filter(it -> it.getOrderDate() != 0)
                        .sorted(Comparator.comparing((OrderList it) -> it.getOrderDate()).reversed())
                        .collect(Collectors.toList());
                break;
        }

        return result;
//        return orderRepo.findOrdersWithinDateRange(filterModel.getStartDate(), filterModel.getStartTime(), filterModel.getEndDate(), filterModel.getEndTime());
    }

    @Override
    public Map<String, String> createOrder(OrderDto orderDto) {
        Map<String, String> error = new HashMap<>();

        // kiểm tra order có dữ liệu gửi xuống ko
        Pair<String, OrderDto> check = isOrderNull(orderDto);
        String messageError = check.getLeft();
        orderDto = check.getRight();
        if (orderDto == null) {
            error.put("NOT_VALID", messageError);
            return error;
        }

        //create OrderItem entity
        List<OrderItem> allOrderItems = new ArrayList<>();
        // foreach qua orderDto, lấy ra tất orderItem --> productId
        List<Integer> productIds = new ArrayList<>();
        for (OrderItemDto item : orderDto.getOrderItems()) {
            productIds.add(item.getProductId());
        }

        // key-> productId, value -> product (quanity)
        Map<Integer, Product> inventoryProductHashMap = productService.getKeyValueInventoryProduct(productIds);

        double totalPrice = 0d;
        StringBuilder productsIsOut = new StringBuilder();
        for (OrderItemDto item : orderDto.getOrderItems()) {
            // Pair là kiểu dữ liệu key value, thư viện <artifactId>commons-lang3</artifactId>
            Pair<Product, Boolean> pair = checkProductAvailable(item, inventoryProductHashMap);
            Product currentProduct = pair.getLeft();
            boolean isAvailable = pair.getRight();
            if (isAvailable) {
                // còn hàng -> xử lý logic
                OrderItem orderItem = new OrderItem();
                orderItem.setProduct(new Product(item.getProductId()));
                orderItem.setQuantity(item.getQuantity());
                allOrderItems.add(orderItem); // list cần lưu db
                totalPrice += item.getQuantity() * currentProduct.getPrice();
            } else {
                // báo error
                if (productsIsOut.length() > 0) {
                    productsIsOut.append(", ");
                }
                productsIsOut.append(currentProduct.getName())
                        .append(" (số lượng còn lại: ")
                        .append(currentProduct.getQuantity())
                        .append(")");
            }

        }
        if (productsIsOut.length() > 0) {
            error.put("INVENTORY_IS_OUT", productsIsOut.toString());
            return error;
        }

        //create Order entity
        OrderList orderList = new OrderList();
        orderList.setOrderDate(Date.valueOf(LocalDate.now()));
        orderList.setCustomer(getCustomer(Const.KHACH_LE.getName()));
        Employee employee = employeeRepo.findByName(orderDto.getEmployeeName());
        orderList.setEmployee(employee);
        orderList.setOrderTime(LocalTime.now());
        orderList = orderRepo.save(orderList); // return orderlist có Id

        // save order items
        for (OrderItem item : allOrderItems) {
            // khóa ngoại oder
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
    public OrderDto createForm(String name) {
        OrderDto orderDto = new OrderDto();

        // Tạo mã hóa đơn
        orderDto.setOrderCode(getCurrentOrderCode());
        orderDto.setCustomerName(Const.KHACH_LE.getName());
        orderDto.setEmployeeName(name);
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

    private Pair<String, OrderDto> isOrderNull(OrderDto orderDto) {
        List<OrderItemDto> list = new ArrayList<>();
        for (OrderItemDto item : orderDto.getOrderItems()) {
            if (item.getProductId() == 0) {
                continue;
            }
            if (item.getQuantity() <= 0){
                return Pair.of("Vui long nhập số lượng là số dương.", null);
            }
            list.add(item);
        }
        orderDto.setOrderItems(list);
        return list.isEmpty()
                ? Pair.of("Vui lòng chọn số lượng thuốc.", null)
                : Pair.of("Success", orderDto);
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
