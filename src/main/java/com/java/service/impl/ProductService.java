package com.java.service.impl;

import com.java.model.Product;
import com.java.repo.ProductRepo;
import com.java.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService implements IProductService {

    @Autowired
    ProductRepo productRepo;

    @Override
    public List<Product> getList() {
        return productRepo.findAll();
    }

    @Override
    public boolean create(Product product) {
        productRepo.save(product);
        return true;
    }

    @Override
    public boolean update(Product product) {
        productRepo.save(product);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        productRepo.deleteById(id);
        return true;
    }

    @Override
    public Product getById(Integer id) {
        Product result = productRepo.getById(id);
        return result;
    }

    @Override
    public Page<Product> listPaging(Pageable pageable) {
        return null;
    }
}
