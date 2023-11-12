<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .product img {
            max-width: 50px;
            max-height: 50px;
            margin-right: 10px;
        }

        .product-info {
            flex-grow: 1;
        }

        .quantity {
            display: flex;
            align-items: center;
        }

        .quantity input {
            width: 30px;
            margin: 0 10px;
        }

        .total-price {
            font-weight: bold;
        }

        .action-buttons {
            text-align: right;
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            margin-right: 10px;
        }

        .button:hover {
            background-color: #00b8ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Giỏ hàng</h1>

        <c:set var="totalPrice" value="0" />
        <c:forEach items="${requestScope.list}" var="c">
            <div class="product">
                <div class="product-info">
                    
                    <span>${c.name}</span>
                </div>
                <div class="quantity">
                    <form action="http://localhost:8080/dien_thoai3/editcart" method="post">
                        <input type="hidden" name="uid" value="${c.uid}">
						<input type="hidden" name="pid" value="${c.pid}">
						<button type="submit" name="action" value="decrease">-</button>
                        <input type="number" name="quantity" value="${c.quantity}">
                        <button type="submit" name="action" value="increase">+</button>
                        <button type="submit" name="action" value="remove">Xóa</button>
                    </form>
                </div>
                <div class="total-price">${c.price * c.quantity}VNĐ</div>
            </div>
            <c:set var="totalPrice" value="${totalPrice + (c.price * c.quantity)}" />
        </c:forEach>																											

        <div class="action-buttons">
            <a href="http://localhost:8080/dien_thoai3/home" class="button">Tiếp tục mua sắm</a>
            <a href="#" class="button">Thanh toán</a>
        </div>

        <div class="total-price">Tổng cộng: ${totalPrice} VNĐ</div>
    </div>
</body>
</html>
