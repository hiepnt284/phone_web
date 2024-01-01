package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Products;
import model.User;

import java.io.IOException;
import java.util.List;

import dal.CartDAO;
import dal.CategoryDAO;
import dal.ProductDAO;


public class CategoryServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int cid = Integer.parseInt(request.getParameter("cid"));
			ProductDAO pdao = new ProductDAO();
			CategoryDAO cdao = new CategoryDAO();
			List<Category> listc = cdao.getAll();
			String namec = cdao.getCategoryById(cid).getName();
			List<Products> listp = pdao.getProductsByCid(cid);
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("user");
			if(u!=null) {
				CartDAO cartdao = new CartDAO();
				int count = cartdao.countInCart(u.getId());
				request.setAttribute("count", count);
			}
			request.setAttribute("cid", cid);
			request.setAttribute("listp", listp);
			request.setAttribute("listc", listc);
			request.setAttribute("namec", namec);
			request.setAttribute("a", "a");
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
