package com.java.service;

import com.java.model.PrescriptionItem;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IPrescriptionItemService {
    List<PrescriptionItem> getList();
    boolean create(PrescriptionItem item);
    boolean update(PrescriptionItem item);
    boolean delete(Integer id);
    PrescriptionItem getById(Integer id);
    Page<PrescriptionItem> listPaging(Pageable pageable);
}
