package com.java.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(columnDefinition = "NVARCHAR(255)")
    private String name;
    private String address;
    private String email;
    private int age;
    private String account;
    private String password;
    private String role;

    public Employee(Integer id) {
        this.id = id;
    }

    public Employee(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Employee() {
    }
}
