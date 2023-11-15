<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
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
            margin-bottom: 10px; /* Added margin between quantity and total price */
        }

        .quantity input {
            width: 30px;
            margin: 0 10px;
        }

        .total-price {
            font-weight: bold;
        }

        .action-buttons {
            text-align: center; /* Centering the buttons */
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
            display: inline-block; /* Make the button inline-block for centering */
        }

        .button:hover {
            background-color: #00b8ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Checkout</h1>

        <c:set var="totalPrice" value="0" />
        <c:forEach items="${requestScope.list}" var="c">
            <div class="product">
                <div class="product-info">
                    <span>${c.name}</span>
                </div>
                <div class="quantity">
                    <input type="hidden" name="uid" value="${c.uid}">
                    <input type="hidden" name="pid" value="${c.pid}">
                    <span>${c.quantity}</span>
                </div>
                <div class="total-price">${c.price * c.quantity}VNĐ</div>
            </div>
            <c:set var="totalPrice" value="${totalPrice + (c.price * c.quantity)}" />
        </c:forEach>

        <div class="total-price">Tổng cộng: ${totalPrice} VNĐ</div>

        <div class="action-buttons">
            <c:if test="${not empty user}">
                <form action="http://localhost:8080/dien_thoai3/buynow" method="post">
                	<input type="text"  name="totalmoney" value="${totalPrice}" hidden>
                	<input type="text"  name="uid" value="${user.id}" hidden>
                	<input type="text"  name="pid" value="${requestScope.pid}" hidden>
                    <label for="fullname">Full Name:</label>
                    <input type="text" id="fullname" name="fullname" value="${user.fullname}" required>

                    <br> <!-- Added line break for better separation -->

                    <label for="phone">Phone:</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" value="${user.phone}" required>

                    <br> <!-- Added line break for better separation -->

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${user.address}" required>

                    <br> <!-- Added line break for better separation -->

                    <button type="submit" class="button">Đặt hàng</button>
                </form>
            </c:if>
        </div>
    </div>
</body>
</html>
