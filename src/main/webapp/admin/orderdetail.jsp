<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết đơn hàng</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .button {
        display: inline-block;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #007bff;
        color: white;
    }

    .button:hover {
        background-color: #00b8ff;
    }

    h1 {
        text-align: center;
        background-color: #007bff;
        color: #fff;
        padding: 30px 0;
        margin: 0 0 30px 0;
    }

    table {
    	margin-top:20px;
        width: 80%;
        border-collapse: collapse;
        background-color: #fff;
    }

    table, th, td {
        border: 1px solid #ccc;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #007bff;
        color: #fff;
    }

    .action-buttons {
        text-align: center;
    }


</style>
</head>
<body>
    <h1>Chi tiết đơn hàng</h1>
    
    <center>
    	<a class="button" href="/dien_thoai3/admin/listorder">Back</a>
        <table>
            <tr>
                <th>ProductID</th>
                <th>Tên sản phẩm</th>
                <th>Ảnh</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
            </tr>
            <c:forEach items="${requestScope.list}" var="c">
                <tr>
                    <td>${c.pid}</td>
                    <td>${c.name}</td>
                    <td><img style="width: 70px; height: auto" alt="anh" src="../images/${c.image }"></td>
                    <td>${c.price}</td>
                    <td>${c.quantity}</td>
                    <td>${c.price*c.quantity}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </center>
</body>
</html>
