<!DOCTYPE html>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Home</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<%@include file="component/allcss.jsp"%>
</head>
<style>
</style>
<body>
	<div class="wrapp">
		<div class="containerr">
			<%@include file="component/header.jsp"%>

			<c:if test="${not empty succMsg }">

				<script type="text/javascript">
					toastr.options = {
						"closeButton" : true,
						"debug" : false,
						"newestOnTop" : false,
						"progressBar" : true,
						"positionClass" : "toast-top-center",
						"preventDuplicates" : false,
						"onclick" : null,
						"showDuration" : "300",
						"hideDuration" : "1000",
						"timeOut" : "2000",
						"extendedTimeOut" : "1000",
						"showEasing" : "swing",
						"hideEasing" : "linear",
						"showMethod" : "fadeIn",
						"hideMethod" : "fadeOut"
					}
					toastr.success('${succMsg}');
				</script>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<c:if test="${not empty failedMsg }">
				<script type="text/javascript">
					toastr.options = {
						"closeButton" : true,
						"debug" : false,
						"newestOnTop" : false,
						"progressBar" : true,
						"positionClass" : "toast-top-center",
						"preventDuplicates" : false,
						"onclick" : null,
						"showDuration" : "300",
						"hideDuration" : "1000",
						"timeOut" : "2000",
						"extendedTimeOut" : "1000",
						"showEasing" : "swing",
						"hideEasing" : "linear",
						"showMethod" : "fadeIn",
						"hideMethod" : "fadeOut"
					}
					toastr.error('${failedMsg}');
				</script>
				<c:remove var="failedMsg" scope="session" />
			</c:if>
			
			<c:set var="bn" value="${requestScope.listbn}" />

			<c:if test="${not empty requestScope.listbs }">
				<div class="banner">
				<a href="${bn[0].link }">
					<img alt="banner" src="images/${bn[0].img }">
					</a>
				</div>
				<div class="cnt-main">
					<div class="banner1">
					<a href="${bn[1].link }">
						<img alt="banner" src="images/${bn[1].img }">
						</a>
					</div>
					<div class="main-cnt">
						<section class="featured-products">
							<h2 class="title-content">SẢN PHẨM BÁN CHẠY</h2>
							<div class="product-container">
								<c:forEach items="${requestScope.listbs }" var="p">
									<c:set var="id" value="${p.id}" />
									<div class="product-item">
										<img alt="anh" src="images/${p.image }">
										<h3>${p.name}</h3>
										<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
										<p class="price">${p.price }VNĐ</p>


										<a href="/dien_thoai3/detailproduct?id=${id}"
											class="btn btn-success">Mua ngay</a>
									</div>
								</c:forEach>

							</div>
						</section>
						<section class="featured-products">
							<h2 class="title-content">SẢN PHẨM CAO CẤP</h2>
							<div class="product-container">
								<c:forEach items="${requestScope.listav }" var="p">
									<c:set var="id" value="${p.id}" />
									<div class="product-item">
										<img alt="anh" src="images/${p.image }">
										<h3>${p.name}</h3>
										<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
										<p class="price">${p.price }VNĐ</p>


										<a href="/dien_thoai3/detailproduct?id=${id}"
											class="btn btn-success">Mua ngay</a>
									</div>
								</c:forEach>

							</div>
						</section>
						<section class="featured-products">
							<h2 class="title-content">SẢN PHẨM GIÁ RẺ</h2>
							<div class="product-container">
								<c:forEach items="${requestScope.listch }" var="p">
									<c:set var="id" value="${p.id}" />
									<div class="product-item">
										<img alt="anh" src="image	s/${p.image }">
										<h3>${p.name}</h3>
										<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
										<p class="price">${p.price }VNĐ</p>


										<a href="/dien_thoai3/detailproduct?id=${id}"
											class="btn btn-success">Mua ngay</a>
									</div>
								</c:forEach>

							</div>
						</section>
					</div>

					<div class="banner2">
					<a href="${bn[1].link }">
						<img alt="banner" src="images/${bn[2].img }">
					</a>
					</div>
				</div>

			</c:if>
			<c:if test="${not empty a }">
				<div style="margin-top: 173px"></div>
			</c:if>
			<c:if test="${not empty key }">
				<section class="featured-products filterr">
					<h2 class="title-content">TỪ KHÓA: ${requestScope.key}</h2>
					<h2>${requestScope.soluong}kếtquả</h2>
					<div class="product-container">
						<c:forEach items="${requestScope.listp }" var="p">
							<c:set var="id" value="${p.id}" />
							<div class="product-item">
								<img alt="anh" src="images/${p.image }">
								<h3>${p.name}</h3>
								<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
								<p class="price">${p.price }VNĐ</p>


								<a href="/dien_thoai3/detailproduct?id=${id}"
									class="btn btn-success">Mua ngay</a>
							</div>
						</c:forEach>

					</div>
				</section>
			</c:if>
			<c:if test="${not empty cid }">
				<section class="featured-products filterr">
					<h2 class="title-content">Danh mục ${requestScope.namec}</h2>
					<div class="product-container">
						<c:forEach items="${requestScope.listp }" var="p">
							<c:set var="id" value="${p.id}" />
							<div class="product-item">
								<img alt="anh" src="images/${p.image }">
								<h3>${p.name}</h3>
								<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
								<p class="price">${p.price }VNĐ</p>


								<a href="/dien_thoai3/detailproduct?id=${id}"
									class="btn btn-success">Mua ngay</a>
							</div>
						</c:forEach>

					</div>
				</section>
			</c:if>
			<c:if test="${not empty pri }">
				<div class="containerrr">
					<div class="side">
						<div class="sidebarrr">
							<ul>
								<li class="title-side">Danh mục</li>
								<li class="${(cidd==0)?'active1':'' }"><a
									href="/dien_thoai3/filter-product">Tất cả</a></li>
								<c:forEach items="${requestScope.listcate }" var="c">
									<li class="${(cidd==c.id)?'active1':'' }"><a
										href="/dien_thoai3/filter-product?cid=${c.id }">${c.name }</a></li>
								</c:forEach>


								<!-- Add more categories as needed -->
							</ul>
						</div>
						<div class="sidebarrr">
							<ul>
								<li class="title-side">Giá</li>
								<li class="${(pri==0)?'active1':'' }"><a
									href="/dien_thoai3/filter-product?cid=${cidd }&pri=0">Tất
										cả</a></li>

								<li class="${(pri==1)?'active1':'' }"><a
									href="/dien_thoai3/filter-product?cid=${cidd }&pri=1">Dưới
										5000VNĐ</a></li>
								<li class="${(pri==2)?'active1':'' }"><a
									href="/dien_thoai3/filter-product?cid=${cidd }&pri=2">5000-10000VNĐ</a></li>
								<li class="${(pri==3)?'active1':'' }"><a
									href="/dien_thoai3/filter-product?cid=${cidd }&pri=3">10000-15000VNĐ</a></li>
								<li class="${(pri==4)?'active1':'' }"><a
									href="/dien_thoai3/filter-product?cid=${cidd }&pri=4">Trên
										15000VNĐ</a></li>

								<!-- Add more categories as needed -->
							</ul>
						</div>
					</div>





					<div class="main-content">
						<section class="featured-products">

							<div class="product-container filterr">
								<c:if test="${empty listap}">
									<h1>Chưa có sản phẩm nào</h1>
								</c:if>
								<c:if test="${not empty listap}">
									<c:forEach items="${requestScope.listap }" var="p">
										<c:set var="id" value="${p.id}" />
										<div class="product-item">
											<img alt="anh" src="images/${p.image }">
											<h3>${p.name}</h3>
											<p class="price" style="text-decoration: line-through;">${p.price*2 }VNĐ</p>
											<p class="price">${p.price }VNĐ</p>


											<a href="/dien_thoai3/detailproduct?id=${id}"
												class="btn btn-success">Mua ngay</a>
										</div>
									</c:forEach>
								</c:if>


							</div>
							<c:set var="page" value="${requestScope.page }" />
							<c:set var="numberpage" value="${requestScope.numberpage }" />
							<div class="pagination">
								<a <c:if test="${page==1}">class="hidee"</c:if>
									href="/dien_thoai3/filter-product?cid=${cidd }&pri=${pri }&page=${page-1}">&laquo;</a>

								<c:forEach begin="${1 }" end="${numberpage }" var="i">
									<a
										<c:if test="${i eq page}"> 
							class="active"
							 </c:if>
										href="/dien_thoai3/filter-product?cid=${cidd }&pri=${pri }&page=${i}">${i }</a>

								</c:forEach>
								<a
									<c:if test="${page==numberpage || empty listap}">class="hidee"</c:if>
									href="/dien_thoai3/filter-product?cid=${cidd }&pri=${pri }&page=${page+1}">&raquo;</a>
							</div>
						</section>
					</div>

				</div>

			</c:if>
			<c:if test="${not empty contact }">
			<div class="contact-container">
			<h3>Email: mobileshop02@gmail.com</h3>
			<br>
			<h3>Điện thoại: 19009099</h3> 
			<br>
			<h3>Địa chỉ: 123 Đường ABC, Thành phố XYZ</h3>
			</div>
			

			
        	</c:if>
		</div>




		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>