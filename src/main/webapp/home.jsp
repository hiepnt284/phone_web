<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
</head>
<body>
	<h1>User home</h1>
	<c:if test="${not empty user }">
	<h1>name:${user.username }</h1>
	<h1>phone:${user.phone }</h1>
	</c:if>
</body>
</html>