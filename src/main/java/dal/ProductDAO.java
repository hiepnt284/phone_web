package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.Products;

public class ProductDAO extends dbContext{
	private CategoryDAO cdao;
	public List<Products> getAllByAd(){
		List<Products> list = new ArrayList<>();
		String sql = "select * from Products";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			cdao = new CategoryDAO();
			while(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Products> getAll(){
		List<Products> list = new ArrayList<>();
		String sql = "select * from Products where status = ?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "active");
			ResultSet rs = st.executeQuery();
			cdao = new CategoryDAO();
			while(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean addProduct(Products product) {
		try {
			String sql = "insert into Products"
					+ "(name,price,releasedate,describe,image,cid,status,quantity) "
					+ "values(?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, product.getName());
			st.setDouble(2, product.getPrice());
			st.setDate(3, product.getReleaseDate());
			st.setString(4, product.getDescribe());
			st.setString(5, product.getImage());
			st.setInt(6, product.getCategory().getId());
			st.setString(7, product.getStatus());
			st.setInt(8, product.getQuantity());
			int i = st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean deleteProduct(int id) {
		String sql = "delete from Products where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			int i=st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public Products findById(int id) {
		String sql = "select * from Products where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			cdao = new CategoryDAO();
			if(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				return p;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean update(Products p) {
		String sql = "update Products set name=?,price=?,releasedate=?,describe=?,status=?,quantity=? where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, p.getName());
			st.setDouble(2, p.getPrice());
			st.setDate(3, p.getReleaseDate());
			st.setString(4, p.getDescribe());
			st.setString(5, p.getStatus());
			st.setInt(6, p.getQuantity());
			st.setInt(7, p.getId());
			
			int i=st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateQuantity(Cart c) {
		String sql = "update Products set quantity = quantity - ? where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, c.getQuantity());
			st.setInt(2, c.getPid());
			
			int i=st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Products> getProductsByCid(int cid){
		List<Products> list = new ArrayList<>();
		String sql = "select * from Products where cid = ? and status = ?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, cid);
			st.setString(2, "active");
			ResultSet rs = st.executeQuery();
			cdao = new CategoryDAO();
			while(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Products> search(String key){
		List<Products> list = new ArrayList<>();
		String sql = "select * from Products where 1=1 and status = ?";
		if(key!=null &&!key.equals("")) {
			sql+=" and (name like '%"+key+"%' or describe like '%"+key+"%')";
		}
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "active");
			ResultSet rs = st.executeQuery();
			cdao = new CategoryDAO();
			while(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}
	
	public List<Products> getBestSeller(){
		String sql = "SELECT TOP 4 * FROM Products ORDER BY sold DESC";
		List<Products> list = new ArrayList<Products>();
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Products> getAdvancePro(){
		String sql = "SELECT TOP 4 * FROM Products ORDER BY price DESC";
		List<Products> list = new ArrayList<Products>();
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Products> getCheapPro(){
		String sql = "SELECT TOP 4 * FROM Products ORDER BY price ASC";
		List<Products> list = new ArrayList<Products>();
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Products p = new Products(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getDouble("price"),
						rs.getDate("releasedate"), 
						rs.getString("describe"),
						rs.getString("image"),
						cdao.getCategoryById(rs.getInt("cid")),
						rs.getString("status"),
						rs.getInt("quantity"));
				
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
