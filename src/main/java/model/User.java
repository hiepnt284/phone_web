package model;

public class User {
	private int id;
	private String username;
	private String fullname;
	private String phone;
	private String password;
	private String address;
	
	
	public User() {
	}

	public User(String username, String fullname, String password, String phone) {
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.phone = phone;
	}

	public User(int id, String username,String fullname, String phone, String password, String address) {
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.phone = phone;
		this.password = password;
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
