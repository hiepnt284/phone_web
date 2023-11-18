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
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

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

.container {
	max-width: 800px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 50px;
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
	margin: 0 10px;
}

.total-price {
	font-weight: bold;
	text-align: right;
	padding:10px
}


.button {
	width:80%;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #007bff;
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
	background-color: #00b8ff;
}
.form{
padding:10px
}
input[type="text"], input[type="tel"] {
	width: 70%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}
label{
width: 100px;
}
</style>
</head>
<body>
	<%@include file="../component/header.jsp"%>
	<div class="container">
		<h1>Checkout</h1>
		<div class="product">
			<div class="product-info" style="font-weight: bold;">
				<span>Tên sản phẩm</span>
			</div>
			<div style="margin-right: 20px; font-weight: bold;" class="quantity">
				<span>Số lượng</span>
			</div>
			<div style="margin-right: 20px; font-weight: bold;">Giá</div>
		</div>
		<c:set var="totalPrice" value="0" />
		<c:forEach items="${requestScope.list}" var="c">
			<c:set var="pid" value="c.pid" />
			<div class="product">
				<div class="product-info">
					<span>${c.name}</span>
				</div>
				<div class="quantity">
					<input type="hidden" name="uid" value="${c.uid}"> <input
						type="hidden" name="pid" value="${c.pid}"> <span>${c.quantity}</span>
				</div>
				<div>${c.price * c.quantity}VNĐ</div>
			</div>
			<c:set var="totalPrice"
				value="${totalPrice + (c.price * c.quantity)}" />
		</c:forEach>

		<div style="float: left;padding:10px;font-weight: bold;">Tổng cộng:</div>
		<div class="total-price">${totalPrice} VNĐ</div>
		<div style="padding:10px;font-weight: bold; border-top: 2px solid #ccc;">Thông tin khách hàng:</div>
			<c:if test="${not empty user}">
				<form class="form" action="/dien_thoai3/user/buynow"
					method="post">
					<input type="text" name="totalmoney" value="${totalPrice}" hidden>
					<input type="text" name="uid" value="${user.id}" hidden> <input
						type="text" name="pid" value="${requestScope.pid}" hidden> <label
						for="fullname">Người nhận:</label> <input type="text" id="fullname"
						name="fullname" value="${user.fullname}" readonly="readonly"><br />
					<br /> <label for="phone">Phone:</label> <input type="tel"
						id="phone" name="phone" pattern="[0-9]{10}" value="${user.phone}"
						required><br />
					<br /> <label for="address">Address:</label> <input type="text"
						id="address" name="address" value="${user.address}" required><br />
					<br />
					<center>
					<button type="submit" class="button">Đặt hàng</button>
					</center>
					
				</form>
			</c:if>
	</div>
	<%@include file="../component/footer.jsp"%>
</body>
</html>
