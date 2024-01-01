<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
    <title>Trang Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/homeadmin.css"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}


.logo-container {
	display: flex;
	align-items: center;
	font-size: 30px;

}
		



.icon-feature{
	font-size: 50px;
}
.logo-container {
	display: flex;
	align-items: center;
	font-size: 30px;

}
.logo,
.cart-icon {
	font-size: 40px;
}
.header {
	display: flex;
	padding: 20px;
	background-color: rgb(255, 128, 0);
	align-items: center;
	color: white;
	justify-content: space-between;
}
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 10px;
            
        }

        h3 {
            color: red;
            text-align: center;
        }

        

        input[type="submit"] {
            background-color: rgb(255, 128, 0) !important;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: orangered !important;
        }
       	.button {
        display: inline-block;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: rgb(255, 128, 0) !important;
        color: white;
    }

    	.button:hover {
        background-color: orangered !important;
    }
    label {
	width: 120px;
}


    h1 {
        text-align: center;
    }

    table {
    	margin-top:20px;
        width: 90%;
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
        width: 250px;
    }

    </style>

<script type="text/javascript">
    function doDelete(id) {
        if (confirm("Are you sure to delete product with id =" + id)) {
            window.location = "/dien_thoai3/admin/deleteproduct?id=" + id;
        }
    }
</script>
</head>
<body>
<%@include file="headeradmin.jsp"%>
    <h1>Danh sách đơn hàng</h1>
    <center>
    <a class="button" href="/dien_thoai3/admin/homeadmin.jsp">Back</a>
        <table>
            <tr>
                <th>ID</th>
                <th>Tên khách hàng</th>
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
                    <td>${c.fullname}</td>
                    <td>${c.date}</td>
                    <td>${c.totalmoney}</td>
                    <td>${c.phone}</td>
                    <td>${c.address}</td>
                    <td>${c.status}</td>
                    <td class="action-buttons">
                    <c:if test="${c.status eq 'Chờ xác nhận'}">
               			<a class="button" href="/dien_thoai3/admin/handleorder?oid=${id}&act=accept">Xác nhận</a>
                        <a class="button" href="/dien_thoai3/admin/listorderdetail?oid=${id}" >Chi tiết</a>
                        <a class="button" href="/dien_thoai3/admin/handleorder?oid=${id}&act=cancel">Hủy</a>
           			</c:if>
           			<c:if test="${c.status eq 'Đã xác nhận'}">
               			<a class="button" href="/dien_thoai3/admin/handleorder?oid=${id}&act=delivery">Giao hàng</a>
                        <a class="button" href="/dien_thoai3/admin/listorderdetail?oid=${id}" >Chi tiết</a>
                        <a class="button" href="/dien_thoai3/admin/handleorder?oid=${id}&act=cancel">Hủy</a>
           			</c:if>
           			<c:if test="${c.status eq 'Đã hủy'}">
                        <a class="button" href="/dien_thoai3/admin/listorderdetail?oid=${id}" >Chi tiết</a>
           			</c:if>
           			<c:if test="${c.status eq 'Đang giao'}">
               		
                        <a class="button" href="/dien_thoai3/admin/listorderdetail?oid=${id}" >Chi tiết</a>
                        <a class="button" href="/dien_thoai3/admin/handleorder?oid=${id}&act=cancel">Hủy</a>
           			</c:if>
           			<c:if test="${c.status eq 'Đã hoàn thành'}">
               		
                        <a class="button" href="/dien_thoai3/admin/listorderdetail?oid=${id}" >Chi tiết</a>
           			</c:if>
                        
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </center>
</body>
</html>
