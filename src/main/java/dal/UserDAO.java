package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class UserDAO extends dbContext{
	public boolean signUp(User u) {
		try {
			String sql = "insert into Users(username,fullname,password,phone) values(?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, u.getUsername());
			st.setString(2, u.getFullname());
			st.setString(3, u.getPassword());
			st.setString(4, u.getPhone());
			int i = st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public User login(String username,String password) {
		User u = null;
		try {
			String sql = "select * from Users where username=? and password=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				u = new User(rs.getInt("id"),
						rs.getString("username"),
						rs.getString("fullname"),
						rs.getString("phone"),
						rs.getString("password"),
						rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public User getUserById(int id) {
		User u = null;
		try {
			String sql = "select * from Users where id = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				u = new User(rs.getInt("id"),
						rs.getString("username"),
						rs.getString("fullname"),
						rs.getString("phone"),
						rs.getString("password"),
						rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
}
}
