package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.Order;
import model.OrderDetail;
import model.Products;

public class OrderDAO extends dbContext{
	public void addOrder(Order order, List<Cart> list) {
		try {
			String sql = "insert into Orders(uid,date,totalmoney,address,phone) values(?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, order.getUid());
			st.setString(2, order.getDate());
			st.setDouble(3, order.getTotalmoney());
			st.setString(4, order.getAddress());
			st.setString(5, order.getPhone());
			st.executeUpdate();
			String sql1 = "select top 1 id from Orders order by id desc";
			PreparedStatement st1 = con.prepareStatement(sql1);
			ResultSet rs = st1.executeQuery();
			if(rs.next()) {
				int oid = rs.getInt("id");
				for(Cart i: list) {
					String sql2 = "insert into Orderdetails values(?,?,?,?)";
					PreparedStatement st2 = con.prepareStatement(sql2);
					st2.setInt(1, oid);
					st2.setInt(2, i.getPid());
					st2.setDouble(3, i.getPrice());
					st2.setInt(4, i.getQuantity());
					st2.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Order> getAll(){
		List<Order> list = new ArrayList<>();
		String sql = "select * from Orders order by id desc";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			UserDAO udao = new UserDAO();
			while(rs.next()) {
				Order o = new Order(
						rs.getInt("id"),
						udao.getUserById(rs.getInt("uid")).getFullname() , 
						rs.getString("date"),
						rs.getInt("uid"), 
						rs.getDouble("totalmoney"),
						rs.getString("status"),
						rs.getString("address"),
						rs.getString("phone"));
				
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<OrderDetail> getOrderDetailByOid(int oid){
		List<OrderDetail> list = new ArrayList<>();
		String sql = "select * from Orderdetails where oid = ?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, oid);
			ResultSet rs = st.executeQuery();
			ProductDAO pdao = new ProductDAO();
			while(rs.next()) {
				OrderDetail od = new OrderDetail(
						rs.getInt("pid"),
						pdao.findById(rs.getInt("pid")).getName() , 
						pdao.findById(rs.getInt("pid")).getImage(),
						rs.getInt("oid"), 
						rs.getInt("quantity"),
						rs.getDouble("price"));
				
				list.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Order> getOrderByUid(int uid){
		List<Order> list = new ArrayList<>();
		String sql = "select * from Orders where uid = ? ORDER BY id DESC";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, uid);
			ResultSet rs = st.executeQuery();
			UserDAO udao = new UserDAO();
			while(rs.next()) {
				Order o = new Order(
						rs.getInt("id"),
						udao.getUserById(rs.getInt("uid")).getFullname() , 
						rs.getString("date"),
						rs.getInt("uid"), 
						rs.getDouble("totalmoney"),
						rs.getString("status"),
						rs.getString("address"),
						rs.getString("phone"));
				
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean cancelOrder(int oid) {
		String sql ="update Orders set status=? where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "Đã hủy");
			st.setInt(2, oid);
			
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
	public boolean acceptOrder(int oid) {
		String sql ="update Orders set status=? where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "Đã xác nhận");
			st.setInt(2, oid);
			
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
	public boolean deliveryOrder(int oid) {
		String sql ="update Orders set status=? where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "Đang giao");
			st.setInt(2, oid);
			
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
	public boolean completeOrder(int oid) {
		String sql ="update Orders set status=? where id=?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "Đã hoàn thành");
			st.setInt(2, oid);
			
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
