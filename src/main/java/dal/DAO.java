package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.Product;

public class DAO extends dbContext{
	public List<Category> getAll(){
		List<Category> list = new ArrayList();
		String sql = "select * from Categories";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Category c = new Category(rs.getInt("ID"),rs.getString("name"),rs.getString("describe"));
				list.add(c);
				
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public Category getCategoryById(int id) {
		String sql = "select * from Categories where id="+id;
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				Category c = new Category(rs.getInt("ID"),rs.getString("name"),rs.getString("describe"));
				return c;
				
			}
		}catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}
	
	public List<Product> getProductsByCid(int cid){
		List<Product> list = new ArrayList<>();
		String sql = "SELECT [ID]\r\n"
				+ "      ,[name]\r\n"
				+ "      ,[quantity]\r\n"
				+ "      ,[price]\r\n"
				+ "      ,[releaseDate]\r\n"
				+ "      ,[describe]\r\n"
				+ "      ,[image]\r\n"
				+ "      ,[cid]\r\n"
				+ "  FROM [dbo].[Products]\r\n"
				+ "  where 1=1";
		if(cid!=0) {
			sql+=" and cid="+cid;
		}
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getString("ID"));
				p.setName(rs.getString("name"));
				p.setQuantity(rs.getInt("quantity"));
				p.setPrice(rs.getDouble("price"));
				p.setReleaseDate(rs.getDate("releaseDate"));
				p.setDescribe(rs.getString("describe"));
				p.setImage(rs.getString("image"));
				p.setCategory(getCategoryById(rs.getInt("cid")));
				list.add(p);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}
	
	public List<Product> search(String key, Date from, Date to, Double price1, Double price2, int cid ){
		List<Product> list = new ArrayList<>();
		String sql = "select * from Products where 1=1";
		if(key!=null &&!key.equals("")) {
			sql+=" and (name like '%"+key+"%' or describe like '%"+key+"%')";
		}
		if(from!=null) {
			sql+=" and releaseDate>='"+from+"'";
		}
		if(to!=null) {
			sql+=" and releaseDate<='"+to+"'";
		}
		if(price1!=null) {
			sql+=" and price>="+price1;
		}
		if(price2!=null) {
			sql+=" and price<="+price2;
		}
		if(cid!=0) {
				sql+=" and cid="+cid;
		}
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getString("ID"));
				p.setName(rs.getString("name"));
				p.setQuantity(rs.getInt("quantity"));
				p.setPrice(rs.getDouble("price"));
				p.setReleaseDate(rs.getDate("releaseDate"));
				p.setDescribe(rs.getString("describe"));
				p.setImage(rs.getString("image"));
				p.setCategory(getCategoryById(rs.getInt("cid")));
				list.add(p);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}
}



