<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 60px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        .input {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: #ff0000;
        }
        .rem{
        display:flex;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Đăng nhập</h1>
        <c:if test="${not empty failedMsg }">
        	<h2 style="color:red">${failedMsg}</h2>
        	<c:remove var="failedMsg" scope="session"/>
        </c:if>
        <c:if test="${not empty succMsg }">
        	<h2 style="color:green">${succMsg}</h2>
        	<c:remove var="succMsg" scope="session"/>
        </c:if>
        <c:set var="cookie" value="${pageContext.request.cookies }"/>
        <form id="login-form" action="/dien_thoai3/login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input class="input" type="text" id="username" name="username" value="${cookie.cuser.value }" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input class="input" type="password" id="password" name="password" value="${cookie.cpass.value }" required>
            </div>
            <div class="rem">
            Remember me <input type="checkbox" ${(cookie.crem!=null?'checked':'')} name ="rem" value="ON">
            </div>
            <br>
            <button type="submit">Đăng nhập</button>
        </form>
        <p><a href="/dien_thoai3/signup.jsp">Đăng ký tài khoản</a></p>
    </div>


</body>
</html>