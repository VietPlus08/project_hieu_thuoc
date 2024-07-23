package com.java.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private OrderList orderList;
    @ManyToOne
    private Product product;
    private int quantity;
//    @Column(columnDefinition = "bit default false")
    private boolean isDelete = false;
}
