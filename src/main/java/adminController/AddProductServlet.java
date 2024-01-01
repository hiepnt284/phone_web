package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Category;
import model.ProductImages;
import model.Products;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import dal.CategoryDAO;
import dal.DAO;
import dal.ProductDAO;
import dal.ProductImagesDAO;

@MultipartConfig
public class AddProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		List<Category> listC = dao.getAll();
		request.setAttribute("listC", listC);
		request.getRequestDispatcher("/admin/addproduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        int quantity = Integer.parseInt(request.getParameter("quantity"));
            Date releasedate = Date.valueOf(request.getParameter("releasedate"));
            String describe = request.getParameter("describe");
            int cid = Integer.parseInt(request.getParameter("cid"))  ;
            String status = request.getParameter("status");
            Part part = request.getPart("img");
            String fileName = part.getSubmittedFileName();
            System.out.println(fileName);
            
            CategoryDAO cdao = new CategoryDAO();
            
            Products p = new Products(name,price,releasedate,describe,fileName,cdao.getCategoryById(cid),status,quantity);
            
            ProductDAO dao = new ProductDAO();
            
            boolean f = dao.addProduct(p);
            
            HttpSession session = request.getSession();
            if(f) {
            	String path = getServletContext().getRealPath("")+"images";
            	
            	part.write(path + File.separator+fileName);
            	
            	
            	Collection<Part> imageParts = request.getParts();
            	int pid = dao.getIdNewest();
                for (Part imagePart : imageParts) {
                    if (imagePart.getContentType() != null && imagePart.getContentType().startsWith("image/")&&!imagePart.getName().equals("img")) {
                    	String fileNameImg = imagePart.getSubmittedFileName();
                    	System.out.println(fileNameImg);
                    	imagePart.write(path + File.separator+fileNameImg);
                        ProductImagesDAO pidao = new ProductImagesDAO();
                        ProductImages pi = new ProductImages(pid, fileNameImg);
                        pidao.addProductImages(pi);
                    }
                }
            	
            	session.setAttribute("succMsg", "them thanh cong");
            	response.sendRedirect("/dien_thoai3/admin/listproduct");
            }else {
            	session.setAttribute("failedMsg", "them that bai");
            	response.sendRedirect("/dien_thoai3/admin/listproduct");
            }
             
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
