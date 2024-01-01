package adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Banner;
import model.Products;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import dal.BannerDAO;
import dal.ProductDAO;

/**
 * Servlet implementation class UpdateServlet
 */
@MultipartConfig
public class EditBannerServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		BannerDAO dao = new BannerDAO();

		try {
			Banner p = dao.findById(id);
			request.setAttribute("p", p	);
			request.getRequestDispatcher("/admin/editbanner.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id")) ;
			String name = request.getParameter("name");
            String oldimg = request.getParameter("oldimg");
            String link = request.getParameter("link");
            Part part = request.getPart("img");
            
            if (part != null && part.getSize() > 0) {
            	BannerDAO dao = new BannerDAO();

                // Tạo đối tượng sản phẩm với thông tin mới
                String fileName = part.getSubmittedFileName();
                Banner p = new Banner(id, name,  fileName, link);

                // Cập nhật thông tin sản phẩm trong cơ sở dữ liệu
                boolean f = dao.update(p);

                HttpSession session = request.getSession();
                if (f) {
                    // Nếu cập nhật thông tin sản phẩm thành công, xử lý tệp ảnh mới
                    String path = getServletContext().getRealPath("") + "images";
                    File file = new File(path);

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
                
            	BannerDAO dao = new BannerDAO();
            	 Banner p = new Banner(id, name,  oldimg, link);
                boolean f = dao.update(p);

                HttpSession session = request.getSession();
                if (f) {
                    session.setAttribute("succMsg", "Cập nhật thông tin thành công");
                } else {
                    session.setAttribute("failedMsg", "Cập nhật thông tin thất bại");
                }
            }

            response.sendRedirect("/dien_thoai3/admin/listbanner");
        } catch (Exception e) {
            // Xử lý ngoại lệ
            System.out.println(e);
        }
    }
}