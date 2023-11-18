package userController;

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
import java.util.List;

import dal.CartDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;


public class CheckOutServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		CartDAO dao = new CartDAO();
		ProductDAO pdao = new ProductDAO();
		List<Cart> list = dao.getAll(uid);
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
		request.getRequestDispatcher("/user/checkout.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int uid = Integer.parseInt(request.getParameter("uid"));
			String date = java.time.LocalDate.now().toString();
			double totalmoney = Double.parseDouble(request.getParameter("totalmoney"));
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			Order o = new Order(date,uid,totalmoney,address,phone);
			OrderDAO dao = new OrderDAO();
			CartDAO cdao = new CartDAO();
			List<Cart> list = cdao.getAll(uid);
			ProductDAO pdao = new ProductDAO();
			for(Cart i : list) {
				i.setPrice(pdao.findById(i.getPid()).getPrice());
			}
			dao.addOrder(o,list);
			cdao.removeAll(uid);
			response.sendRedirect("/dien_thoai3/user/complete.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
