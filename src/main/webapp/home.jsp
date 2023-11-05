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
</head>
<body>
	<header>
		<div class="logo">
			<img src="images/logo.png" alt="Logo" />
		</div>
		<nav>
			<ul>
				<li><a href="#">Trang chủ</a></li>
				<li><a href="#">Sản phẩm</a></li>
				<li><a href="#">Giỏ hàng</a></li>
				<li><a href="#">Liên hệ</a></li>
			</ul>
		</nav>
	</header>

	<div class="banner">
		<div class="banner-content">
			<h2>Chào mừng đến với Trang web E-commerce</h2>
			<p>Mua sắm trực tuyến với hàng ngàn sản phẩm đa dạng và chất
				lượng.</p>
			<a href="#" class="btn">Bắt đầu mua sắm</a>
		</div>
	</div>

	<nav class="main-menu">
		<ul>
			<li><a href="#">Điện thoại di động</a></li>
			<li><a href="#">Máy tính bảng</a></li>
			<li><a href="#">Laptop</a></li>
			<li><a href="#">Phụ kiện</a></li>
		</ul>
	</nav>

	<section class="search-section">
		<h2>Tìm kiếm sản phẩm</h2>
		<div class="search-container">
			<input type="text" id="search-input" placeholder="Nhập từ khóa..." />
			<button id="search-button">Tìm kiếm</button>
		</div>
	</section>

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
	<footer>
		<div class="footer-container">
			<div class="contact-info">
				<h3>Thông tin liên hệ</h3>
				<p>Email: contact@example.com</p>
				<p>Điện thoại: 0123456789</p>
				<p>Địa chỉ: 123 Đường ABC, Thành phố XYZ</p>
			</div>
			<div class="footer-links">
				<h3>Thông tin</h3>
				<ul>
					<li><a href="#">Về chúng tôi</a></li>
					<li><a href="#">Chính sách</a></li>
					<li><a href="#">Điều khoản và điều kiện</a></li>
				</ul>
			</div>
			<div class="social-links">
				<h3>Kết nối xã hội</h3>
				<ul>
					<li><a href="#"><i class="fab fa-facebook"></i></a></li>
					<li><a href="#"><i class="fab fa-twitter"></i></a></li>
					<li><a href="#"><i class="fab fa-instagram"></i></a></li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>