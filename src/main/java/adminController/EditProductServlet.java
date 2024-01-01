package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.ProductImages;
import model.Products;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import dal.ProductDAO;
import dal.ProductImagesDAO;

/**
 * Servlet implementation class UpdateServlet
 */
@MultipartConfig
public class EditProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		ProductDAO dao = new ProductDAO();
		ProductImagesDAO pdao = new ProductImagesDAO();
		try {
			Products p = dao.findById(id);
			List<ProductImages> list = pdao.getAll(id);
			request.setAttribute("p", p	);
			request.setAttribute("list", list	);
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
	        int quantity = Integer.parseInt(request.getParameter("quantity"));
            Date releasedate = Date.valueOf(request.getParameter("releasedate"));
            String describe = request.getParameter("describe");
            String status = request.getParameter("status");
            String oldimg = request.getParameter("oldimg");
            
            String path = getServletContext().getRealPath("") + "images";
            File file = new File(path);
            
            Collection<Part> imageParts = request.getParts();
         	if(imageParts!= null) {
         		ProductImagesDAO pdao = new ProductImagesDAO();
                List<ProductImages> list = pdao.getAll(id);
                for(ProductImages pi : list) {
               	 String oldpimg = pi.getImage();
               	 File oldpFile = new File(path + File.separator + oldpimg);
                    oldpFile.delete();
                }
                pdao.deleteProductImages(id);
           
           
                
                for (Part imagePart : imageParts) {
                    if (imagePart.getContentType() != null && imagePart.getContentType().startsWith("image/")&&!imagePart.getName().equals("img")) {
                    	String fileNameImg = imagePart.getSubmittedFileName();
                    	imagePart.write(path + File.separator+fileNameImg);
                        ProductImagesDAO pidao = new ProductImagesDAO();
                        ProductImages pi = new ProductImages(id, fileNameImg);
                        pidao.addProductImages(pi);
                    }
                }
         	}
            
            Part part = request.getPart("img");
            
            if (part != null && part.getSize() > 0) {
                ProductDAO dao = new ProductDAO();

                // Tạo đối tượng sản phẩm với thông tin mới
                String fileName = part.getSubmittedFileName();
                Products p = new Products(id, name, price, releasedate, describe, fileName, status, quantity);

                // Cập nhật thông tin sản phẩm trong cơ sở dữ liệu
                boolean f = dao.update(p);

                HttpSession session = request.getSession();
                if (f) {
                    // Nếu cập nhật thông tin sản phẩm thành công, xử lý tệp ảnh mới
                    

                    // Xóa tệp ảnh cũ nếu tồn tại
       			 	File oldFile = new File(path + File.separator + oldimg);
                    oldFile.delete();

                    // Lưu tệp ảnh mới vào thư mục
                    part.write(path + File.separator + fileName);
                    
                    
                    
                 	
                    
                         
                    

                    session.setAttribute("succMsg", "Cập nhật thành công");
                } else {
                    session.setAttribute("failedMsg", "Cập nhật thất bại");
                }
            } else {
                
                ProductDAO dao = new ProductDAO();
                Products p = new Products(id, name, price, releasedate, describe, oldimg, status, quantity);
                boolean f = dao.update(p);

                HttpSession session = request.getSession();
                if (f) {
                    session.setAttribute("succMsg", "Cập nhật thông tin thành công");
                } else {
                    session.setAttribute("failedMsg", "Cập nhật thông tin thất bại");
                }
            }

            response.sendRedirect("/dien_thoai3/admin/listproduct");
        } catch (Exception e) {
            // Xử lý ngoại lệ
            System.out.println(e);
        }
    }
}