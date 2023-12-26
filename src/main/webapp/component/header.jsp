<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<div class="headerr">
	<div class="header">
		<a href="/dien_thoai3/home">
			<div class="logo-container"">
				<i class="fa-solid fa-mobile-screen-button logo"></i>MOBILE SHOP
			</div>
		</a>




		<form method="get" action="/dien_thoai3/search">
			<div class="search-container">
				<input type="text" id="search-input" name="key"
					placeholder="Tìm kiếm sản phẩm" value="${requestScope.key }" />
				<button type="submit" class="search-button">
					<i class="fa-solid fa-magnifying-glass search"></i>
				</button>
			</div>
		</form>

		<c:if test="${not empty user }">
			<a class="cart" href="/dien_thoai3/user/showcart"><i
				class="fa-solid fa-cart-shopping cart-icon"></i>${requestScope.count}</a>
		</c:if>
		<c:if test="${empty user }">
			<a class="cart" href="/dien_thoai3/login.jsp"><i
				class="fa-solid fa-cart-shopping cart-icon"></i></a>
		</c:if>


		<div class="login">
			<c:if test="${not empty user }">
				<a href="/dien_thoai3/user/userpage" class="btn btn-success"> <i
					class="fa-solid fa-user"></i> ${user.fullname}
				</a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal"
					class="btn btn-primary"> <i
					class="fa-solid fa-right-to-bracket"></i> Logout
				</a>
			</c:if>

			<c:if test="${empty user }">
				<a href="/dien_thoai3/login.jsp" class="btn btn-success"> <i
					class="fa-solid fa-right-to-bracket"></i> Login
				</a>
				<a href="/dien_thoai3/signup.jsp" class="btn btn-primary"> <i
					class="fa-solid fa-user-plus"></i> Register
				</a>
			</c:if>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Logout</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h3>Do you want logout</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<a href="/dien_thoai3/logout" type="button" class="btn btn-primary">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<div class="main-menu">
		<c:forEach items="${requestScope.listc}" var="c">
			<c:set var="cid" value="${requestScope.cid}" />
			<a href="/dien_thoai3/category?cid=${c.id}"
				<c:if test="${c.id eq cid}">
               class="activee"
           </c:if>>
				${c.name} </a>
		</c:forEach>
	</div>
</div>
