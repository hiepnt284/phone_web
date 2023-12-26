package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Products;

import java.io.IOException;
import java.sql.Date;

import dal.CategoryDAO;
import dal.ProductDAO;

/**
 * Servlet implementation class UpdateServlet
 */
public class EditCategoryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		CategoryDAO dao = new CategoryDAO();

		try {
			Category p = dao.findById(id);
			request.setAttribute("p", p	);
			request.getRequestDispatcher("/admin/editcategory.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id")) ;
			String name = request.getParameter("name");
            String describe = request.getParameter("describe");
	        CategoryDAO dao = new CategoryDAO();
			Category p = new Category(id, name, describe);
			boolean f=dao.update(p);
			HttpSession session = request.getSession();
			if(f) {
				session.setAttribute("succMsg", "update thanh cong");
			}else {
				session.setAttribute("failedMsg", "update that bai");
			}
			response.sendRedirect("/dien_thoai3/admin/listcategory");
		} catch (Exception e) {
			// TODO: handle exception
		}
		


	}

}
