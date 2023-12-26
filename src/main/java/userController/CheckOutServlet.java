package userController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
		HttpSession session = request.getSession();
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
		int cou = dao.countInCart(uid);
		request.setAttribute("list", list);
		session.setAttribute("cou", cou);
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
			ProductDAO pdao = new ProductDAO();
			CartDAO cdao = new CartDAO();
			HttpSession session = request.getSession();
			int couOld = (int)session.getAttribute("cou");
			cdao.cartRealtime(uid);
			
			if(couOld==cdao.countInCart(uid)) {
				List<Cart> list = cdao.getAll(uid);
				boolean check = true;
				for(Cart i : list) {
					i.setPrice(pdao.findById(i.getPid()).getPrice());
					if(pdao.updateQuantity(i)==false) {
						check = false;
						break;
					}
				}
				if(check==true) {
					dao.addOrder(o,list);
					cdao.removeAll(uid);
					response.sendRedirect("/dien_thoai3/user/complete.jsp");
				}else {
					session.setAttribute("failedMsg", "có gì đó sai sai");
					response.sendRedirect("/dien_thoai3/user/showcart");
				}
			}else {
				session.setAttribute("failedMsg", "có sự thay đổi số lượng trong giỏ hàng");
				response.sendRedirect("/dien_thoai3/user/showcart");
			}
			
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
