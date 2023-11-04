package dal;

import java.sql.PreparedStatement;

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
}
