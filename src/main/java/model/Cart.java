package model;

public class Cart {
	private int uid;
	private int pid;
	private int quantity;
	private String name;
	private Double price;
	

	public Cart(int uid, int pid, int quantity) {
		this.uid = uid;
		this.pid = pid;
		this.quantity = quantity;
	}
	
	

	public Cart( int pid, int quantity, String name, Double price) {
		this.pid = pid;
		this.quantity = quantity;
		this.name = name;
		this.price = price;
	}



	public Cart() {
	}
	

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Double getPrice() {
		return price;
	}



	public void setPrice(Double price) {
		this.price = price;
	}

	
}