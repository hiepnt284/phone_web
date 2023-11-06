<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Detail</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<%@include file="component/allcss.jsp" %>
<style type="text/css">
	.detail-container{
		text-align: center;
	}
</style>
</head>
<body>
	<%@include file="component/header.jsp" %>
	<c:set var="p" value="${requestScope.p}"/>
	<div class="detail-container">
		Tên sản phẩm:${p.name}<br/><br/>
		Giá sản phẩm:${p.price}<br/><br/>
		Ngày ra mắt:${p.releaseDate}<br/><br/>
		Mô tả:${p.describe}<br/><br/>
		<img alt="anh" src="images/${p.image}"><br/><br/>
	</div>
		
	<%@include file="component/footer.jsp" %>
</body>
</html>