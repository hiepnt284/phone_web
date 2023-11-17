package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.Products;
import model.User;

import java.io.IOException;
import java.util.List;

import dal.OrderDAO;
import dal.ProductDAO;


public class OrderUser extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO dao = new OrderDAO();
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		int uid = u.getId();
		List<Order> list = dao.getOrderByUid(uid);
		request.setAttribute("list", list);
		request.getRequestDispatcher("listorderuser.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
