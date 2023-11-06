package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Products;

import java.io.IOException;
import java.sql.Date;

import dal.ProductDAO;

/**
 * Servlet implementation class UpdateServlet
 */
public class DetailProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		ProductDAO dao = new ProductDAO();

		try {
			Products p = dao.findById(id);
			request.setAttribute("p", p	);
			request.getRequestDispatcher("detailproduct.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

}
