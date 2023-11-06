package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Products;

import java.io.IOException;
import java.util.List;

import dal.CategoryDAO;
import dal.ProductDAO;


public class HomeServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO pdao = new ProductDAO();
		CategoryDAO cdao = new CategoryDAO();
		List<Category> listc = cdao.getAll();
		List<Products> listp = pdao.getAll();
		request.setAttribute("listp", listp);
		request.setAttribute("listc", listc);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
