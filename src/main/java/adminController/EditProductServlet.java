package adminController;

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
public class EditProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		ProductDAO dao = new ProductDAO();

		try {
			Products p = dao.findById(id);
			request.setAttribute("p", p	);
			request.getRequestDispatcher("/admin/editproduct.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id")) ;
			String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
            Date releasedate = Date.valueOf(request.getParameter("releasedate"));
            String describe = request.getParameter("describe");
            String status = request.getParameter("status");
	        ProductDAO dao = new ProductDAO();
			Products p = new Products(id, name, price, releasedate, describe, status);
			boolean f=dao.update(p);
			HttpSession session = request.getSession();
			if(f) {
				session.setAttribute("succMsg", "update thanh cong");
			}else {
				session.setAttribute("failedMsg", "update that bai");
			}
			response.sendRedirect("/dien_thoai3/admin/listproduct");
		} catch (Exception e) {
			// TODO: handle exception
		}
		


	}

}
