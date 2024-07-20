package com.java.service;

import com.java.model.Prescription;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IPrescriptionService {
    List<Prescription> getList();
    boolean create(Prescription prescription);
    boolean update(Prescription prescription);
    boolean delete(Integer id);
    Prescription getById(Integer id);
    Page<Prescription> listPaging(Pageable pageable);
}
