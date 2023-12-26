package userController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Products;

import java.io.File;
import java.io.IOException;

import dal.CartDAO;
import dal.ProductDAO;


public class AddToCartServlet extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int uid = Integer.parseInt(request.getParameter("uid"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			CartDAO dao = new CartDAO();
			ProductDAO pdao = new ProductDAO();
			Products p = pdao.findById(pid);
			HttpSession session = request.getSession();
			Cart existCart = dao.findCart(uid, pid);
			if(existCart!=null) {
				if(existCart.getQuantity()<p.getQuantity()) {
					boolean f = dao.addOne(existCart);
		            if(f) {
		            	session.setAttribute("succMsg", "da them vao gio hang");
		            	response.sendRedirect(request.getHeader("referer"));
		            }else {
		            	session.setAttribute("failedMsg", "co gi do sai sai");
		            	response.sendRedirect(request.getHeader("referer"));
		            }
				}else {
					session.setAttribute("failedMsg", "vượt quá số lượng trong kho");
	            	response.sendRedirect(request.getHeader("referer"));
				}
				
			}else {
				Cart cart = new Cart(uid,pid,1);
				boolean f = dao.addCart(cart);
	            if(f) {
	            	session.setAttribute("succMsg", "da them vao gio hang");
	            	response.sendRedirect(request.getHeader("referer"));
	            }else {
	            	session.setAttribute("failedMsg", "co gi do sai sai");
	            	response.sendRedirect(request.getHeader("referer"));
	            }
			}    
			   
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
