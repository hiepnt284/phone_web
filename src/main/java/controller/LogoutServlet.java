package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;



public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			if(session.getAttribute("user")!=null) {
				session.removeAttribute("user");
				response.sendRedirect(request.getHeader("referer"));
			}
			if(session.getAttribute("admin")!=null) {
				session.removeAttribute("admin");
				HttpSession session2 = request.getSession();
				session.setAttribute("succMsg", "Logout Successfully");
				response.sendRedirect("/dien_thoai3/login.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
