package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Banner;
import model.Category;
import model.Products;
import model.User;

import java.io.IOException;
import java.util.List;

import dal.BannerDAO;
import dal.CartDAO;
import dal.CategoryDAO;
import dal.ProductDAO;


public class HomeServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ProductDAO pdao = new ProductDAO();
			CategoryDAO cdao = new CategoryDAO();
			BannerDAO bdao = new BannerDAO();
			List<Banner> listbn = bdao.getAll();
			List<Category> listc = cdao.getAll();
			List<Products> listbs = pdao.getBestSeller();
			List<Products> listav = pdao.getAdvancePro();
			List<Products> listch = pdao.getCheapPro();
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("user");
			if(u!=null) {
				CartDAO cartdao = new CartDAO();
				cartdao.cartRealtime(u.getId());
				int count = cartdao.countInCart(u.getId());
				request.setAttribute("count", count);
			}
			request.setAttribute("home", "home");
			session.setAttribute("listc", listc);
			request.setAttribute("listbs", listbs);
			request.setAttribute("listav", listav);
			request.setAttribute("listch", listch);
			request.setAttribute("listbn", listbn);
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
