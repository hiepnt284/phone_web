<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách đơn hàng</title>
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
    <h1>Danh sách đơn hàng</h1>
    <center>
    <a class="button" href="user.jsp">Back</a>
        <table>
            <tr>
                <th>ID</th>
                <th>Ngày đặt</th>
                <th>Tổng tiền</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.list}" var="c">
                <c:set var="id" value="${c.id}" />
                <tr>
                    <td>${id}</td>
                    <td>${c.date}</td>
                    <td>${c.totalmoney}</td>
                    <td>${c.phone}</td>
                    <td>${c.address}</td>
                    <td>${c.status}</td>
                    <td class="action-buttons">
                        <a class="button" href="update?id=${id}">Update</a>
                        <a class="button" href="http://localhost:8080/dien_thoai3/listorderdetail?oid=${id}" >Xem chi tiết đơn</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </center>
</body>
</html>
