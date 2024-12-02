<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/01/2024
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        .table thead {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="card shadow-lg">
        <div class="card-header text-center">
            Danh sách sản phẩm
        </div>
        <div class="card-body">
            <div class="mb-3 text-end">
                <a href="products?action=addProductForm" class="btn btn-custom">Thêm sản phẩm</a>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>Tên Sản Phẩm</th>
                        <th>Giá Sản Phẩm</th>
                        <th>Màu Sản Phẩm</th>
                        <th>Chức Năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty products}">
                        <tr>
                            <td colspan="4" class="text-center">Không có sản phẩm nào để hiển thị.</td>
                        </tr>
                    </c:if>
                    <c:forEach var="products" items="${products}">
                        <tr>
                            <td>${products.name}</td>
                            <td><fmt:formatNumber value="${products.price}" type="currency" currencySymbol="₫" /></td>
                            <td>${products.color}</td>
                            <td>
                                <a href="products?action=viewProduct&id=${products.id}" class="btn btn-info btn-sm">Xem</a>
                                <a href="products?action=editProductForm&id=${products.id}" class="btn btn-warning btn-sm me-2">Sửa</a>
                                <a href="products?action=deleteProduct&id=${products.id}" class="btn btn-danger btn-sm me-2" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>