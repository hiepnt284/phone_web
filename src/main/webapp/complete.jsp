<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
            font-size: 18px;
            line-height: 1.6;
        }

        .buttons {
            margin-top: 20px;
        }

        .buttons a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            margin: 0 10px;
            text-decoration: none;
            cursor: pointer;
            background-color: #4caf50;
            color: #fff;
            border-radius: 5px;
        }

        .buttons a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Đặt hàng thành công!</h1>
        <p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được xác nhận và đang được xử lý.</p>
        
        <div class="buttons">
            <a href="#" >Xem chi tiết đơn hàng</a>
            <a href="http://localhost:8080/dien_thoai3/home" >Tiếp tục mua sắm</a>
        </div>
    </div>


</body>
</html>
