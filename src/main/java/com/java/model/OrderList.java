package com.java.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalTime;
import java.util.List;

@Entity
@Getter @Setter
public class OrderList { // bảng Order
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String orderCode;
    @ManyToOne
    private Customer customer;
    @ManyToOne
    private Employee employee;
    @OneToMany(mappedBy = "orderList", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<OrderItem> orderItems; // từ đối tượng order (orderId), ta lấy được các orderItem theo truy vấn sql
    private double total;
    private Date orderDate;
    private LocalTime orderTime;
    private boolean isDelete = false;

    public OrderList(Integer id) {
        this.id = id;
    }

    public OrderList() {
    }
}
