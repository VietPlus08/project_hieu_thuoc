package com.java.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String phone;
    @Column(columnDefinition = "NVARCHAR(255)")
    private String name;
    private String address;
    private String email;
    private int age;
    private boolean isDelete = false;

    public Customer(Integer id) {
        this.id = id;
    }

    public Customer(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Customer() {
    }
}
