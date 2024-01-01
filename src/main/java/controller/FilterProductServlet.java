package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Products;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dal.CartDAO;
import dal.CategoryDAO;
import dal.ProductDAO;


public class FilterProductServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ProductDAO pdao = new ProductDAO();
			CategoryDAO cdao = new CategoryDAO();
			int cid;
			if(request.getParameter("cid")!=null) {
				cid = Integer.parseInt(request.getParameter("cid"));
			}else {
				cid=0;
			}
			int pri;
			if(request.getParameter("pri")!=null) {
				pri = Integer.parseInt(request.getParameter("pri"));
			}else {
				pri=0;
			}
			List<Products> list0 = new ArrayList<Products>();
			if(cid==0) {
				list0 = pdao.getAll();
			}else {
				list0 = pdao.getProductsByCid(cid);
			}
			List<Products> list = new ArrayList<Products>();
			if(pri==0) {
				for(Products p:list0) {
						list.add(p);
					}
				}
			if(pri==1) {
				for(Products p:list0) {
					if(p.getPrice()<5000) {
						list.add(p);
					}
				}
			}
			if(pri==2) {
				for(Products p:list0) {
					if(p.getPrice()>=5000&&p.getPrice()<=10000) {
						list.add(p);
						}
					}
			}
			if(pri==3) {
				for(Products p:list0) {
					if(p.getPrice()>=10000&&p.getPrice()<=15000) {
						list.add(p);
							}
						}
			}
			if(pri==4) {
				for(Products p:list0) {
					if(p.getPrice()>15000) {
						list.add(p);
								}
							}
			}
			List<Category> listcate = cdao.getAll();
			int page, numberperpage =8;
			int size = list.size();
			int numberpage = (size%numberperpage==0?(size/numberperpage):((size/numberperpage)+1));
			String rawpage = request.getParameter("page");
			if(rawpage==null) {
				page=1;
			}else {
				page = Integer.parseInt(rawpage);
				if(page==0){
					page=1;
				}
				if(page>numberpage) {
					page=numberpage;
				}
			}
			int start = (page-1)*numberperpage;
			int end = Math.min(page*numberperpage, size);
			List<Products>listp =  pdao.getListByPage(list, start, end);
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("user");
			if(u!=null) {
				CartDAO cartdao = new CartDAO();
				int count = cartdao.countInCart(u.getId());
				request.setAttribute("count", count);
			}
			request.setAttribute("listap", listp);
			request.setAttribute("numberpage", numberpage);
			request.setAttribute("page", page);
			request.setAttribute("a", "a");
			request.setAttribute("listcate", listcate);
			request.setAttribute("cidd", cid);
			request.setAttribute("pri", pri);
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
