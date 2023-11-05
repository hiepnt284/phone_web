package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;

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
}
