<!DOCTYPE html>
<%@page import="java.sql.Date"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>list category</title>
<style type="text/css">
	#wrapper{
		margin-left: 10%;
		margin-right: 10%;
		font-family:arial;
	}
	h3{
		text-align: left;
		color: blue;
	}

	input[type=submit]{
		width: 300px;
		height: 30px;
		background-color: orange;
		border-radius: 20px;
	}
	input[type=submit]:hover {
	cursor: pointer;
	background-color: red;
}
	body {
    font-family: Arial, sans-serif;
}

	header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
}

.brand {
    font-size: 24px;
}

.search input {
    padding: 5px;
    border: none;
    border-radius: 5px;
}

.search button {
    background-color: #f90;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 5px 10px;
    margin-left: 10px;
}

.cart button,
.login button {
    background-color: #f90;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 5px 10px;
    margin-left: 10px;
}

nav {
    background-color: #333;
    color: #fff;
}

.categories {
        display: flex;
        justify-content: space-around;
}


main {
    display: flex;
    flex-wrap: wrap;
    margin: 20px;
}

.product {
    width: 20%;
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
    margin: 10px;
}

.product img {
    max-width: 100%;
}

.product h3 {
    margin: 10px 0;
}
    a {
        text-decoration: none;
        flex: 1;
        padding: 10px;
        background-color: aqua;
        text-align: center;
    }

    a:hover {
        background-color: red;
    }
</style>
<script type="text/javascript">
	function change(){
		document.getElementById("f1").submit();
	}
</script>
</head>
<body>
	<div class="container" style="width: 80%; margin: 0 auto">
		<header>
	            <div class="brand">Tên Thương Hiệu</div>
	            <div class="search">
	                <input type="text" placeholder="Tìm kiếm...">
	                <button>Tìm kiếm</button>
	            </div>
	            <div class="cart">
	                <button>Giỏ hàng</button>
	            </div>
	            <div class="login">
	                <button>Đăng nhập</button>
	            </div>
	    </header>
	        <div class="categories">
	        	<c:forEach items="${requestScope.categories}" var="c">
            		<a href="products?cid=${c.id}">${c.name}</a>
        		</c:forEach>
	        </div>
		<div id="wrapper">
			<form id="f1" action="list">
			Dong dien thoai:
			<select name="key">
				<option value="0">All</option>
				<%
				int cid =(int)request.getAttribute("cid");
				double price1=-1, price2=-1;
				if(request.getAttribute("price1")!=null){
					 price1 = (double)request.getAttribute("price1");
					 System.out.println(price1);
				}
				if(request.getAttribute("price2")!=null){
					 price2 = (double)request.getAttribute("price2");
					 System.out.println(price2);
				}
	
				String mota = (String)request.getAttribute("key");
				Date tu = (Date)request.getAttribute("from");
				Date den = (Date)request.getAttribute("to");
				List<Category> list = (List<Category>) request.getAttribute("categories");
				for(Category c: list){
				%>
				<option <%=(cid == c.getId())?"selected":""%> value="<%=c.getId()%>"><%=c.getName()%></option>
				<%
				} 
				%>
			</select>
			<br>
			<input type="text" name="key2" placeholder="nhap ten, mieu ta" value="<%=(mota!=null)?mota:""%>"/>
			<br>
			Từ giá: <input type="number" name="fromprice" value="<%=(price1!=-1)?price1:"" %>"/>
			Đến giá: <input type="number" name="toprice" value="<%=(price2!=-1)?price2:"" %>"/>
			<br>
			Từ ngày: <input type="date" name="fromdate" value="<%=(tu!=null)?tu:""%>"/>
			Đến ngày: <input type="date" name="todate" value="<%=(den!=null)?den:""%>"/>
			<br>
			<input type="submit" value="Search">
			
			
			</form>
			<main>
				<c:forEach items="${requestScope.products}" var="p">
			        <div class="product">
			            <img src="${p.image }" alt="Sản phẩm 1">
			            <h3>${p.name }</h3>
			            <p>Giá: ${p.price}VND</p>
	        		</div>
	
				</c:forEach>
			<main/>
		</div>
	</div>
</body>
</html>