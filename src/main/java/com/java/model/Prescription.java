package com.java.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Getter @Setter
public class Prescription { // toa thuoc
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    private Customer customer;

    private Date prescriptionDate;

    @OneToMany(mappedBy = "prescription")
    private List<PrescriptionItem> prescriptionItems;
}
