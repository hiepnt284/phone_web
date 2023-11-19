<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<style>
body {
	font-family: Arial, sans-serif;
	height: 100vh;
	margin: 0;
	display: flex;
	align-items: center;
	justify-content: center; /* Căn giữa theo chiều ngang */
	background-image: url('images/bg-login.jpg');
	background-size: cover;
	background-repeat: no-repeat;
}

.container {
	width: 400px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.8);
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input {
	width: 95%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button {
	width: 90%;
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
}

button:hover {
	background-color: #0056b3;
}

.error-message {
	color: #ff0000;
}


a {
	text-decoration: none;
	color: purple;
}
</style>
</head>
<body>
	<div class="container">
		<center>
			<h1>Đăng ký tài khoản</h1>
		</center>
		<c:if test="${not empty succMsg }">
			<h3 style="color: green">${succMsg}</h3>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<c:if test="${not empty failedMsg }">
			<h3 style="color: red">${failedMsg}</h3>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
		<form id="registration-form" action="/dien_thoai3/signup"
			method="post">
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="fullname">Fullname:</label> <input type="text"
					id="fullname" name="fullname" required>
			</div>
			<div class="form-group">
				<label for="phone">Phone Number:</label> <input type="tel"
					id="phone" name="phone" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div class="form-group">
				<label for="confirm-password">Confirm Password:</label> <input
					type="password" id="confirm-password" name="confirm-password"
					required>
				<div id="password-match-error" class="error-message"></div>
			</div>
			<center>
				<button type="submit">Đăng ký</button>
			</center>

		</form>
		<center>
			<p>
				Bạn đã có tài khoản? <a href="/dien_thoai3/login.jsp">Đăng nhập
					ngay</a>
			</p>
		</center>
	</div>

	<script>
		const registrationForm = document.getElementById('registration-form');
		const passwordInput = document.getElementById('password');
		const confirmPasswordInput = document
				.getElementById('confirm-password');
		const passwordMatchError = document
				.getElementById('password-match-error');

		registrationForm.addEventListener('submit', function(event) {
			if (passwordInput.value !== confirmPasswordInput.value) {
				passwordMatchError.textContent = "Mật khẩu không khớp.";
				event.preventDefault(); // Ngăn chặn việc submit form nếu mật khẩu không khớp
			} else {
				passwordMatchError.textContent = "";
			}
		});
	</script>
</body>
</html>
