package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.Products;

import java.io.IOException;
import java.util.List;

import dal.OrderDAO;
import dal.ProductDAO;


public class ListOrderServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO dao = new OrderDAO();
		List<Order> list = dao.getAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/listorder.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
