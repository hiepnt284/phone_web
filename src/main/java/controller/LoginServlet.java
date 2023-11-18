package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import dal.UserDAO;


public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserDAO udao = new UserDAO();
			HttpSession session = request.getSession();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String rem = request.getParameter("rem");
			
			Cookie cu = new Cookie("cuser", username);
			Cookie cp = new Cookie("cpass", password);
			Cookie cr = new Cookie("crem", rem);
			if(rem!=null) {
				cu.setMaxAge(60*60*24*7);
				cp.setMaxAge(60*60*24*7);
				cr.setMaxAge(60*60*24*7);
			}else {
				cu.setMaxAge(0);
				cp.setMaxAge(0);
				cr.setMaxAge(0);
			}
			response.addCookie(cu);
			response.addCookie(cp);
			response.addCookie(cr);
			
			if("admin".equals(username)&&"123".equals(password)) {
				User us = new User();
				us.setUsername("Admin");
				session.setAttribute("admin", us);
				response.sendRedirect("/dien_thoai3/admin/homeadmin.jsp");
			}else {
				User u = udao.login(username);		
				if(u!=null) {
					String hashedpass = u.getPassword();
					if(BCrypt.checkpw(password, hashedpass)) {
						session.setAttribute("user", u);
						response.sendRedirect("/dien_thoai3/home");
					}else {
						session.setAttribute("failedMsg", "username or password sai");
						response.sendRedirect("/dien_thoai3/login.jsp");
					}
					
				}else {
					session.setAttribute("failedMsg", "username or password sai");
					response.sendRedirect("/dien_thoai3/login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
