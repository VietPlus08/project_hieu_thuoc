package com.java.service.impl;

import com.java.model.Product;
import com.java.repo.ProductRepo;
import com.java.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ProductService implements IProductService {

    @Autowired
    ProductRepo productRepo;

    @Override
    public List<Product> getList() {
        return productRepo.findAll().stream().filter(it -> !it.isDelete()).collect(Collectors.toList());
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

    @Override
    public Map<Integer, Product> getKeyValueInventoryProduct(List<Integer> productIds) {
        HashMap<Integer, Product> hashMap = new HashMap<>();
        List<Product> products = productRepo.findAllById(productIds);
        for (Product product : products) {
            hashMap.put(product.getId(), product);
        }
        return hashMap;
    }

    @Override
    public boolean updateInventory(Map<Integer, Product> inventoryProductHashMap) {
        List<Product> products = new ArrayList<>(inventoryProductHashMap.values());
        productRepo.saveAll(products);
        return true;
    }
}
