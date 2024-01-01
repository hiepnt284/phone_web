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


.container {
	max-width: 800px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	text-align: center;
	padding: 70px;
}



.buttons {
	margin-top: 20px;
}

.buttons a {
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

.buttons a:hover {
	background-color: darkorange;
}
.wrap {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.container {
  flex: 1;
}
.kk{
color: #00ff00;
}
</style>
</head>
<body>
<div class="wrap">
<%@include file="../component/header.jsp"%>
	<div class="container">
		<h1><i class="fa-solid fa-circle-check kk"></i> Đặt hàng thành công!</h1>
		<p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được xác nhận và
			đang được xử lý.</p>

		<div class="buttons">
			<a href="/dien_thoai3/user/listorderuser">Xem chi tiết đơn hàng</a>
			<a href="/dien_thoai3/home">Tiếp tục mua sắm</a>
		</div>
	</div>

	<%@include file="../component/footer.jsp"%>
</div>
	
</body>
</html>
