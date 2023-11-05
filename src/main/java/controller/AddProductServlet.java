package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Category;
import model.Products;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import dal.CategoryDAO;
import dal.DAO;
import dal.ProductDAO;

@MultipartConfig
public class AddProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		List<Category> listC = dao.getAll();
		request.setAttribute("listC", listC);
		request.getRequestDispatcher("admin/addproduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
            Date releasedate = Date.valueOf(request.getParameter("releasedate"));
            String describe = request.getParameter("describe");
            int cid = Integer.parseInt(request.getParameter("cid"))  ;
            Part part = request.getPart("img");
            String fileName = part.getSubmittedFileName();
            System.out.println(fileName);
            
            CategoryDAO cdao = new CategoryDAO();
            
            Products p = new Products(name,price,releasedate,describe,fileName,cdao.getCategoryById(cid));
            
            ProductDAO dao = new ProductDAO();
            
            boolean f = dao.addProduct(p);
            
            HttpSession session = request.getSession();
            if(f) {
            	String path = getServletContext().getRealPath("")+"images";
            	System.out.println(path);
            	File file = new File(path);
            	
            	part.write(path + File.separator+fileName);
            	
            	session.setAttribute("succMsg", "them thanh cong");
            	response.sendRedirect("http://localhost:8080/dien_thoai3/listproduct");
            }else {
            	session.setAttribute("failedMsg", "them that bai");
            	response.sendRedirect("http://localhost:8080/dien_thoai3/listproduct");
            }
             
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
