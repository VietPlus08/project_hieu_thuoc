package com.java.service;

import com.java.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> getList();
    boolean create(Product product);
    boolean update(Product product);
    boolean delete(Integer id);
    Product getById(Integer id);
    Page<Product> listPaging(Pageable pageable);
    Map<Integer, Product> getKeyValueInventoryProduct(List<Integer> productIds);
    boolean updateInventory(Map<Integer, Product> inventoryProductHashMap);
}
