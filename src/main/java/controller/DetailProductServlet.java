package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ProductImages;
import model.Products;
import model.User;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import dal.CartDAO;
import dal.ProductDAO;
import dal.ProductImagesDAO;

/**
 * Servlet implementation class UpdateServlet
 */
public class DetailProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		ProductDAO dao = new ProductDAO();
		ProductImagesDAO pdao = new ProductImagesDAO();

		try {
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("user");
			if(u!=null) {
				CartDAO cartdao = new CartDAO();
				int count = cartdao.countInCart(u.getId());
				request.setAttribute("count", count);
			}
			Products p = dao.findById(id);
			List<ProductImages> list = pdao.getAll(id);
			request.setAttribute("p", p	);
			request.setAttribute("list", list	);
			request.getRequestDispatcher("/detailproduct.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

}
