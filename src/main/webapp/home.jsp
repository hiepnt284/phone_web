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
<%@include file="component/allcss.jsp"%>
</head>
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
</style>
<body>



	<%@include file="component/header.jsp"%>
	<c:if test="${empty requestScope.cid and empty requestScope.key}">
		<div class="banner">
			<div class="banner-content">
				<h2>Chào mừng đến với MOBILE SHOP</h2>
				<p>Mua sắm trực tuyến với hàng ngàn sản phẩm đa dạng và chất
					lượng.</p>
			</div>
		</div>
	</c:if>
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
		<div class="toast" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto">Thông báo</strong>
				<button type="button" class="btn-close" data-bs-dismiss="toast"
					aria-label="Close"></button>
			</div>
			<div class="toast-body">${failedMsg}</div>
		</div>

		<script type="text/javascript">
			$(document).ready(
					function() {
						var myToast = new bootstrap.Toast(document
								.querySelector('.toast'));
						myToast.show();

						$('.btn-close').on('click', function() {
							myToast.hide();
						});
					});
		</script>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<section class="featured-products">
		<h2>Danh sách sản phẩm</h2>
		<div class="product-container">
			<c:forEach items="${requestScope.listp }" var="p">
				<c:set var="id" value="${p.id}" />
				<div class="product-item">
					<img style="width: 150px; height: auto" alt="anh"
						src="images/${p.image }">
					<h3>${p.name}</h3>
					<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
					<p class="price">${p.price }VNĐ</p>
					<c:if test="${not empty user }">
						<a
							href="/dien_thoai3/user/addtocart?uid=${user.id}&pid=${id }"
							class="btn btn-success"> Add to cart </a>

					</c:if>
					<c:if test="${empty user }">
						<a href="/dien_thoai3/login.jsp" class="btn btn-success"> Add to cart </a>
					</c:if>

					<a href="/dien_thoai3/detailproduct?id=${id}"
						class="btn btn-success">Mua</a>
				</div>
			</c:forEach>

		</div>
	</section>
	<%@include file="component/footer.jsp"%>
</body>
</html>