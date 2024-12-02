<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/02/2024
  Time: 02:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Sản Phẩm</title>
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
            background-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="card shadow-lg">
        <div class="card-header text-center">
            Chỉnh Sửa Sản Phẩm
        </div>
        <div class="card-body">
            <form action="products" method="post">
                <input type="hidden" name="action" value="editProduct"/>
                <input type="hidden" name="id" value="${products.id}"/>

                <div class="mb-3">
                    <label for="name" class="form-label">Tên Sản Phẩm</label>
                    <input type="text" class="form-control" id="name" name="name" value="${products.name}" required>
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Giá</label>
                    <input type="text" class="form-control" id="price" name="price"
                           value="<fmt:formatNumber value='${products.price}' pattern='###,###,###' />" required>
                </div>

                <div class="mb-3">
                    <label for="color" class="form-label">Màu Sắc</label>
                    <input type="text" class="form-control" id="color" name="color" value="${products.color}" required>
                </div>

                <div class="mt-4 text-end">
                    <a href="products?action=listProducts" class="btn btn-secondary me-2">Quay lại</a>
                    <button type="submit" class="btn btn-custom">Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
