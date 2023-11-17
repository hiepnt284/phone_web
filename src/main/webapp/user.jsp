<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<style type="text/css">
.menuu {
	margin-top: 200px;
	text-align: center;
	display: flex;
	justify-content: space-evenly;
	margin-bottom: 117px;
}

.icon-feature {
	font-size: 50px;
}
.button{
	padding:20px !important;
	background-color: rgb(255, 128, 0) !important;
}
</style>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/header.jsp"%>
	<div class="menuu">
		<a href="http://localhost:8080/dien_thoai3/editprofile" class="btn btn-primary button"> <i
			class="fa-solid fa-user-gear icon-feature"></i>
			<h2>Profile</h2>
		</a> <a href="changepass.jsp"
			class="btn btn-primary button"> <i
			class="fa-solid fa-key icon-feature"></i>
			<h2>Đổi mật khẩu</h2>
		</a> <a href="http://localhost:8080/dien_thoai3/orderuser"
			class="btn btn-primary button"> <i
			class="fa-solid fa-cubes icon-feature"></i>
			<h2>Đơn Hàng</h2>
		</a>
	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>
