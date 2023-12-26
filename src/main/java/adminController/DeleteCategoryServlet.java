package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dal.CategoryDAO;
import dal.ProductDAO;


public class DeleteCategoryServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		CategoryDAO dao = new CategoryDAO();
		boolean f = dao.deleteCategory(id);
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("succMsg", "delete thanh cong");
		}else {
			session.setAttribute("failedMsg", "delete that bai");
		}
		response.sendRedirect("/dien_thoai3/admin/listcategory");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
