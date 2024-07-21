package com.java.service;

import com.java.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.HashMap;
import java.util.List;

public interface IProductService {
    List<Product> getList();
    boolean create(Product product);
    boolean update(Product product);
    boolean delete(Integer id);
    Product getById(Integer id);
    Page<Product> listPaging(Pageable pageable);
    HashMap<Integer, Product> getKeyValueInventoryProduct(List<Integer> productIds);

    boolean saveHashMapProduct(HashMap<Integer, Product> inventoryProductHashMap);
}
