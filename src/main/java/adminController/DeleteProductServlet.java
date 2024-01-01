package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ProductImages;
import model.Products;

import java.io.File;
import java.io.IOException;
import java.util.List;

import dal.ProductDAO;
import dal.ProductImagesDAO;


public class DeleteProductServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		ProductDAO dao = new ProductDAO();
		Products p = dao.findById(id);
		boolean f = dao.deleteProduct(id);
		String oldimg = p.getImage();
		HttpSession session = request.getSession();
		if(f) {
			String path = getServletContext().getRealPath("") + "images";
			 File oldFile = new File(path + File.separator + oldimg);
             oldFile.delete();
             ProductImagesDAO pdao = new ProductImagesDAO();
             List<ProductImages> list = pdao.getAll(id);
             for(ProductImages pi : list) {
            	 String oldpimg = pi.getImage();
            	 File oldpFile = new File(path + File.separator + oldpimg);
                 oldpFile.delete();
             }
			session.setAttribute("succMsg", "delete thanh cong");
		}else {
			session.setAttribute("failedMsg", "delete that bai");
		}
		response.sendRedirect("/dien_thoai3/admin/listproduct");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
