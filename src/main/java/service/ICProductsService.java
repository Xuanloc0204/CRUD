package service;

import model.Products;

import java.util.List;

public interface ICProductsService {
    List<Products> findAll();

    void add(Products products);

    Products findById(int id);
    int getNextId();
    void update( Products products);

    void delete(int id);
}
