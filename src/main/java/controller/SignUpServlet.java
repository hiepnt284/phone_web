package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import model.User;

import java.io.IOException;

import dal.UserDAO;


public class SignUpServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username = request.getParameter("username");
			String fullname = request.getParameter("fullname");
			String rawpassword = request.getParameter("password");
			String password  = BCrypt.hashpw(rawpassword, BCrypt.gensalt());
			String phone = request.getParameter("phone");
			User u = new User(username,fullname,password,phone);
			HttpSession session = request.getSession();
			UserDAO udao = new UserDAO();
			if(udao.signUp(u)) {
				session.setAttribute("succMsg", "Đăng ký thành công");
			}else {
				session.setAttribute("failedMsg", "Username đã tồn tại");
			}
			response.sendRedirect("/dien_thoai3/signup.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
