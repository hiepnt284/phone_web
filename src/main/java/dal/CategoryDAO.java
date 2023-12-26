package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.Products;

public class CategoryDAO extends dbContext{
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
				Category c = new Category(rs.getInt("id"),rs.getString("name"),rs.getString("describe"));
				return c;
				
			}
		}catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}
	public boolean addCategory(Category category) {
		try {
			String sql = "insert into Categories"
					+ "(name,describe) "
					+ "values(?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, category.getName());
			st.setString(2, category.getDescribe());
			int i = st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean deleteCategory(int id) {
		String sql = "delete from Categories where id=?";
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
	
	public Category findById(int id) {
		String sql = "select * from Categories where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				Category p = new Category(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("describe")
						);
				return p;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean update(Category p) {
		String sql = "update Categories set name=?,describe=? where id =?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, p.getName());
			st.setString(2, p.getDescribe());
			st.setInt(3, p.getId());
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
