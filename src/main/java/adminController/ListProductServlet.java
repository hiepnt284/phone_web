package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Products;
import model.User;

import java.io.IOException;
import java.util.List;

import dal.CartDAO;
import dal.CategoryDAO;
import dal.ProductDAO;


public class ListProductServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = new ProductDAO();
		CategoryDAO cdao = new CategoryDAO();
		List<Products> list = dao.getAllByAd();
		List<Category> listcate = cdao.getAll();
		int page, numberperpage = 5;
		int size = list.size();
		int numberpage = (size%numberperpage==0?(size/numberperpage):((size/numberperpage)+1));
		String rawpage = request.getParameter("page");
		if(rawpage==null) {
			page=1;
		}else {
			page = Integer.parseInt(rawpage);
			if(page==0){
				page=1;
			}
			if(page>numberpage) {
				page=numberpage;
			}
		}
		int start = (page-1)*numberperpage;
		int end = Math.min(page*numberperpage, size);
		List<Products>listp =  dao.getListByPage(list, start, end);
		request.setAttribute("cid", 0);
		request.setAttribute("numberpage", numberpage);
		request.setAttribute("page", page);
		request.setAttribute("listcate", listcate);
		request.setAttribute("list", listp);
		request.getRequestDispatcher("/admin/listproduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
