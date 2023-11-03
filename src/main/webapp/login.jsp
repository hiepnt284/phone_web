<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        input {
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Đăng nhập</h1>
        <form id="login-form">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div id="login-error" class="error-message"></div>
            <button type="submit">Đăng nhập</button>
        </form>
        <p><a href="signup.jsp">Đăng ký tài khoản</a></p>
    </div>

    <script>
        const loginForm = document.getElementById('login-form');
        const loginError = document.getElementById('login-error');

        loginForm.addEventListener('submit', function(event) {
            event.preventDefault(); // Ngăn chặn việc gửi form để xử lý bằng JavaScript

            // Đây là nơi bạn có thể kiểm tra thông tin đăng nhập
            // Ví dụ: so sánh username và password với dữ liệu trong cơ sở dữ liệu
            // Trong ví dụ này, sử dụng tên người dùng "testuser" và mật khẩu "testpassword" để đăng nhập thành công
            const usernameInput = document.getElementById('username').value;
            const passwordInput = document.getElementById('password').value;

            if (usernameInput === "testuser" && passwordInput === "testpassword") {
                loginError.textContent = "Đăng nhập thành công!";
            } else {
                loginError.textContent = "Tên đăng nhập hoặc mật khẩu không đúng.";
            }
        });
    </script>
</body>
</html>