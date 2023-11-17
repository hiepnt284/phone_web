package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Products;
import model.User;

import java.io.IOException;
import java.sql.Date;

import dal.UserDAO;


public class EditProfile extends HttpServlet {

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		int id = u.getId();
		UserDAO dao = new UserDAO();
		u = dao.getUserById(id);
		request.setAttribute("u", u);
		request.getRequestDispatcher("editprofile.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String username = request.getParameter("username");
			String fullname = request.getParameter("fullname");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
	        UserDAO dao = new UserDAO();
			User u = new User();
			u.setUsername(username);
			u.setFullname(fullname);
			u.setAddress(address);
			u.setPhone(phone);
			HttpSession session = request.getSession();
			boolean f=dao.update(u);
			if(f) {
				
				User u1 = dao.login(username);
				session.setAttribute("user", u1);
				session.setAttribute("succMsg", "update thanh cong");
			}else {
				session.setAttribute("failedMsg", "update that bai");
			}
			response.sendRedirect("http://localhost:8080/dien_thoai3/editprofile");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
