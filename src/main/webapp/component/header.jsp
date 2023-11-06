<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
	<div class="header">
		<a href="http://localhost:8080/dien_thoai3/home">
			<div class="logo-container"">
			<i class="fa-solid fa-mobile-screen-button logo"></i>MOBILE SHOP
			</div>
		</a>
		
		
		
		<div class="search-container">
			<input type="text" id="search-input" placeholder="Tìm kiếm sản phẩm" />
			<i class="fa-solid fa-magnifying-glass search"></i>
		</div>
		
		<div class="login">
			<c:if test="${not empty user }">
				<a href="" class="btn btn-success">
				<i class="fa-solid fa-user"></i>
				${user.fullname}
				</a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary">
				<i class="fa-solid fa-right-to-bracket"></i>
				Logout
				</a>
	        </c:if>
	        
	        <c:if test="${empty user }">
				<a href="login.jsp" class="btn btn-success">
				<i class="fa-solid fa-right-to-bracket"></i>
				Login
				</a>
				<a href="signup.jsp" class="btn btn-primary">
				<i class="fa-solid fa-user-plus"></i>
				Register
				</a>
	        </c:if>

		</div>
	</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h3>Do you want logout</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <a href="http://localhost:8080/dien_thoai3/logout" type="button" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>
	<div class="main-menu">
			<c:forEach items="${requestScope.listc }" var="c">
			<a href="products?cid=${c.id}">${c.name}</a>
			</c:forEach>	
	</div>