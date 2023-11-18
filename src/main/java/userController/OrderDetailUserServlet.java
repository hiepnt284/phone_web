package userController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderDetail;
import model.Products;

import java.io.IOException;
import java.util.List;

import dal.OrderDAO;
import dal.ProductDAO;


public class OrderDetailUserServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oid = Integer.parseInt(request.getParameter("oid"));
		OrderDAO dao = new OrderDAO();
		List<OrderDetail> list = dao.getOrderDetailByOid(oid);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/user/orderdetailuser.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
