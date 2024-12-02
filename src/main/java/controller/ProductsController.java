package controller;


import model.Products;
import service.ProductsService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductsController", urlPatterns = "/products")
public class ProductsController extends HttpServlet {
    private final ProductsService productsService = new ProductsService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                listProducts(req, resp);
                break;
            case "viewProduct":
                viewProduct(req, resp);
                break;
            case "addProductForm":
                showAddProductForm(req, resp);
                break;
            case "editProductForm":
                showEditProductForm(req, resp);
                break;
            case "deleteProduct":
                deleteProduct(req, resp);
                break;
            default:
                listProducts(req, resp);
                break;
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int productId = Integer.parseInt(req.getParameter("id"));
        productsService.delete(productId);
        resp.sendRedirect("products?action=list");
    }

    private void showEditProductForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("id"));
        Products products = productsService.findById(productId);
        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("editForm.jsp");
        dispatcher.forward(req, resp);
    }

    private void showAddProductForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("addForm.jsp");
        dispatcher.forward(req, resp);
    }

    private void viewProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Products products = productsService.findById(id);
        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("view.jsp");
        dispatcher.forward(req, resp);
    }

    private void listProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Products> products = productsService.findAll();
        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp");
        dispatcher.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addProduct":
                addProduct(req, resp);
                break;
            case "editProduct":
                editProduct(req, resp);
                break;
            default:
                listProducts(req, resp);
                break;
        }
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");

        String priceHavePattern = req.getParameter("price");
        String priceOnlyHaveNumber = priceHavePattern.replaceAll("[^0-9]", "");
        double price = Double.parseDouble(priceOnlyHaveNumber);


        String color = req.getParameter("color");
        Products products = new Products(id, name, price, color);
        productsService.update(products);
        resp.sendRedirect("products?action=listProducts");
    }

    private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = productsService.getNextId();
        String name = req.getParameter("name");


        String priceHavePattern = req.getParameter("price");
        String priceOnlyHaveNumber = priceHavePattern.replaceAll("[^0-9]", "");
        double price = Double.parseDouble(priceOnlyHaveNumber);


        String color = req.getParameter("color");
        Products products = new Products(id, name, price, color);
        productsService.add(products);
        resp.sendRedirect("products?action=listProducts");
    }
}
