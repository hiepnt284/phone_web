<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
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
        if (confirm("Are you sure to delete product with id =" + id)) {
            window.location = "http://localhost:8080/dien_thoai3/deleteproduct?id=" + id;
        }
    }
</script>
</head>
<body>
    <h1>Danh sách sản phẩm</h1>
    
    <center>
    	<a class="button" href="admin/homeadmin.jsp">Back</a>
	    <c:if test="${not empty succMsg }">
	        	<h3 style="color:green">${succMsg}</h3>
	        	<c:remove var="succMsg" scope="session"/>
	        </c:if>
	        <c:if test="${not empty failedMsg }">
	        	<h3 style="color:red">${failedMsg}</h3>
	        	<c:remove var="failedMsg" scope="session"/>
	    </c:if>
        <table>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Ảnh</th>
                <th>Giá</th>
                <th>Ngày ra mắt</th>
                <th>Mô tả</th>
                <th>Danh mục</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.list}" var="c">
                <c:set var="id" value="${c.id}" />
                <tr>
                    <td>${id}</td>
                    <td>${c.name}</td>
                    <td><img style="width: 70px; height: auto" alt="anh" src="images/${c.image }"></td>
                    <td>${c.price}</td>
                    <td>${c.releaseDate}</td>
                    <td>${c.describe}</td>
                    <td>${c.category.name}</td>
                    <td class="action-buttons">
                        <a class="button" href="http://localhost:8080/dien_thoai3/editproduct?id=${id}">Update</a>
                        <a class="button" href="#" onclick="doDelete('${id}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </center>
</body>
</html>
