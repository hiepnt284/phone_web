<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change password</title>
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

input[type="password"], input[type="date"], input[type="number"], select {
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
.error-message {
            color: #ff0000;
        }
</style>
</head>
<body>
	<h1>Change password</h1>
	<c:if test="${not empty succMsg }">
		<center>
			<h3 style="color: green">${succMsg}</h3>
		</center>

		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<center>
		<h3 style="color: red">${failedMsg}</h3>
		</center>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<c:set var="c" value="${requestScope.u}" />
	<form id="changepass" action="http://localhost:8080/dien_thoai3/changepassword" method="post">
		<div class="form-group">
			<label for="oldpass">Mật khẩu cũ:</label> <input type="password"
				id="oldpass" name="oldpass" required>
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password"
				id="password" name="newpass" required>
		</div>
		<div class="form-group">
			<label for="confirm-password">Confirm Password:</label> <input
				type="password" id="confirm-password" name="confirm-password"
				required>
			<div id="password-match-error" class="error-message"></div>
		</div>
		<br>
		<center>
		<a class="button" href="user.jsp">Back</a>
		<button class="button" type="submit">Đổi</button>
		</center>
		
	</form>
	<script>
    const changepassForm = document.getElementById('changepass');
    const passwordInput = document.getElementById('password');
    const oldpass = document.getElementById('oldpass');
    const confirmPasswordInput = document.getElementById('confirm-password');
    const passwordMatchError = document.getElementById('password-match-error');

    changepassForm.addEventListener('submit', function (event) {
        if (oldpass.value === passwordInput.value) {
            passwordMatchError.textContent = "Mật khẩu mới không được giống mật khẩu cũ.";
            event.preventDefault();
        } else if (passwordInput.value !== confirmPasswordInput.value) {
            passwordMatchError.textContent = "Mật khẩu không khớp.";
            event.preventDefault();
        } else {
            passwordMatchError.textContent = "";
        }
    });
</script>

</body>
</html>