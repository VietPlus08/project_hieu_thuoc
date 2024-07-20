package com.java.service.impl;

import com.java.model.Prescription;
import com.java.model.PrescriptionItem;
import com.java.repo.PrescriptionItemRepo;
import com.java.service.IPrescriptionItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrecriptionItemService implements IPrescriptionItemService {

    @Autowired
    PrescriptionItemRepo prescriptionItemRepo;

    @Override
    public List<PrescriptionItem> getList() {
        return prescriptionItemRepo.findAll();
    }

    @Override
    public boolean create(PrescriptionItem prescription) {
        prescriptionItemRepo.save(prescription);
        return true;
    }

    @Override
    public boolean update(PrescriptionItem prescription) {
        prescriptionItemRepo.save(prescription);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        prescriptionItemRepo.deleteById(id);
        return true;
    }

    @Override
    public PrescriptionItem getById(Integer id) {
        PrescriptionItem result = prescriptionItemRepo.getById(id);
        return result;
    }

    @Override
    public Page<PrescriptionItem> listPaging(Pageable pageable) {
        return null;
    }
}
