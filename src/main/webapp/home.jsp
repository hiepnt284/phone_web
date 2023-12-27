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
<link rel="stylesheet" type="text/css" href="css/header.css">
<%@include file="component/allcss.jsp"%>
</head>
<style>
.headerr{
	position: fixed;
    top: 0;
    left: 0;
    width: 100%;
}
.banner {
	margin-top: 147.2px;
	background-image: url("images/banner1.jpg");
	background-size: cover;
	background-position: center;
	height: 400px;
	display: flex;
	align-items: center;
	justify-content: center;
}
.title-content{
	display: inline-block;
	border-bottom: 10px solid rgb(255, 128, 0);
}
.modal-backdrop {
	height:0;
}
body{
	background-color: rgb(244,244,244);
}
.product-item {
	width: 300px;
	padding: 10px;
	box-shadow: 0 4px 6px #00000029;
    border-radius: 8px;
    border: none;
	background-color: white;
}
</style>
<body>



	<%@include file="component/header.jsp"%>

		<c:if test="${not empty succMsg }">

		<script type="text/javascript">
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": true,
				  "positionClass": "toast-top-center",
				  "preventDuplicates": false,
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "2000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
			toastr.success('${succMsg}');
		</script>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<script type="text/javascript">
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": true,
				  "positionClass": "toast-top-center",
				  "preventDuplicates": false,
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "2000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
			toastr.error('${failedMsg}');
		</script>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	
	<c:if test="${empty requestScope.cid and empty requestScope.key}">
		<div class="banner">
			<div class="banner-content">
				<h2>Chào mừng đến với MOBILE SHOP</h2>
				<p>Mua sắm trực tuyến với hàng ngàn sản phẩm đa dạng và chất
					lượng.</p>
			</div>
		</div>
		
		<section class="featured-products">
		<h2 class="title-content">SẢN PHẨM BÁN CHẠY</h2>
		<div class="product-container">
			<c:forEach items="${requestScope.listbs }" var="p">
				<c:set var="id" value="${p.id}" />
				<div class="product-item">
					<img style="width: 150px; height: auto" alt="anh"
						src="images/${p.image }">
					<h3>${p.name}</h3>
					<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
					<p class="price">${p.price }VNĐ</p>


					<a href="/dien_thoai3/detailproduct?id=${id}"
						class="btn btn-success">Mua ngay</a>
				</div>
			</c:forEach>

		</div>
	</section>
		<section class="featured-products">
		<h2 class="title-content">SẢN PHẨM CAO CẤP</h2>
		<div class="product-container">
			<c:forEach items="${requestScope.listav }" var="p">
				<c:set var="id" value="${p.id}" />
				<div class="product-item">
					<img style="width: 150px; height: auto" alt="anh"
						src="images/${p.image }">
					<h3>${p.name}</h3>
					<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
					<p class="price">${p.price }VNĐ</p>


					<a href="/dien_thoai3/detailproduct?id=${id}"
						class="btn btn-success">Mua ngay</a>
				</div>
			</c:forEach>

		</div>
	</section>
		<section class="featured-products">
		<h2 class="title-content">SẢN PHẨM GIÁ RẺ</h2>
		<div class="product-container">
			<c:forEach items="${requestScope.listch }" var="p">
				<c:set var="id" value="${p.id}" />
				<div class="product-item">
					<img style="width: 150px; height: auto" alt="anh"
						src="image	s/${p.image }">
					<h3>${p.name}</h3>
					<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
					<p class="price">${p.price }VNĐ</p>


					<a href="/dien_thoai3/detailproduct?id=${id}"
						class="btn btn-success">Mua ngay</a>
				</div>
			</c:forEach>

		</div>
	</section>
	</c:if>
	<c:if test="${not empty a }">
	<div style="margin-top:173px"></div>
	</c:if>
	<section class="featured-products">
		<h2 class="title-content">DANH SÁCH SẢN PHẨM</h2>
		<div class="product-container">
			<c:forEach items="${requestScope.listp }" var="p">
				<c:set var="id" value="${p.id}" />
				<div class="product-item">
					<img style="width: 150px; height: auto" alt="anh"
						src="images/${p.image }">
					<h3>${p.name}</h3>
					<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
					<p class="price">${p.price }VNĐ</p>


					<a href="/dien_thoai3/detailproduct?id=${id}"
						class="btn btn-success">Mua ngay</a>
				</div>
			</c:forEach>

		</div>
	</section>
	<%@include file="component/footer.jsp"%>
</body>
</html>