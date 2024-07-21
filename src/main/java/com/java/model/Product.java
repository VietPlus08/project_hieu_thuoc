package com.java.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(columnDefinition = "NVARCHAR(255)")
    private String name;
    @Column(columnDefinition = "NVARCHAR(255)")
    private String unit;
    @Column(columnDefinition = "NVARCHAR(255)")
    private String description;
    private double price;
    private int quantity;

    public Product(int productId) {
        this.id = productId;
    }

    public Product() {
    }
}