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
<%@include file="component/allcss.jsp"%>
<style type="text/css">

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
	<%@include file="component/header.jsp"%>
	<c:set var="p" value="${requestScope.p}" />

	<div class="product-containerr">
		<img src="images/${p.image}" alt="Product Image" class="product-image">
		<div class="product-info">
			<h2>${p.name}</h2>
			<p>
				<strong>Giá:</strong> ${p.price}
			</p>
			<p>
				<strong>Ngày ra mắt:</strong> ${p.releaseDate}
			</p>
			<p>
				<strong>Mô tả:</strong>${p.describe}</p>

			<c:if test="${not empty user }">
				<a class="btn btn-primary"
					href="/dien_thoai3/user/buynow?uid=${user.id}&pid=${p.id }">
					Mua ngay</a>
				<a
					href="/dien_thoai3/user/addtocart?uid=${user.id}&pid=${p.id }"
					class="btn btn-success"> Add to cart </a>

			</c:if>
			<c:if test="${empty user }">
				<a class="btn btn-primary" href="/dien_thoai3/login.jsp ">Mua ngay</a>
				<a href="/dien_thoai3/login.jsp" class="btn btn-success"> Add to cart </a>
			</c:if>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>