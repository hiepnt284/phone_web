<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang Admin</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

header {
	background-color: blue;
	color: #fff;
	text-align: center;
	padding: 20px;
}

nav {
	background-color: green;
	color: #fff;
	text-align: center;
	padding: 10px;
}


.menu {
	list-style: none;
	padding: 0;
}

.menu li {
	margin: 10px 0;
}

.menu a {
	display: block;
	background-color: #333;
	color: #fff;
	text-decoration: none;
	padding: 10px;
	border-radius: 5px;
}

.menu a:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<header>
		<h1>Trang Admin</h1>
	</header>
	<nav>
		<ul class="menu">
			<li><a href="http://localhost:8080/dien_thoai3/addproduct">Thêm Sản Phẩm</a></li>
			<li><a href="http://localhost:8080/dien_thoai3/listproduct">Xem Danh Sách Sản Phẩm</a></li>
			<li><a href="listorder.jsp">Xem Danh Sách Đơn Hàng</a></li>
		</ul>
	</nav>

</body>
</html>
>
