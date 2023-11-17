package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import org.mindrot.jbcrypt.BCrypt;

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
	
	public User login(String username) {
		User u = null;
		try {
			String sql = "select * from Users where username=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			
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
	public boolean update(User u) {
		String sql = "update Users set fullname=?,phone=?,address=? where username=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, u.getFullname());
			st.setString(2, u.getPhone());
			st.setString(3, u.getAddress());
			st.setString(4, u.getUsername());
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
	
	public boolean changepass(String username, String password) {
		String sql = "update Users set password=? where username=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, password);
			st.setString(2, username);
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
