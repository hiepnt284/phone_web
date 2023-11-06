<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            background-color: #007bff;
            color: #fff;
            padding: 30px 0;
            margin: 0;
        }

        form {
            max-width: 400px;
            margin: 30px auto;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 5px;
        }


        input[type="text"],
        input[type="date"],
        select {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00b8ff;
        }
        .button {
        display: inline-block;
        padding: 8px 14px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #007bff;
        color: white;
        width: 70px;
    	height: 36px;
    	box-sizing: border-box;
    	margin-right:20px;
    }

    	.button:hover {
        background-color: #00b8ff;
    }
    </style>
</head>
<body>
	<h1>Edit Product</h1>
	<c:set var="c" value="${requestScope.p}"/>
	<form action="editproduct" method="post">
		ID:<input type="number" name="id" readonly="readonly" value="${c.id}"/><br/><br/>
		Tên sản phẩm:<input type="text" name="name" value="${c.name}"/><br/><br/>
		Giá sản phẩm:<input type="number" name="price" value="${c.price}"/><br/><br/>
		Ngày ra mắt:<input type="date" name="releasedate" value="${c.releaseDate}"/><br/><br/>
		Mô tả:<input type="text" name="describe" value="${c.describe}"/><br/><br/>
		<center>
		<a class="button" href="http://localhost:8888/dien_thoai3/listproduct">Back</a>
		<input type="submit" value="Update"/>
		<center/>
	</form>
</body>
</html>