<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
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
	margin-top: 20px;
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
</head>
<body>
	<h1>Giỏ hàng</h1>
	<center>
		<table>
			<tr>
				<th>Tên</th>
				<th>Đơn Giá</th>
				<th>Số lượng</th>
				<th>Tổng tiền</th>
			</tr>

			<c:set var="totalPrice" value="0" />
			<c:forEach items="${requestScope.list}" var="c">
				<tr>
					<td>${c.name}</td>
					<td>${c.price}</td>
					<td>${c.quantity}</td>
					<td>${c.price * c.quantity}</td>
				</tr>
				<c:set var="totalPrice"
					value="${totalPrice + (c.price * c.quantity)}" />
			</c:forEach>
			<tr>
				<td>Tổng cộng</td>
				<td></td>
				<td></td>
				<td>${totalPrice}</td>
			</tr>

		</table>
	</center>
</body>
</html>
