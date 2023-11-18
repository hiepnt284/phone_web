<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            background-color: #007bff;
            color: #fff;
            padding: 30px 0;
            margin: 0;
        }

        h3 {
            color: red;
            text-align: center;
        }

        form {
            background-color: #fff;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 5px;
        }


        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00b8ff;
        }
       	.button {
        display: inline-block;
        padding: 8px 14px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #007bff;
        color: white;
        width: 70px;
    	height: 36px;
    	box-sizing: border-box;
    	margin-right:20px;
    }

    	.button:hover {
        background-color: #00b8ff;
    }
    </style>
</head>
<body>
	<h1>Add Sản phẩm</h1>
	<c:if test="${not empty succMsg }">
        	<h3 style="color:green">${succMsg}</h3>
        	<c:remove var="succMsg" scope="session"/>
        </c:if>
        <c:if test="${not empty failedMsg }">
        	<h3 style="color:red">${failedMsg}</h3>
        	<c:remove var="failedMsg" scope="session"/>
        </c:if>
	<form action="/dien_thoai3/admin/addproduct" method="post" enctype="multipart/form-data">
		Tên sản phẩm:<input type="text" name="name"/><br/><br/>
		Giá sản phẩm:<input type="number" name="price"/><br/><br/>
		Ngày ra mắt:<input type="date" name="releasedate"/><br/><br/>
		Mô tả:<input type="text" name="describe"/><br/><br/>
		Danh mục:
		<select name="cid">
				<option  selected="selected">---</option>
				<c:forEach items="${requestScope.listC }" var="c">
					<option value="${c.id }">${c.name }</option>
				</c:forEach>
				
		</select>
		<br><br>
		Trạng thái:
		<select name="status">
				<option  selected="selected">---</option>
				<option value="active">active</option>
				<option value="inactive">inactive</option>
				
		</select>
		<br><br>
		Ảnh:<input type="file" name="img">
		<br>
		<br>
		<center>
		<a class="button" href="/dien_thoai3/admin/homeadmin.jsp">Back</a>
		<input type="submit" value="Save"/>
		<center/>
	</form>


</body>
</html>