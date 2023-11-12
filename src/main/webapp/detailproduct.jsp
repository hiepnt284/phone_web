<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Detail</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<%@include file="component/allcss.jsp" %>
<style type="text/css">
	body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }


        .product-containerr {
            width: 1000px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
        }

        .product-image {
            width: 40%;
            height: auto;
            margin-right: 20px;
        }

        .product-info {
            flex-grow: 1;
            width: 50%;
            font-size: 16px;
            line-height: 1.6;
        }
</style>
</head>
<body>
	<%@include file="component/header.jsp" %>
	<c:set var="p" value="${requestScope.p}"/>

	<div class="product-containerr">
        <img src="images/${p.image}" alt="Product Image" class="product-image">
        <div class="product-info">
            <h2>${p.name}</h2>
            <p><strong>Giá:</strong> ${p.price}</p>
            <p><strong>Ngày ra mắt:</strong> ${p.releaseDate}</p>
            <p><strong>Mô tả:</strong>${p.describe}</p>
            <a href="">Mua ngay</a>
            <a href="">Them vao gio hang</a>
        </div>
    </div>
	<%@include file="component/footer.jsp" %>
</body>
</html>