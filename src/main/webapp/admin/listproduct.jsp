<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
    <title>Trang Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/homeadmin.css"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}


.logo-container {
	display: flex;
	align-items: center;
	font-size: 30px;

}
		



.icon-feature{
	font-size: 50px;
}
.logo-container {
	display: flex;
	align-items: center;
	font-size: 30px;

}
.logo,
.cart-icon {
	font-size: 40px;
}
.header {
	display: flex;
	padding: 20px;
	background-color: rgb(255, 128, 0);
	align-items: center;
	color: white;
	justify-content: space-between;
}
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: rgb(244,244,244);
        }

        h1 {
            text-align: center;
            padding: 10px;
            
        }

        h3 {
            color: red;
            text-align: center;
        }

        

        input[type="submit"] {
            background-color: rgb(255, 128, 0) !important;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: orangered !important;
        }
       	.button {
        display: inline-block;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: rgb(255, 128, 0) !important;
        color: white;
    }

    	.button:hover {
        background-color: orangered !important;
    }
    label {
	width: 120px;
}


    h1 {
        text-align: center;
    }

    table {
    	margin-top:20px;
        width: 80%;
        border-collapse: collapse;
        background-color: #fff;
    }

    table, th, td {
        border: 1px solid #ccc;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: rgb(255, 128, 0);
        color: #fff;
    }

    .action-buttons {
        text-align: center;
        width: 180px;
    }
	.pagination{
	margin-top: 20px;
	display: flex;
	justify-content: center;
}
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.hidee{
	visibility: hidden;
}
.sidebarrr {
    width: 200px;
    margin-top: 0px;
    background-color:white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px #00000029;
    float: left;
    margin-left: 50px;
    display: inline-block;
}
.title-side{
	font-weight: 1000;
	font-size: 20px;
}

.sidebarrr ul {
    list-style-type: none;
    padding: 0;
}

.sidebarrr li {
    margin-bottom: 10px;
    padding: 5px;
    border-radius: 5px;
}

.sidebarrr a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

.sidebarrr a:hover {
    color: #007bff;
}
.active1{
	background-color: orange;
}

.main-content {
    flex: 1;
    padding: 20px;
    padding-top: 0;
}
    </style>

<script type="text/javascript">
    function doDelete(id) {
        if (confirm("Are you sure to delete product with id =" + id)) {
            window.location = "/dien_thoai3/admin/deleteproduct?id=" + id;
        }
    }
</script>
</head>
<body>
<%@include file="headeradmin.jsp"%>
    <h1>Danh sách sản phẩm</h1>
    
    <center>
    	<a class="button" href="/dien_thoai3/admin/homeadmin.jsp">Back</a>
    	<a class="button" href="/dien_thoai3/admin/addproduct">Thêm sản phẩm</a>
	    <c:if test="${not empty succMsg }">
	        	<h3 style="color:green">${succMsg}</h3>
	        	<c:remove var="succMsg" scope="session"/>
	        </c:if>
	        <c:if test="${not empty failedMsg }">
	        	<h3 style="color:red">${failedMsg}</h3>
	        	<c:remove var="failedMsg" scope="session"/>
	    </c:if>
	    <div class="containerrr">
					<div class="sidebarrr">
						<ul>
							<li class="title-side">Danh mục</li>
							<li class="${(cid==0)?'active1':'' }"> <a href="/dien_thoai3/admin/listproduct">Tất cả</a></li>
							<c:forEach items="${requestScope.listcate }" var="c">
								<li class="${(cid==c.id)?'active1':'' }"><a href="/dien_thoai3/admin/product-filter?cid=${c.id }">${c.name }</a></li>
							</c:forEach>


							<!-- Add more categories as needed -->
						</ul>
					</div>
					<div class="main-content">
        <table>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Ảnh</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Danh mục</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.list}" var="c">
                <c:set var="id" value="${c.id}" />
                <tr>
                    <td>${id}</td>
                    <td>${c.name}</td>
                    <td><img style="width: 120px; height: 120px" alt="anh" src="../images/${c.image }"></td>
                    <td>${c.quantity}</td>
                    <td>${c.price}</td>
                    <td>${c.category.name}</td>
                    <td>${c.status}</td>
                    <td class="action-buttons">
                        <a class="button" href="/dien_thoai3/admin/editproduct?id=${id}">Update</a>
                        <a class="button" href="#" onclick="doDelete('${id}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        	<c:set var="page" value="${requestScope.page }" />
							<c:set var="numberpage" value="${requestScope.numberpage }" />
							<div class="pagination">
							<c:if test="${cid==0 }">
								<a <c:if test="${page==1}">class="hidee"</c:if>
									href="/dien_thoai3/admin/listproduct?page=${page-1}">&laquo;</a>
							</c:if>
							<c:if test="${cid!=0 }">
								<a <c:if test="${page==1}">class="hidee"</c:if>
									href="/dien_thoai3/admin/product-filter?cid=${cid }&page=${page-1}">&laquo;</a>
							</c:if>
							
								<c:forEach begin="${1 }" end="${numberpage }" var="i">
									<c:if test="${cid==0 }">
										<a
											<c:if test="${i eq page}"> 
							class="active"
							 </c:if>
											href="/dien_thoai3/admin/listproduct?page=${i}">${i }</a>
									</c:if>
									<c:if test="${cid!=0 }">
										<a
											<c:if test="${i eq page}"> 
							class="active"
							 </c:if>
											href="/dien_thoai3/admin/product-filter?cid=${cid }&page=${i}">${i }</a>
									</c:if>

								</c:forEach>
								<c:if test="${cid==0 }">
								<a <c:if test="${page==numberpage}">class="hidee"</c:if>
									href="dien_thoai3/admin/listproduct?page=${page+1}">&raquo;</a>
							</c:if>
							<c:if test="${cid!=0 }">
								<a <c:if test="${page==numberpage}">class="hidee"</c:if>
									href="/dien_thoai3/admin/product-filter?cid=${cid }&page=${page+1}">&raquo;</a>
							</c:if>
							</div>
    </center>
    </div>
    </div>
</body>
</html>
