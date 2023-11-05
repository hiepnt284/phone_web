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
<script type="text/javascript">
    function doDelete(id) {
        if (confirm("Are you sure to delete order with id =" + id)) {
            window.location = "delete?id=" + id;
        }
    }
</script>
</head>
<body>
    <h1>Danh sách đơn hàng</h1>
    <center>
        <table>
            <tr>
                <th>ID</th>
                <th>Ảnh</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Ngày ra mắt</th>
                <th>Mô tả</th>
                <th>Danh mục</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.list}" var="c">
                <c:set var="id" value="${c.maKH}" />
                <tr>
                    <td>${id}</td>
                    <td>${c.hoTen}</td>
                    <td>${c.ngaySinh}</td>
                    <td>${c.diaChi}</td>
                    <td>${c.email}</td>
                    <td>${c.dienThoai}</td>
                    <td>${c.dienThoai}</td>
                    <td class="action-buttons">
                        <a class="button" href="update?id=${id}">Update</a>
                        <a class="button" href="#" onclick="doDelete('${id}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a class="button" href="add.jsp">Add</a>
    </center>
</body>
</html>
