package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Banner;

import java.io.IOException;
import java.util.List;

import dal.BannerDAO;



public class ListBannerServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BannerDAO dao = new BannerDAO();
		List<Banner> list = dao.getAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/listbanner.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
