package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

import model.Cart;
import model.Products;

public class CartDAO extends dbContext{
	public boolean addCart(Cart cart) {
		try {
			String sql = "insert into Carts"
					+ "(uid,pid,quantity) "
					+ "values(?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, cart.getUid());
			st.setInt(2, cart.getPid());
			st.setInt(3, cart.getQuantity());
			int i = st.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	public int countInCart(int uid) {
		try {
			String sql = "SELECT * "
					+ "FROM Carts "
					+ "WHERE uid = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, uid);
			ResultSet rs = st.executeQuery();
			int count=0;
			while(rs.next()) {
				count = count + rs.getInt("quantity");
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public Cart findCart(int uid, int pid) {
		try {
			String sql = "select * from Carts where uid=? and pid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, uid);
			st.setInt(2, pid);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return new Cart(
						rs.getInt("uid"),
						rs.getInt("pid"),
						rs.getInt("quantity"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean addOne(Cart cart) {
		try {
			String sql = "update Carts set quantity = quantity + 1 where uid =? and pid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, cart.getUid());
			st.setInt(2, cart.getPid());
			if(st.executeUpdate()==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean minusOne(Cart cart) {
		try {
			String sql = "update Carts set quantity = quantity - 1 where uid =? and pid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, cart.getUid());
			st.setInt(2, cart.getPid());
			if(st.executeUpdate()==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean remove(Cart cart) {
		try {
			String sql = "delete from Carts where uid =? and pid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, cart.getUid());
			st.setInt(2, cart.getPid());
			if(st.executeUpdate()==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Cart> getAll(int uid){
		List<Cart> list = new ArrayList<>();
		String sql = "select * from Carts where uid = ?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, uid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Cart c = new Cart(
						rs.getInt("uid"),
						rs.getInt("pid"),
						rs.getInt("quantity"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
}

	public boolean removeAll(int uid) {
		try {
			String sql = "delete from Carts where uid =?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, uid);
			if(st.executeUpdate()==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public void cartRealtime(int uid) {
	    List<Cart> list = this.getAll(uid);
	    ProductDAO pdao = new ProductDAO();
	    Iterator<Cart> iterator = list.iterator();
	    
	    while (iterator.hasNext()) {
	        Cart c = iterator.next();
	        int pe = pdao.findById(c.getPid()).getQuantity();
	        
	        if (pe > 0) {
	            if (c.getQuantity() > pe) {
	                c.setQuantity(pe);
	            }

	            try {
	                String sql = "update Carts set quantity = ? where uid = ? and pid = ?";
	                PreparedStatement st = con.prepareStatement(sql);
	                st.setInt(1, c.getQuantity());
	                st.setInt(2, c.getUid());
	                st.setInt(3, c.getPid());
	                st.executeUpdate();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        } else {
	            iterator.remove();
	            this.remove(c);
	        }
	    }
	}
}
