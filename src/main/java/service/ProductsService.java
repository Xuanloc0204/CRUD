package service;

import model.Products;

import java.util.ArrayList;
import java.util.List;

public class ProductsService implements ICProductsService{
    private final List<Products> products;

    public ProductsService() {
        products = new ArrayList<>();
        products.add(new Products(1, "Iphone 16 Pro Max", 1500, "Vàng"));
        products.add(new Products(2, "Samsung s23", 1000, "Đen"));
        products.add(new Products(3, "Xiaomi Mi Max", 2000, "Xanh"));
        products.add(new Products(4, "Nokia X5", 3000, "Đỏ"));
        products.add(new Products(5, "LG E400", 2500, "Tím"));
    }


    @Override
    public List<Products> findAll() {
        return products;
    }

    @Override
    public void add(Products product) {
        products.add(product);
    }

    @Override
    public Products findById(int id) {
        return products.stream().filter(p -> p.getId() == id).findFirst().orElse(null);
    }

    @Override
    public void update(Products products) {
        Products existingProduct = findById(products.getId());
        if (existingProduct != null) {
            existingProduct.setName(products.getName());
            existingProduct.setPrice(products.getPrice());
            existingProduct.setColor(products.getColor());
        }
    }

    @Override
    public void delete(int id) {
        products.removeIf(p -> p.getId() == id);

    }

    @Override
    public int getNextId() {
        int maxId = 0;
        for (Products products : products) {
            if (products.getId() > maxId) {
                maxId = products.getId();
            }
        }
        return maxId + 1;
    }

}
