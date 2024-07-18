package com.java.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderItemDto {
    private int productId;
    private String productName;
    private int quantity;
    private double price;
}
