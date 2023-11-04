package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

import dal.UserDAO;


public class SignUpServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			User u = new User(username,password,phone);
			UserDAO udao = new UserDAO();
			if(udao.signUp(u)) {
				request.setAttribute("mess", "dang ky thanh cong");
			}else {
				request.setAttribute("mess", "dang ky that bai");
			}
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
