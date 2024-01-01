package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Banner;

public class BannerDAO extends dbContext{
	public List<Banner> getAll(){
		List<Banner> list = new ArrayList<>();
		String sql = "select * from Banners ";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Banner p = new Banner(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getString("img"),
						rs.getString("link"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Banner findById(int id) {
		String sql = "select * from Banners where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				Banner p = new Banner(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getString("img"),
						rs.getString("link"));
				return p;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public boolean update(Banner p) {
		String sql = "update Banners set img=?, link =? where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, p.getImg());
			st.setString(2, p.getLink());
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
