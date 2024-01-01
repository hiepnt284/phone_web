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


public class ProductFilterServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ProductDAO pdao = new ProductDAO();
			CategoryDAO cdao = new CategoryDAO();
			int cid = Integer.parseInt(request.getParameter("cid"));
			List<Products> list = pdao.getProductsByCidByAd(cid);
			List<Category> listcate = cdao.getAll();
			int page, numberperpage =5;
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
			List<Products>listp =  pdao.getListByPage(list, start, end);
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("user");
			if(u!=null) {
				CartDAO cartdao = new CartDAO();
				int count = cartdao.countInCart(u.getId());
				request.setAttribute("count", count);
			}
			request.setAttribute("list", listp);
			request.setAttribute("numberpage", numberpage);
			request.setAttribute("page", page);
			request.setAttribute("listcate", listcate);
			request.setAttribute("cid", cid);
			request.getRequestDispatcher("/admin/listproduct.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
