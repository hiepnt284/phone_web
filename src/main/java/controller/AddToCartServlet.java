package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;

import java.io.File;
import java.io.IOException;

import dal.CartDAO;


public class AddToCartServlet extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int uid = Integer.parseInt(request.getParameter("uid"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			CartDAO dao = new CartDAO();
			Cart existCart = dao.findCart(uid, pid);
			HttpSession session = request.getSession();
			if(existCart!=null) {
				boolean f = dao.addOne(existCart);
	            if(f) {
	            	session.setAttribute("succMsg", "da them vao gio hang");
	            	response.sendRedirect("http://localhost:8080/dien_thoai3/home");
	            }else {
	            	session.setAttribute("failedMsg", "co gi do sai sai");
	            	response.sendRedirect("http://localhost:8080/dien_thoai3/home");
	            }
			}else {
				Cart cart = new Cart(uid,pid,1);
				boolean f = dao.addCart(cart);
	            if(f) {
	            	session.setAttribute("succMsg", "da them vao gio hang");
	            	response.sendRedirect(request.getHeader("referer"));
	            }else {
	            	session.setAttribute("failedMsg", "san pham da co trong gio hang");
	            	response.sendRedirect("http://localhost:8080/dien_thoai3/home");
	            }
			}       
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
