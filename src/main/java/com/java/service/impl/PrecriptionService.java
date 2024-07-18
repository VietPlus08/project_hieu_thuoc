package com.java.service.impl;

import com.java.model.Prescription;
import com.java.model.PrescriptionItem;
import com.java.repo.PrescriptionRepo;
import com.java.service.IPrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrecriptionService implements IPrescriptionService {

    @Autowired
    PrescriptionRepo prescriptionRepo;

    @Override
    public List<Prescription> getList() {
        return prescriptionRepo.findAll();
    }

    @Override
    public boolean create(Prescription prescription) {
        prescriptionRepo.save(prescription);
        return true;
    }

    @Override
    public boolean update(Prescription prescription) {
        prescriptionRepo.save(prescription);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        prescriptionRepo.deleteById(id);
        return true;
    }

    @Override
    public Prescription getById(Integer id) {
        Prescription result = prescriptionRepo.getReferenceById(id);
        return result;
    }

    @Override
    public Page<Prescription> listPaging(Pageable pageable) {
        return null;
    }
}
