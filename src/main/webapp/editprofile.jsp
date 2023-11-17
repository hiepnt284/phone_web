<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
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

form {
	max-width: 400px;
	margin: 30px auto;
	padding: 20px;
	border: 2px solid #ccc;
	border-radius: 5px;
}

input[type="text"], input[type="date"], input[type="number"], select {
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
	margin-right: 20px;
}

.button:hover {
	background-color: #00b8ff;
}
</style>
</head>
<body>
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
	<form action="editprofile" method="post">
		Username:<input type="text" name="username" readonly="readonly"
			value="${c.username}" /><br /> <br /> Fullname:<input type="text"
			name="fullname" value="${c.fullname}" required="required" /><br />
		<br /> Phone:<input type="text" name="phone" value="${c.phone}"
			required="required" /><br /> <br /> Address:<input type="text"
			name="address" value="${c.address}" /><br /> <br />
		<center>
			<a class="button" href="user.jsp">Back</a> <input type="submit"
				value="Update" />
			<center />
	</form>
</body>
</html>