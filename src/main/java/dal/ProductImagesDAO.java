package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.ProductImages;
import model.Products;

public class ProductImagesDAO extends dbContext{
	public List<ProductImages> getAll(int pid){
		List<ProductImages> list = new ArrayList<ProductImages>();
		String sql = "select * from ProductImages where pid=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, pid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ProductImages c = new ProductImages(rs.getInt("id"),rs.getInt("pid"),rs.getString("img"));
				list.add(c);
				
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public ProductImages getProductImagesById(int id) {
		String sql = "select * from ProductImages where id="+id;
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				ProductImages c = new ProductImages(rs.getInt("id"),rs.getInt("pid"),rs.getString("img"));
				return c;
				
			}
		}catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}
	public boolean addProductImages(ProductImages p) {
		try {
			String sql = "insert into ProductImages"
					+ "(pid,img) "
					+ "values(?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, p.getPid());
			st.setString(2, p.getImage());
			int i = st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean deleteProductImages(int id) {
		String sql = "delete from ProductImages where pid=?";
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
	
	public ProductImages findById(int id) {
		String sql = "select * from ProductImages where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				ProductImages p = new ProductImages(
						rs.getInt("id"),
						rs.getInt("pid"),
						rs.getString("img")
						);
				return p;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean update(ProductImages p) {
		String sql = "update ProductImages set img=? where id =?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, p.getImage());
			st.setInt(2, p.getId());
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
}
