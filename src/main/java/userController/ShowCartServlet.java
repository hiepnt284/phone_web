package userController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Products;
import model.User;

import java.io.IOException;
import java.util.List;

import dal.CartDAO;
import dal.ProductDAO;


public class ShowCartServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		CartDAO cartdao = new CartDAO();
		int count = cartdao.countInCart(u.getId());
		int uid = u.getId();
		CartDAO dao = new CartDAO();
		ProductDAO pdao = new ProductDAO();
		dao.cartRealtime(uid);
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
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/user/cart.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
