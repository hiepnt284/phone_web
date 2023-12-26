package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dal.OrderDAO;

/**
 * Servlet implementation class HandleOrderServlet
 */
public class HandleOrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		int oid = Integer.parseInt(request.getParameter("oid"));
		OrderDAO dao = new OrderDAO();
		if(act.equals("accept")) {
			dao.acceptOrder(oid);
		}
		if(act.equals("cancel")) {
			dao.cancelOrder(oid);
		}
		if(act.equals("delivery")) {
			dao.deliveryOrder(oid);
		}
		response.sendRedirect(request.getHeader("referer"));
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
