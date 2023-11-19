<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<%@include file="../component/allcss.jsp"%>
<style>
.activee {
	background-color: white;
	color: rgb(255, 128, 0) !important;
}

.search-button {
	border: none;
	background: none;
	cursor: pointer;
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
        background-color: rgb(255, 128, 0);
        color: white;
    }

    .button:hover {
        background-color:orangered !important;
	color: white !important;
    }

    h1 {
        text-align: center;
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
        background-color: rgb(255, 128, 0);
        color: #fff;
    }

    .action-buttons {
        text-align: center;
    }


</style>
</head>
<body>
	<%@include file="../component/header.jsp"%>
    <h1>Danh sách đơn hàng</h1>
    <center>
    <a class="button" href="/dien_thoai3/user/userpage">Back</a>
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
                        <a class="button" href="/dien_thoai3/user/orderdetailuser?oid=${id}" >Xem chi tiết đơn</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </center>
    <%@include file="../component/footer.jsp"%>
</body>
</html>
