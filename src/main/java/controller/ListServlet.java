package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import dal.DAO;


public class ListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO d=new DAO();
		List<Category> list = d.getAll();
		request.setAttribute("categories", list);
		String cid_raw = request.getParameter("key");
		String key = request.getParameter("key2");
		String from_raw = request.getParameter("fromdate");
		String to_raw = request.getParameter("todate");
		String fromprice_raw = request.getParameter("fromprice");
		String toprice_raw = request.getParameter("toprice");
		Double price1,price2;
		Date from,to;
		int cid;
		
		try {
			cid = (cid_raw==null)?0:Integer.parseInt(cid_raw);
			price1=(fromprice_raw==null || fromprice_raw.equals(""))
					?null:Double.parseDouble(fromprice_raw);
			price2=(toprice_raw==null || toprice_raw.equals(""))
					?null:Double.parseDouble(toprice_raw);
			from=(from_raw==null || from_raw.equals(""))
					?null:Date.valueOf(from_raw);
			to=(to_raw==null || to_raw.equals(""))
					?null:Date.valueOf(to_raw);
			List<Product> products = d.search(key, from, to, price1, price2, cid);
			request.setAttribute("products", products);
			request.setAttribute("cid", cid);
			request.setAttribute("price1", price1);
			request.setAttribute("price2", price2);
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			request.setAttribute("key", key);
			request.getRequestDispatcher("list.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			System.out.println(e);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}