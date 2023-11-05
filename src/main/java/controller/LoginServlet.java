package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

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
			
			if("admin".equals(username)&&"123".equals(password)) {
				User us = new User();
				session.setAttribute("user", us);
				response.sendRedirect("admin/homeadmin.jsp");
			}else {
				User u = udao.login(username, password);
				if(u!=null) {
					session.setAttribute("user", u);
					response.sendRedirect("home.jsp");
				}else {
					session.setAttribute("failedMsg", "username or password sai");
					response.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
