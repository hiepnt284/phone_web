<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<link rel="stylesheet" type="text/css" href="../css/header.css">
<%@include file="../component/allcss.jsp"%>
<style type="text/css">

h1{
			
            display: inline-block;
			border-bottom: 10px solid rgb(255, 128, 0);
}

.container {
	max-width: 800px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 125px;
}

.product {
	border-bottom: 1px solid #ddd;
	padding: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.product-info {
	flex-grow: 9;
}

.quantity {
	display: flex;
	align-items: center;
	flex-grow: 1;
}

.quantity input {
	width: 30px;
}

.total-price {
	font-weight: bold;
	text-align: right;
	padding: 10px
}

.action-buttons {
	text-align: right;
	margin-top: 20px;
}

.button {
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: darkorange;
	color: white;
	margin-right: 10px;
}

.quantity button {
	padding: 5px 7px !important;
	background-color: orange !important;
	border: 1px solid #ccc !important;
	border-radius: 5px !important;
}

.button:hover {
	background-color: orangered;
	color: white;
}
.wrap {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.container {
  flex: 1;
}
</style>
</head>
<body>
<div class="wrap">
<%@include file="../component/header.jsp"%>
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
	<div class="container">
		<h1>Giỏ hàng</h1>
		<c:if test="${empty requestScope.list}">
			<center>
				<h2>Giỏ hàng trống</h2>
				<br>
				<a href="/dien_thoai3/home" class="button">Mua
					sắm ngay</a>
			</center>

		</c:if>

		<c:if test="${not empty requestScope.list}">
			<div class="product">
				<div class="product-info" style="font-weight: bold;">
					<span>Tên sản phẩm</span>
				</div>
				<div style="margin-right: 90px; font-weight: bold;" class="quantity">
					<span>Số lượng</span>
				</div>
				<div style="margin-right: 20px; font-weight: bold;">Giá</div>
			</div>
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${requestScope.list}" var="c">
				<div class="product">
					<div class="product-info">
						<span>${c.name}</span>
					</div>
					<div class="quantity">
						<form action="/dien_thoai3/user/editcart"
							method="post">
							<input type="hidden" name="uid" value="${c.uid}"> <input
								type="hidden" name="pid" value="${c.pid}">
							<button type="submit" name="action" value="decrease">
								<i class="fa-solid fa-minus"></i>
							</button>
							<input type="text" name="quantity" value="${c.quantity}"
								readonly="readonly">
							<button type="submit" name="action" value="increase">
								<i class="fa-solid fa-plus"></i>
							</button>
							<button type="submit" name="action" value="remove">
								<i class="fa-regular fa-trash-can"></i>
							</button>
						</form>
					</div>
					<div>${c.price * c.quantity}VNĐ</div>
				</div>
				<c:set var="totalPrice"
					value="${totalPrice + (c.price * c.quantity)}" />
			</c:forEach>
			<div style="float: left; padding: 10px; font-weight: bold;">Tổng
				cộng:</div>
			<div class="total-price">${totalPrice}VNĐ</div>
			<div class="action-buttons">
				<a href="/dien_thoai3/home" class="button">Tiếp
					tục mua sắm</a>
				<c:if test="${not empty user }">
					<a class="button"
						href="/dien_thoai3/user/checkout?uid=${user.id }">Thanh
						toán</a>
				</c:if>
			</div>
		</c:if>
	</div>

	<%@include file="../component/footer.jsp"%>
</div>
	
</body>
</html>
