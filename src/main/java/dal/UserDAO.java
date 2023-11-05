package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class UserDAO extends dbContext{
	public boolean signUp(User u) {
		try {
			String sql = "insert into Users(username,password,phone) values(?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, u.getUsername());
			st.setString(2, u.getPassword());
			st.setString(3, u.getPhone());
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