package model;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable{
	private int id;
	private User user;
	private List<OrderDetail> list;
	private String status;
	
	public Order(int id, User user, List<OrderDetail> list, String status) {
		super();
		this.id = id;
		this.user = user;
		this.list = list;
		this.status = status;
	}

	public Order() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrderDetail> getList() {
		return list;
	}

	public void setList(List<OrderDetail> list) {
		this.list = list;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
