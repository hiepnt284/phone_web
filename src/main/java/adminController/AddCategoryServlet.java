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

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import dal.CategoryDAO;
import dal.DAO;
import dal.ProductDAO;

@MultipartConfig
public class AddCategoryServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        String name = request.getParameter("name");
	        
            String describe = request.getParameter("describe");
            
            
            CategoryDAO cdao = new CategoryDAO();
            
            Category c = new Category(name,describe);
            
            
            boolean f = cdao.addCategory(c);
            
            HttpSession session = request.getSession();
            if(f) {
            	session.setAttribute("succMsg", "them thanh cong");
            	response.sendRedirect("/dien_thoai3/admin/listcategory");
            }else {
            	session.setAttribute("failedMsg", "them that bai");
            	response.sendRedirect("/dien_thoai3/admin/listcategory");
            }
             
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
