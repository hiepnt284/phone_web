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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 10px;
            
            
        }

        h3 {
            color: red;
            text-align: center;
        }

        form {
            background-color: #fff;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }


        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            width: 75%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: rgb(255, 128, 0) !important;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: orangered !important;
        }
       	.button {
        display: inline-block;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: rgb(255, 128, 0) !important;
        color: white;
    	margin-right:20px;
    }

    	.button:hover {
        background-color: orangered !important;
    }
    label {
	width: 120px;
}
    </style>
</head>
<body>
<%@include file="headeradmin.jsp"%>
	<h1>Edit Product</h1>
	<c:set var="c" value="${requestScope.p}"/>
	<form action="/dien_thoai3/admin/editproduct" method="post" enctype="multipart/form-data">
		<label>ID:</label> <input type="number" name="id" readonly="readonly" value="${c.id}"/><br/><br/>
		<label>Tên sản phẩm:</label><input type="text" name="name" value="${c.name}"/><br/><br/>
		<label>Giá sản phẩm:</label><input type="number" name="price" value="${c.price}"/><br/><br/>
		<label>Số lượng:</label><input type="number" name="quantity" value="${c.quantity}"/><br/><br/>
		<label>Ngày ra mắt:</label><input type="date" name="releasedate" value="${c.releaseDate}"/><br/><br/>
		<label style="vertical-align: top; display: inline-block;">Mô tả:</label><textarea id="describe" name="describe" rows="6" cols="50">${c.describe}</textarea><br/><br/>
		<label>Trạng thái:</label>
		<select name="status">
		    <c:forEach var="statusOption" items="${['active', 'inactive']}">
		        <option value="${statusOption}" 
		            <c:if test="${c.status eq statusOption}">
		                selected="selected"
		            </c:if>
		        >
		            ${statusOption}
		        </option>
		    </c:forEach>
		</select>
		<br><br>
		<input type="text" name="oldimg" value="${c.image}" hidden/>
		<label>Thumbnail:</label><img style="width: 300px; height: auto" alt="anh" src="../images/${c.image }"> <br><br>
		<label>Cập nhật Thumbnail:</label><input type="file" name="img"/><br/><br/>
		<br/>
		<label>Ảnh</label>
		<c:forEach items="${requestScope.list}" var="i" >
			<img style="width: 120px; height: 120px" alt="anh" src="../images/${i.image }">
		</c:forEach>
		<br>
		<br>
		<label>Cập nhật Ảnh:</label><input type="file" name="images" accept="image/*" multiple><br/><br/>
		<center>
		<a class="button" href="/dien_thoai3/admin/listproduct">Back</a>
		<input type="submit" value="Update"/>
		<center/>
	</form>
</body>
</html>