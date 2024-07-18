package com.java.dto;

import com.java.model.Customer;
import com.java.model.OrderItem;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.List;

@Getter @Setter
public class OrderDto {
//    private Integer id;
    private int customerId;
    private List<OrderItemDto> orderItems;
}
