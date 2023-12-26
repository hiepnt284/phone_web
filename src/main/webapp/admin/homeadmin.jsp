<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
    <title>Trang Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/homeadmin.css"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}


.logo-container {
	display: flex;
	align-items: center;
	font-size: 30px;

}
		



.icon-feature{
	font-size: 50px;
}
.logo-container {
	display: flex;
	align-items: center;
	font-size: 30px;

}
.logo,
.cart-icon {
	font-size: 40px;
}
.header {
	display: flex;
	padding: 20px;
	background-color: rgb(255, 128, 0);
	align-items: center;
	color: white;
	justify-content: space-between;
}
.menuu {
	margin-top: 200px;
	text-align: center;
	display: flex;
	justify-content: space-evenly;
}
.menuu .btn{
	background-color: rgb(255, 128, 0) !important;
}
.menuu .btn:hover{
background-color: orangered !important;
}
</style>
</head>
<body>
	<%@include file="headeradmin.jsp"%>
	


    <div class="menuu">
        <a href="/dien_thoai3/admin/listcategory" class="btn btn-primary">
        	<i class="fa-solid fa-list-ul icon-feature"></i>
        	<h2>Quản lý danh mục</h2>
        </a>
        <a href="/dien_thoai3/admin/listproduct" class="btn btn-primary">
	        <i class="fa-solid fa-mobile icon-feature"></i>
	        <h2>Quản lý Sản Phẩm</h2>
        </a>
        <a href="/dien_thoai3/admin/listorder" class="btn btn-primary">
	        <i class="fa-solid fa-cubes icon-feature" ></i>
	        <h2>Quản lý Đơn Hàng</h2>
        </a>
    </div>
</body>
</html>