package com.java.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;

@Entity
@Getter @Setter
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String phone;
//    @Column(columnDefinition = "NVARCHAR(255)")
//    @NotBlank(message = "Vui lòng nhập")
//    @Length(min = 5, max = 10)
    private String name;
//    @NotBlank(message = "Vui lòng nhập")
    private String address;
//    @Email(message = "Vui lòng nhập đúng định dạng email")
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
