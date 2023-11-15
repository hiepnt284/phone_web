package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Order;
import model.Products;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dal.CartDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;


public class BuyNowServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		CartDAO dao = new CartDAO();
		ProductDAO pdao = new ProductDAO();
		List<Cart> list = new ArrayList<Cart>();
		Cart cart = new Cart(uid, pid, 1);
		list.add(cart);
		for(Cart c:list) {
			c.setName(
					pdao.
					findById(c.getPid())
					.getName());
			c.setPrice(
					pdao.
					findById(c.getPid())
					.getPrice());
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pid", pid);
		request.getRequestDispatcher("checkoutbuynow.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int uid = Integer.parseInt(request.getParameter("uid"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			String date = java.time.LocalDate.now().toString();
			double totalmoney = Double.parseDouble(request.getParameter("totalmoney"));
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			Order o = new Order(date,uid,totalmoney,address,phone);
			OrderDAO dao = new OrderDAO();
			List<Cart> list = new ArrayList<Cart>();
			Cart cart = new Cart(uid, pid, 1);
			ProductDAO pdao = new ProductDAO();
			cart.setPrice(pdao.findById(cart.getPid()).getPrice());
			list.add(cart);
			dao.addOrder(o,list);
			response.sendRedirect("complete.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
