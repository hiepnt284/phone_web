<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<%@include file="../component/allcss.jsp"%>
<style>


h1 {
	text-align: center;
	padding: 30px 0;
	margin: 0;
}

.form {
	max-width: 400px;
	margin: 30px auto;
	padding: 20px;
	border: 2px solid #ccc;
	border-radius: 5px;
}

.form input[type="text"], input[type="number"] {
	width: 90%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.form input[type="submit"] {
	background-color: darkorange !important;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
}

.form input[type="submit"]:hover {
	background-color:orangered !important;
}

.button {
	display: inline-block;
	padding: 8px 20px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: rgb(255, 128, 0);
	color: white;
	margin-right: 20px;
}

.button:hover {
	color: white;
	background-color:orangered !important;
}
</style>
</head>
<body>
<%@include file="../component/header.jsp"%>
	<h1>Edit Profile</h1>
	<c:if test="${not empty succMsg }">
		<center>
			<h3 style="color: green">${succMsg}</h3>
		</center>

		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<h3 style="color: red">${failedMsg}</h3>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<c:set var="c" value="${requestScope.u}" />
	<form action="/dien_thoai3/user/editprofile" method="post" class="form">
		Username:<input type="text" name="username" readonly="readonly"
			value="${c.username}" /><br /> <br /> Fullname:<input type="text"
			name="fullname" value="${c.fullname}" required="required" /><br />
		<br /> Phone:<input type="text" name="phone" value="${c.phone}"
			required="required" /><br /> <br /> Address:<input type="text"
			name="address" value="${c.address}" /><br /> <br />
		<center>
			<a class="button" href="/dien_thoai3/user/userpage">Back</a> <input type="submit"
				value="Update" />
		</center>
	</form>
	
<%@include file="../component/footer.jsp"%>
</body>
</html>