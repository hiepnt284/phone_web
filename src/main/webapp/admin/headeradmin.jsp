<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
	<div class="header">
		<div class="logo-container"">
			<i class="fa-solid fa-mobile-screen-button logo"></i>MOBILE SHOP
		</div>
		
		<div class="login">
			<c:if test="${not empty admin }">
				<a href="" class="btn btn-success">
				<i class="fa-solid fa-user"></i>
				${admin.username}
				</a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary">
				<i class="fa-solid fa-right-to-bracket"></i>
				Logout
				</a>
	        </c:if>
	        
	        <c:if test="${empty admin }">
				<a href="/dien_thoai3/login.jsp" class="btn btn-success">
				<i class="fa-solid fa-right-to-bracket"></i>
				Login
				</a>
				<a href="/dien_thoai3/signup.jsp" class="btn btn-primary">
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
        <a href="/dien_thoai3/logout" type="button" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>