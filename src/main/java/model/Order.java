package model;


public class Order {
	private int id;
	private String fullname;
	private String date;
	private int uid;
	private double totalmoney;
	private String status;
	private String address;
	private String phone;
	
	public Order() {
	}

	public Order(int id, String date, int uid, double totalmoney, String status, String address, String phone) {
		super();
		this.id = id;
		this.date = date;
		this.uid = uid;
		this.totalmoney = totalmoney;
		this.status = status;
		this.address = address;
		this.phone = phone;
	}

	public Order(String date, int uid, double totalmoney, String address, String phone) {
		this.date = date;
		this.uid = uid;
		this.totalmoney = totalmoney;
		this.address = address;
		this.phone = phone;
	}

	public Order(int id, String fullname, String date, int uid, double totalmoney, String status, String address,
			String phone) {
		this.id = id;
		this.fullname = fullname;
		this.date = date;
		this.uid = uid;
		this.totalmoney = totalmoney;
		this.status = status;
		this.address = address;
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public double getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(double totalmoney) {
		this.totalmoney = totalmoney;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	
	
	
}