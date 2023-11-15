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
</head>
<body>
	<div class="header">
		<img class="logo" alt="logo" src="../images/mobile_logo.jpg">
		
		<div class="login">
			<c:if test="${not empty user }">
				<a href="" class="btn btn-success">
				<i class="fa-solid fa-user"></i>
				${user.username}
				</a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary">
				<i class="fa-solid fa-right-to-bracket"></i>
				Logout
				</a>
	        </c:if>
	        
	        <c:if test="${empty user }">
				<a href="../login.jsp" class="btn btn-success">
				<i class="fa-solid fa-right-to-bracket"></i>
				Login
				</a>
				<a href="../signup.jsp" class="btn btn-primary">
				<i class="fa-solid fa-user-plus"></i>
				Register
				</a>
	        </c:if>

		</div>
	</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h3>Do you want logout</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <a href="http://localhost:8080/dien_thoai3/logout" type="button" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>
	


    <div class="menuu">
        <a href="http://localhost:8080/dien_thoai3/addproduct" class="btn btn-primary">
        	<i class="fa-solid fa-square-plus icon-feature"></i>
        	<h2>Thêm sản phẩm</h2>
        </a>
        <a href="http://localhost:8080/dien_thoai3/listproduct" class="btn btn-primary">
	        <i class="fa-solid fa-list-ul icon-feature"></i>
	        <h2>Danh Sách Sản Phẩm</h2>
        </a>
        <a href="http://localhost:8080/dien_thoai3/listorder" class="btn btn-primary">
	        <i class="fa-solid fa-cubes icon-feature" ></i>
	        <h2>Danh Sách Đơn Hàng</h2>
        </a>
    </div>
</body>
</html>