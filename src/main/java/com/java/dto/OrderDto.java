package com.java.dto;

import com.java.model.Customer;
import com.java.model.OrderItem;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.sql.Date;
import java.util.List;

@Getter @Setter
public class OrderDto {
//    private Integer id;
    private String orderCode;
    private String employeeId;
    private String employeeName;
    private int customerId;
    private String customerName;
    private Date orderDate;
    private List<OrderItemDto> orderItems;
}
