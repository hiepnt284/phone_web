package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import dal.UserDAO;

public class ChangePasswordServlet extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		String username = u.getUsername();
		String pass = u.getPassword();
		String oldpass = request.getParameter("oldpass");
		String newpassraw = request.getParameter("newpass");
		if(BCrypt.checkpw(oldpass, pass)) {
			UserDAO dao = new UserDAO();
			String newpass  = BCrypt.hashpw(newpassraw, BCrypt.gensalt());
			dao.changepass(username, newpass);
			User u1 = dao.login(username);
			session.setAttribute("succMsg", "Đổi mật khẩu thành công");
			session.setAttribute("user", u1);
			response.sendRedirect("changepass.jsp");
		}else {
			session.setAttribute("failedMsg", "Đổi mật khẩu thất bại");
			response.sendRedirect("changepass.jsp");
		}
		
		
	}

}
