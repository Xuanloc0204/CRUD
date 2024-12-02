<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/02/2024
  Time: 02:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }
    </style>
</head>
<body class="bg-light">
<div class="container my-5">
    <div class="card">
        <div class="card-header bg-success text-white text-center py-3">
            <h1 class="fw-bold">Thêm Sản Phẩm</h1>
        </div>
        <div class="card-body p-4">
            <form action="products" method="post">
                <input type="hidden" name="action" value="addProduct"/>
                <div class="mb-3">
                    <label for="name" class="form-label">Tên Sản Phẩm</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Giá</label>
                    <input type="text" step="0.01" class="form-control" id="price" name="price" required>
                </div>

                <div class="mb-3">
                    <label for="color" class="form-label">Màu Sắc</label>
                    <input type="text" class="form-control" id="color" name="color" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Thêm Sản Phẩm</button>
            </form>
            <div class="mt-4">
                <a href="products?action=listProducts" class="btn btn-secondary w-100">Quay lại</a>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("price").addEventListener("input", formatCurrency);

    function formatCurrency() {
        let inputNumber = document.getElementById("price");
        let onlyNumber = inputNumber.value.split(",").join("").replace(/[^0-9]/g, '');
        inputNumber.value = Number(onlyNumber).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
