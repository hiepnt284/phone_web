<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Home</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<%@include file="component/allcss.jsp" %>
</head>
<body>
	<%@include file="component/header.jsp" %>
	<div class="banner">
		<div class="banner-content">
			<h2>Chào mừng đến với MOBILE SHOP</h2>
			<p>Mua sắm trực tuyến với hàng ngàn sản phẩm đa dạng và chất
				lượng.</p>
		</div>
	</div>



	<section class="featured-products">
		<h2>Sản phẩm nổi bật</h2>
		<div class="product-container">
			<div class="product-item">
				<img src="images/ip1.jpg" alt="Sản phẩm 1" />
				<h3>Sản phẩm 1</h3>
				<p class="price">$99.99</p>
			</div>
			<div class="product-item">
				<img src="images/ip1.jpg" alt="Sản phẩm 2" />
				<h3>Sản phẩm 2</h3>
				<p class="price">$49.99</p>
			</div>
			<div class="product-item">
				<img src="images/ip1.jpg" alt="Sản phẩm 3" />
				<h3>Sản phẩm 3</h3>
				<p class="price">$79.99</p>
			</div>
			<div class="product-item">
				<img src="images/ip1.jpg" alt="Sản phẩm 3" />
				<h3>Sản phẩm 3</h3>
				<p class="price">$79.99</p>
			</div>
		</div>
	</section>

	<section class="featured-products">
		<h2>Danh sách sản phẩm</h2>
		<div class="product-container">
		<c:forEach items="${requestScope.listp }" var="p">
			<c:set var="id" value="${p.id}" />
			<div class="product-item">
				<img style="width: 150px; height: auto" alt="anh" src="images/${p.image }">
				<h3>${p.name}</h3>
				<p class="price">${p.price }</p>
				<a href="http://localhost:8080/dien_thoai3/detailproduct?id=${id}" class="btn btn-success">Mua</a>
			</div>
		</c:forEach>
			
		</div>
	</section>
	<%@include file="component/footer.jsp" %>
</body>
</html>