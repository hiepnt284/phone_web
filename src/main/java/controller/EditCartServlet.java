package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Products;

import java.io.IOException;
import java.util.List;

import dal.CartDAO;
import dal.ProductDAO;


public class EditCartServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		String action = request.getParameter("action");
		CartDAO dao = new CartDAO();
		ProductDAO pdao = new ProductDAO();
		Cart cart = dao.findCart(uid, pid);
		if ("increase".equals(action)) {
	        dao.addOne(cart);
	    } else if ("decrease".equals(action)) {
	        dao.minusOne(cart);
	        if(dao.findCart(uid, pid).getQuantity()==0) {
	        	dao.remove(cart);
	        }
	    } else if ("remove".equals(action)) {
	    	dao.remove(cart);
	    }
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
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

}
