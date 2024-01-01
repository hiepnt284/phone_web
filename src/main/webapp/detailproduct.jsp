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
<link rel="stylesheet" type="text/css" href="css/header.css">
<%@include file="component/allcss.jsp"%>
<style type="text/css">


.product-containerr {
	width: 1000px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	display: flex;
}

.product-image {
	width: 40%;
	margin-right: 20px;
}
#big-img{
	width:100%;
	height: 384px;
	border: 2px solid rgb(233,233,233);
	margin-bottom: 3px;
}
.small-img-cnt{
}
.small-img{
	width: 24%;
	border: 2px solid rgb(233,233,233);
	height: 89px
}

.product-info {
	flex-grow: 1;
	width: 50%;
	font-size: 16px;
	line-height: 1.6;
}
.pri{
	font-size: 20px
}
.des{
font-size: 15px;
min-height: 190px;
}


  .selected {
    border: 2px solid #000; /* Đường viền khi được chọn, bạn có thể thay đổi màu sắc nếu cần */
  }
</style>
</head>
<body>
	<%@include file="component/header.jsp"%>
	<c:set var="p" value="${requestScope.p}" />

		<c:if test="${not empty succMsg }">

		<script type="text/javascript">
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": true,
				  "positionClass": "toast-top-center",
				  "preventDuplicates": false,
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "2000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
			toastr.success('${succMsg}');
		</script>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<script type="text/javascript">
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": true,
				  "positionClass": "toast-top-center",
				  "preventDuplicates": false,
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "2000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
			toastr.error('${failedMsg}');
		</script>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div style="margin-bottom: 10px">.</div>
	<div class="product-containerr">
		<div class="product-image">
			<img id="big-img" src="images/${p.image}" alt="Product Image" >
			<div class="small-img-cnt">
			<img class="small-img" src="images/${p.image}" alt="Product Image" >
			<c:forEach items="${requestScope.list }" var="pi">
			<img class="small-img" src="images/${pi.image }" alt="Product Image" >
			</c:forEach>
			
			</div>
		</div>
		
		<div class="product-info">
			<h2>${p.name}</h2>
			<p class="pri">
				<strong>Giá:</strong> ${p.price} VNĐ
			</p>
			<p>
				<strong>Ngày ra mắt:</strong> ${p.releaseDate}
			</p>
			<p class="des">
				${p.describe}</p>
			<p>
				<strong>Tình trạng: </strong>${(p.quantity > 0) ? 'còn hàng' : 'hết hàng'}</p>

			<c:if test="${p.quantity>0 }">
				<a class="btn btn-primary"
					href="/dien_thoai3/user/buynow?uid=${user.id}&pid=${p.id }">
					Mua ngay</a>
				<a
					href="/dien_thoai3/user/addtocart?uid=${user.id}&pid=${p.id }"
					class="btn btn-success"> Add to cart </a>

			</c:if>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
	
<script type="text/javascript">
  var bigImg = document.getElementById("big-img");
  var smallImg = document.getElementsByClassName("small-img");

  smallImg[0].classList.add("selected");
  
  for (var i = 0; i < smallImg.length; i++) {
    smallImg[i].onclick = function() {
      // Đặt lại đường viền cho tất cả các hình ảnh nhỏ
      for (var j = 0; j < smallImg.length; j++) {
        smallImg[j].classList.remove("selected");
      }

      // Đặt đường viền cho hình ảnh nhỏ được nhấp vào
      this.classList.add("selected");

      // Đặt ảnh lớn
      bigImg.src = this.src;
    };
  }
</script>


</body>
</html>